#!/usr/bin/env bash
#
# Enforces the migration conventions documented in CLAUDE.md.
# Runs in CI and is safe to run locally: `./scripts/lint-migrations.sh`.
#
# Checks:
#   1. Every deploy/revert/verify script name is prefixed YYYYMMDDHHMMSS_
#   2. No AUTOINCREMENT and no INTEGER PRIMARY KEY (native uuid keys only)
#   3. deploy CREATE ... uses IF NOT EXISTS (idempotency)
#   4. revert DROP ... uses IF EXISTS (idempotency)
#   5. Any deploy that CREATEs a table also defines created_at, updated_at,
#      and a trg_*_updated_at trigger
#   6. Any revert whose deploy created a table DROPs its updated_at trigger
#
# Escape hatch: the idempotency checks (3, 4) skip any line carrying a
# `-- lint-ignore` comment, for any deliberately non-idempotent statement that
# CLAUDE.md exempts. The round-trip CI job remains the functional backstop for
# those changes.
#
set -uo pipefail

fail=0
err() { echo "::error::$1"; fail=1; }

# 1. Timestamp-prefixed filenames -------------------------------------------
for dir in deploy revert verify; do
    for f in "$dir"/*.sql; do
        [ -e "$f" ] || continue
        base=$(basename "$f")
        if ! [[ "$base" =~ ^[0-9]{14}_ ]]; then
            err "$f: filename must start with a 14-digit UTC timestamp prefix (YYYYMMDDHHMMSS_)"
        fi
    done
done

# 2. Forbidden key idioms (deploy only) -------------------------------------
if grep -rniE 'AUTOINCREMENT' deploy/*.sql 2>/dev/null; then
    err "AUTOINCREMENT is forbidden — use 'id uuid PRIMARY KEY DEFAULT gen_random_uuid()'"
fi
if grep -rniE 'INTEGER[[:space:]]+PRIMARY[[:space:]]+KEY' deploy/*.sql 2>/dev/null; then
    err "INTEGER PRIMARY KEY is forbidden — use 'id uuid PRIMARY KEY DEFAULT gen_random_uuid()'"
fi

# Flags non-idempotent CREATE/DROP statements. Inspects SQL only: the `--`
# comment tail is stripped before matching (so prose mentioning "DROP TABLE"
# is ignored), and any line carrying `lint-ignore` is skipped entirely.
#   $1 = verb (create|drop), $2 = required guard regex, $3.. = files
check_idempotency() {
    local verb="$1" guard="$2"; shift 2
    local f offenders
    for f in "$@"; do
        [ -e "$f" ] || continue
        offenders=$(awk -v verb="$verb" -v guard="$guard" '
            /lint-ignore/ { next }
            { code = $0; sub(/--.*/, "", code); lc = tolower(code) }
            lc ~ verb "[ \t]+(table|index|view|trigger)" && lc !~ guard \
                { print NR ": " $0 }
        ' "$f")
        if [ -n "$offenders" ]; then
            if [ "$verb" = create ]; then
                err "$f: every CREATE TABLE/INDEX/VIEW/TRIGGER must use IF NOT EXISTS"
            else
                err "$f: every DROP TABLE/INDEX/VIEW/TRIGGER must use IF EXISTS"
            fi
            echo "$offenders"
        fi
    done
}

# 3. Idempotent CREATE in deploy --------------------------------------------
check_idempotency create 'if[ \t]+not[ \t]+exists' deploy/*.sql

# 4. Idempotent DROP in revert ----------------------------------------------
check_idempotency drop 'if[ \t]+exists' revert/*.sql

# 5. Timestamp columns + trigger on table-creating deploys ------------------
for f in deploy/*.sql; do
    [ -e "$f" ] || continue
    grep -qiE 'CREATE[[:space:]]+TABLE' "$f" || continue
    grep -qiE '\bcreated_at\b'                 "$f" || err "$f: table-creating migration missing created_at column"
    grep -qiE '\bupdated_at\b'                 "$f" || err "$f: table-creating migration missing updated_at column"
    # Postgres has no CREATE TRIGGER IF NOT EXISTS; CREATE OR REPLACE TRIGGER is
    # the idempotent form. Accept either guard.
    grep -qiE 'CREATE[[:space:]]+(OR[[:space:]]+REPLACE[[:space:]]+)?TRIGGER([[:space:]]+IF[[:space:]]+NOT[[:space:]]+EXISTS)?[[:space:]]+trg_[a-z_]+_updated_at' "$f" \
        || err "$f: table-creating migration missing trg_<table>_updated_at trigger"
done

# 6. Revert drops the updated_at trigger ------------------------------------
for f in revert/*.sql; do
    [ -e "$f" ] || continue
    deploy="deploy/$(basename "$f")"
    [ -e "$deploy" ] || continue
    grep -qiE 'CREATE[[:space:]]+TABLE' "$deploy" || continue
    grep -qiE 'DROP[[:space:]]+TRIGGER[[:space:]]+IF[[:space:]]+EXISTS[[:space:]]+trg_[a-z_]+_updated_at' "$f" \
        || err "$f: revert must DROP TRIGGER IF EXISTS trg_<table>_updated_at before dropping the table"
done

if [ "$fail" -ne 0 ]; then
    echo
    echo "Migration lint failed. See CLAUDE.md for the conventions."
    exit 1
fi
echo "Migration lint passed."
