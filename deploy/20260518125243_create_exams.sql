-- Deploy practice-exam-db:create_exams to pg
-- requires: 20260518125200_create_updated_at_function

BEGIN;

CREATE TABLE IF NOT EXISTS exams (
    id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title       text NOT NULL,
    description text,
    created_at  timestamptz NOT NULL DEFAULT now(),
    updated_at  timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE TRIGGER trg_exams_updated_at
BEFORE UPDATE ON exams
FOR EACH ROW
WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)
EXECUTE FUNCTION set_updated_at();

COMMIT;
