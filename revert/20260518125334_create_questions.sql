-- Revert practice-exam-db:create_questions from sqlite

BEGIN;

DROP TRIGGER IF EXISTS trg_questions_updated_at;
DROP INDEX IF EXISTS idx_questions_exam_id;
DROP TABLE IF EXISTS questions;

COMMIT;
