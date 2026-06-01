-- Revert practice-exam-db:20260531101721_create_categories from pg

BEGIN;

DROP TRIGGER IF EXISTS trg_categories_updated_at ON categories;
DROP TABLE IF EXISTS categories;

COMMIT;
