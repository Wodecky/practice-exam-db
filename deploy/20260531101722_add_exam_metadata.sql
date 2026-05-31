-- Deploy practice-exam-db:20260531101722_add_exam_metadata to sqlite
-- requires: 20260531101721_create_categories
-- requires: 20260518125243_create_exams

BEGIN;

-- Full table reconstruction required because SQLite cannot add NOT NULL columns
-- without a DEFAULT via ALTER TABLE (duration_mins, popular, is_new are NOT NULL).

DROP TABLE IF EXISTS exams_new;

CREATE TABLE exams_new (
    id            TEXT    NOT NULL PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    title         TEXT    NOT NULL,
    description   TEXT,
    category_id   TEXT    REFERENCES categories(id),
    difficulty    INTEGER CHECK(difficulty BETWEEN 0 AND 100),
    duration_mins INTEGER NOT NULL,
    students      INTEGER,
    rating        REAL    CHECK(rating BETWEEN 1.0 AND 5.0),
    popular       INTEGER NOT NULL CHECK(popular IN (0, 1)),
    is_new        INTEGER NOT NULL CHECK(is_new IN (0, 1)),
    created_at    TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO exams_new (id, title, description, category_id,
                       duration_mins, rating, popular, is_new,
                       created_at, updated_at)
SELECT id, title, description, NULL,
       120,
       ROUND(1.0 + (ABS(RANDOM()) % 41) * 0.1, 1),
       RANDOM() & 1,
       RANDOM() & 1,
       created_at, updated_at
FROM exams;

DROP TRIGGER IF EXISTS trg_exams_updated_at;
DROP TABLE exams;
ALTER TABLE exams_new RENAME TO exams;

CREATE TRIGGER IF NOT EXISTS trg_exams_updated_at
AFTER UPDATE ON exams
FOR EACH ROW
WHEN NEW.updated_at IS OLD.updated_at
BEGIN
    UPDATE exams SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

COMMIT;
