-- Revert practice-exam-db:20260531101722_add_exam_metadata from sqlite

-- Foreign keys MUST be disabled for the DROP TABLE below: questions.exam_id has
-- ON DELETE CASCADE, so with foreign_keys=ON dropping "exams" would cascade-delete
-- every question and answer. The PRAGMA is a no-op inside a transaction, so it is
-- issued before BEGIN; foreign_key_check before COMMIT verifies integrity.
PRAGMA foreign_keys = OFF;

BEGIN;

DROP TABLE IF EXISTS exams_old;

CREATE TABLE exams_old (  -- lint-ignore: table-reconstruction scratch table (mirrors the deploy, see header)
    id          TEXT NOT NULL PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    title       TEXT NOT NULL,
    description TEXT,
    created_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO exams_old (id, title, description, created_at, updated_at)
SELECT id, title, description, created_at, updated_at FROM exams;

DROP TRIGGER IF EXISTS trg_exams_updated_at;
DROP TABLE exams;  -- lint-ignore: table-reconstruction swap (mirrors the deploy, see header)
ALTER TABLE exams_old RENAME TO exams;

CREATE TRIGGER IF NOT EXISTS trg_exams_updated_at
AFTER UPDATE ON exams
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE exams SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Fail the transaction if the reconstruction left any dangling references.
PRAGMA foreign_key_check;

COMMIT;
