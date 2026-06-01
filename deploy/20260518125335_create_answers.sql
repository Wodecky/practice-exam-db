-- Deploy practice-exam-db:create_answers to pg
-- requires: create_questions

BEGIN;

CREATE TABLE IF NOT EXISTS answers (
    id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id uuid NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    text        text NOT NULL,
    is_correct  boolean NOT NULL DEFAULT false,
    created_at  timestamptz NOT NULL DEFAULT now(),
    updated_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_answers_question_id ON answers(question_id);

CREATE OR REPLACE TRIGGER trg_answers_updated_at
BEFORE UPDATE ON answers
FOR EACH ROW
WHEN (NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at)
EXECUTE FUNCTION set_updated_at();

COMMIT;
