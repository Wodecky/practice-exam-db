-- Verify practice-exam-db:create_questions on sqlite

BEGIN;

SELECT id, exam_id, text, created_at, updated_at
  FROM questions
 WHERE 1 = 0;

ROLLBACK;
