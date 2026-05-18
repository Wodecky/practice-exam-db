-- Deploy practice-exam-db:create_answers to sqlite
-- requires: create_questions

BEGIN;

CREATE TABLE IF NOT EXISTS answers (
    id          TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    question_id TEXT NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    text        TEXT NOT NULL,
    is_correct  INTEGER NOT NULL DEFAULT 0 CHECK (is_correct IN (0, 1)),
    created_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_answers_question_id ON answers(question_id);

CREATE TRIGGER IF NOT EXISTS trg_answers_updated_at
AFTER UPDATE ON answers
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE answers SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

COMMIT;
