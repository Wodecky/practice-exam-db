-- Deploy practice-exam-db:20260531101721_create_categories to pg
-- requires: 20260518125200_create_updated_at_function

BEGIN;

CREATE TABLE IF NOT EXISTS categories (
    id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name       text NOT NULL,
    icon       text NOT NULL,
    color      text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE TRIGGER trg_categories_updated_at
BEFORE UPDATE ON categories
FOR EACH ROW
WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)
EXECUTE FUNCTION set_updated_at();

COMMIT;
