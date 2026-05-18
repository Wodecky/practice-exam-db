-- Verify practice-exam-db:create_exams on sqlite

BEGIN;

SELECT id, title, description, created_at, updated_at
  FROM exams
 WHERE 1 = 0;

ROLLBACK;
