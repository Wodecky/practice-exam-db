-- Deploy practice-exam-db:20260531101722_add_exam_metadata to pg
-- requires: 20260531101721_create_categories
-- requires: 20260518125243_create_exams

-- On Postgres this is a plain in-place ALTER: no table reconstruction, no
-- foreign-key juggling, no data backfill. NOT NULL columns get a DEFAULT so
-- existing rows are filled in place. ADD COLUMN IF NOT EXISTS keeps it idempotent.

BEGIN;

ALTER TABLE exams
    ADD COLUMN IF NOT EXISTS category_id   uuid REFERENCES categories(id),
    ADD COLUMN IF NOT EXISTS difficulty    int CHECK (difficulty BETWEEN 0 AND 100),
    ADD COLUMN IF NOT EXISTS duration_mins int NOT NULL DEFAULT 120,
    ADD COLUMN IF NOT EXISTS students      int,
    ADD COLUMN IF NOT EXISTS rating        numeric(2,1) CHECK (rating BETWEEN 1.0 AND 5.0),
    ADD COLUMN IF NOT EXISTS popular       boolean NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS is_new        boolean NOT NULL DEFAULT false;

COMMIT;
