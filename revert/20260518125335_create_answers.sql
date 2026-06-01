-- Revert practice-exam-db:create_answers from pg

BEGIN;

DROP TRIGGER IF EXISTS trg_answers_updated_at ON answers;
DROP INDEX IF EXISTS idx_answers_question_id;
DROP TABLE IF EXISTS answers;

COMMIT;
