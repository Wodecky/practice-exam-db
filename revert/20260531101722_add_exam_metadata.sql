-- Revert practice-exam-db:20260531101722_add_exam_metadata from sqlite

BEGIN;

DROP TABLE IF EXISTS exams_old;

CREATE TABLE exams_old (
    id          TEXT NOT NULL PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    title       TEXT NOT NULL,
    description TEXT,
    created_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO exams_old (id, title, description, created_at, updated_at)
SELECT id, title, description, created_at, updated_at FROM exams;

DROP TRIGGER IF EXISTS trg_exams_updated_at;
DROP TABLE exams;
ALTER TABLE exams_old RENAME TO exams;

CREATE TRIGGER IF NOT EXISTS trg_exams_updated_at
AFTER UPDATE ON exams
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE exams SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

COMMIT;
