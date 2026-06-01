-- Revert practice-exam-db:20260531101722_add_exam_metadata from pg

BEGIN;

ALTER TABLE exams
    DROP COLUMN IF EXISTS category_id,
    DROP COLUMN IF EXISTS difficulty,
    DROP COLUMN IF EXISTS duration_mins,
    DROP COLUMN IF EXISTS students,
    DROP COLUMN IF EXISTS rating,
    DROP COLUMN IF EXISTS popular,
    DROP COLUMN IF EXISTS is_new;

COMMIT;
