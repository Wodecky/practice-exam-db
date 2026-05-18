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

## Dependencies between changes

Declare dependencies in `sqitch.plan` or via the `--requires` flag:

```bash
sqitch add add_index_users --requires create_users -n "Add index on users.email"
```
