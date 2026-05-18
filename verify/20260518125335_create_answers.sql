-- Verify practice-exam-db:create_answers on sqlite

BEGIN;

SELECT id, question_id, text, is_correct, created_at, updated_at
  FROM answers
 WHERE 1 = 0;

ROLLBACK;
