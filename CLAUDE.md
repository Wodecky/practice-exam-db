# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

`practice-exam-db` manages the SQLite database schema for a practice exam application using [Sqitch](https://sqitch.org/) for migrations. Each change consists of three scripts: deploy, revert, and verify.

## Sqitch setup

Install Sqitch with SQLite support:

```bash
# macOS
brew install sqitch --with-sqlite-support

# Debian/Ubuntu
apt-get install sqitch libdbd-sqlite3-perl

# Via CPAN
cpan App::Sqitch DBD::SQLite
```

## Common commands

```bash
# Add a new migration (creates deploy/, revert/, verify/ scripts automatically)
sqitch add <change_name> -n "Description of the change"

# Apply all pending migrations
sqitch deploy

# Roll back the last migration
sqitch revert --to @HEAD^

# Verify the current state
sqitch verify

# Check migration status
sqitch status

# Deploy to a specific target
sqitch deploy db:sqlite:practice_exam.db
```

## Migration naming

Every change name must be prefixed with a UTC timestamp in `YYYYMMDDHHMMSS` format so that directory listings under `deploy/`, `revert/`, and `verify/` match deployment order:

```bash
sqitch add 20260518145643_create_exams -n "Create exams table"
```

The prefix becomes part of the change name in `sqitch.plan`, so `--requires` references and revert targets include it (e.g., `sqitch revert --to 20260518145643_create_exams`). Generate the prefix from the current UTC time at add-time with `date -u +%Y%m%d%H%M%S`.

## Migration structure

Each migration lives in three files:

```
deploy/<change_name>.sql   ← forward migration
revert/<change_name>.sql   ← rollback (must exactly undo deploy)
verify/<change_name>.sql   ← assertion that deploy succeeded (should error if not applied)
```

Changes are registered in `sqitch.plan` in dependency order. The `sqitch.conf` points to `practice_exam.db` as the default target.

## Writing verify scripts

Verify scripts must **fail** (non-zero exit / SQL error) if the migration has not been applied, and **succeed** if it has. The standard pattern for SQLite is to query the object and let the query fail if it doesn't exist:

```sql
-- verify/create_users.sql
SELECT id, name, email FROM users WHERE 1=0;
```

## Primary keys

Always use UUID primary keys stored as `TEXT`. SQLite has no native UUID type — use `randomblob(16)` hex-encoded as the default:

```sql
id TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(16))))
```

Never use `INTEGER PRIMARY KEY` or `AUTOINCREMENT`.

## Timestamps

Every table must have:

- `created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP`
- `updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP`

`updated_at` must be maintained by the database, not the application. Add an `AFTER UPDATE` trigger alongside every table:

```sql
CREATE TRIGGER IF NOT EXISTS trg_<table>_updated_at
AFTER UPDATE ON <table>
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE <table> SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;
```

The `WHEN NEW.updated_at IS OLD.updated_at` guard prevents trigger recursion and lets the application override `updated_at` explicitly (e.g., for backfills) without the trigger clobbering the value.

Revert scripts must `DROP TRIGGER IF EXISTS trg_<table>_updated_at` before dropping the table.

## Idempotency

All migrations must be idempotent so they can be safely re-run after partial failures or when applied by hand.

- Deploy scripts: use `CREATE TABLE IF NOT EXISTS`, `CREATE INDEX IF NOT EXISTS`, `CREATE VIEW IF NOT EXISTS`, etc.
- Revert scripts: use `DROP TABLE IF EXISTS`, `DROP INDEX IF EXISTS`, etc.
- SQLite's `ALTER TABLE` has no `IF NOT EXISTS` clause. Guard column additions with a `PRAGMA table_info(<table>)` check in application code, or accept that `ALTER TABLE` steps are not idempotent and must be split into their own change.

## Dependencies between changes

Declare dependencies in `sqitch.plan` or via the `--requires` flag:

```bash
sqitch add add_index_users --requires create_users -n "Add index on users.email"
```
