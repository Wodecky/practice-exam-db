-- Revert practice-exam-db:20260518125200_create_updated_at_function from pg

BEGIN;

DROP FUNCTION IF EXISTS set_updated_at();

COMMIT;
