-- Deploy practice-exam-db:create_questions to pg
-- requires: create_exams

BEGIN;

CREATE TABLE IF NOT EXISTS questions (
    id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    exam_id    uuid NOT NULL REFERENCES exams(id) ON DELETE CASCADE,
    text       text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_questions_exam_id ON questions(exam_id);

CREATE OR REPLACE TRIGGER trg_questions_updated_at
BEFORE UPDATE ON questions
FOR EACH ROW
WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)
EXECUTE FUNCTION set_updated_at();

COMMIT;
