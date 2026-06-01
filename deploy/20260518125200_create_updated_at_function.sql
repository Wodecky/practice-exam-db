-- Deploy practice-exam-db:20260518125200_create_updated_at_function to pg

-- Shared trigger function that stamps updated_at on every row update. One copy
-- serves every table's trg_<table>_updated_at trigger. The per-table WHEN guard
-- (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at) lets the application
-- override updated_at explicitly without this function clobbering the value.

BEGIN;

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

COMMIT;
