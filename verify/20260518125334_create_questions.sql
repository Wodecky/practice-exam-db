-- Verify practice-exam-db:create_questions on pg

BEGIN;

SELECT id, exam_id, text, created_at, updated_at
  FROM questions
 WHERE false;

ROLLBACK;
