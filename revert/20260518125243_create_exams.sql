-- Revert practice-exam-db:create_exams from sqlite

BEGIN;

DROP TRIGGER IF EXISTS trg_exams_updated_at;
DROP TABLE IF EXISTS exams;

COMMIT;
