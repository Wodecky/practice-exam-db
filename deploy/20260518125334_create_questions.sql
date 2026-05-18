-- Deploy practice-exam-db:create_questions to sqlite
-- requires: create_exams

BEGIN;

CREATE TABLE IF NOT EXISTS questions (
    id         TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    exam_id    TEXT NOT NULL REFERENCES exams(id) ON DELETE CASCADE,
    text       TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_questions_exam_id ON questions(exam_id);

CREATE TRIGGER IF NOT EXISTS trg_questions_updated_at
AFTER UPDATE ON questions
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE questions SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

COMMIT;
