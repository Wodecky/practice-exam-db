# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

`practice-exam-db` manages the PostgreSQL database schema for a practice exam application using [Sqitch](https://sqitch.org/) for migrations. Each change consists of three scripts: deploy, revert, and verify.

A local Postgres for development is provided via `compose.yaml` (Postgres 17). Copy `.env.example` to `.env`, then:

```bash
docker compose up -d db   # start Postgres in the background
```

## Sqitch setup

Install Sqitch with PostgreSQL support:

```bash
# macOS
brew install sqitch --with-postgres-support

# Debian/Ubuntu
apt-get install sqitch libdbd-pg-perl postgresql-client

# Via CPAN
cpan App::Sqitch DBD::Pg
```

Sqitch reads the Postgres password from `PGPASSWORD`, `~/.pgpass`, or the target URI — it is intentionally kept out of `sqitch.conf`. For local dev: `export PGPASSWORD=exam`.

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
sqitch deploy db:pg://exam@localhost:5432/practice_exam
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

Changes are registered in `sqitch.plan` in dependency order. The `sqitch.conf` sets the `pg` engine and the `db:pg://exam@localhost:5432/practice_exam` default target.

## Seed data: migrations vs. `seed/`

Two kinds of seed data are handled differently:

- **Reference / lookup data** (e.g. the exam `categories`) — small, fixed sets the
  app needs to function. Seed these via a **Sqitch migration** with fixed UUID
  primary keys and `INSERT ... ON CONFLICT (id) DO NOTHING` so deploy stays
  idempotent and revert can delete exactly those rows. These run automatically on
  `sqitch deploy`.
- **Bulk content data** (e.g. individual exams with their questions and answers) —
  large, optional, environment-specific. Keep these as plain `.sql` files under
  `seed/`, **out of `deploy/`/`revert/`/`verify/` and out of `sqitch.plan`** so
  `sqitch deploy` never runs them. Apply them by hand:

  ```bash
  psql -h localhost -U exam -d practice_exam -v ON_ERROR_STOP=1 \
    -f seed/0020_20192_ldm_2019_fall.sql
  ```

  Make `seed/` scripts re-runnable (delete-then-insert by fixed id), and use the
  same UUID hex id format as migrations. Postgres accepts dash-less 32-char hex
  strings as `uuid` input, so the literals match the migration format.

## Writing verify scripts

Verify scripts must **fail** (non-zero exit / SQL error) if the migration has not been applied, and **succeed** if it has. The standard pattern is to query the object and let the query fail if it doesn't exist:

```sql
-- verify/create_users.sql
SELECT id, name, email FROM users WHERE false;
```

For non-table objects, cast the name to a registry type so a missing object errors: `SELECT 'set_updated_at()'::regprocedure;` (functions), `SELECT 'users'::regclass;` (tables/views). To assert on **data** (e.g. seeded rows), use a `DO` block that `RAISE EXCEPTION` on mismatch.

## Primary keys

Always use native `uuid` primary keys with a database-generated default:

```sql
id uuid PRIMARY KEY DEFAULT gen_random_uuid()
```

`gen_random_uuid()` is built into Postgres (no extension needed). Never use `INTEGER PRIMARY KEY`, `serial`, `bigserial`, identity columns, or `AUTOINCREMENT`.

## Timestamps

Every table must have:

- `created_at timestamptz NOT NULL DEFAULT now()`
- `updated_at timestamptz NOT NULL DEFAULT now()`

`updated_at` must be maintained by the database, not the application. A single shared trigger function lives in the first migration (`create_updated_at_function`):

```sql
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END;
$$;
```

Every table-creating migration must `-- requires` that change and mount a trigger that calls it:

```sql
CREATE OR REPLACE TRIGGER trg_<table>_updated_at
BEFORE UPDATE ON <table>
FOR EACH ROW
WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)
EXECUTE FUNCTION set_updated_at();
```

`BEFORE UPDATE` lets the function set `NEW.updated_at` directly (no recursive `UPDATE`). The `WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)` guard lets the application override `updated_at` explicitly (e.g., for backfills) without the trigger clobbering the value.

Revert scripts must `DROP TRIGGER IF EXISTS trg_<table>_updated_at ON <table>` before dropping the table.

## Idempotency

All migrations must be idempotent so they can be safely re-run after partial failures or when applied by hand.

- Deploy scripts: use `CREATE TABLE IF NOT EXISTS`, `CREATE INDEX IF NOT EXISTS`, `CREATE OR REPLACE FUNCTION`, `CREATE OR REPLACE TRIGGER`, and `ALTER TABLE ... ADD COLUMN IF NOT EXISTS`.
- Revert scripts: use `DROP TABLE IF EXISTS`, `DROP INDEX IF EXISTS`, `DROP FUNCTION IF EXISTS`, `DROP TRIGGER IF EXISTS ... ON <table>`, and `ALTER TABLE ... DROP COLUMN IF EXISTS`.
- Reference-data inserts: `INSERT ... ON CONFLICT (id) DO NOTHING`.

Unlike SQLite, Postgres `ALTER TABLE` supports **in-place** changes: `ADD COLUMN` / `DROP COLUMN` (with `IF [NOT] EXISTS`), `ALTER COLUMN ... TYPE ... USING ...`, and `ADD`/`DROP CONSTRAINT`. There is no need to reconstruct a table to add a column or change a type, and DDL is transactional (wrap a change in `BEGIN; ... COMMIT;` and a failure rolls back cleanly).

## Dependencies between changes

Declare dependencies in `sqitch.plan` or via the `--requires` flag:

```bash
sqitch add add_index_users --requires create_users -n "Add index on users.email"
```
