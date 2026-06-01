-- Verify practice-exam-db:20260531101722_add_exam_metadata on pg

SELECT category_id, difficulty, duration_mins, students, rating, popular, is_new
FROM exams WHERE false;
