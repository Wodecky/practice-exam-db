-- Verify practice-exam-db:create_answers on pg

BEGIN;

SELECT id, question_id, text, is_correct, created_at, updated_at
  FROM answers
 WHERE false;

ROLLBACK;
