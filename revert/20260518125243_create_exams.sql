-- Revert practice-exam-db:create_exams from pg

BEGIN;

DROP TRIGGER IF EXISTS trg_exams_updated_at ON exams;
DROP TABLE IF EXISTS exams;

COMMIT;
