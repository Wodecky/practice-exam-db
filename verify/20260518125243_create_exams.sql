-- Verify practice-exam-db:create_exams on pg

BEGIN;

SELECT id, title, description, created_at, updated_at
  FROM exams
 WHERE false;

ROLLBACK;
