-- Verify practice-exam-db:20260531180039_seed_categories on pg

-- Asserts all five seeded categories are present; RAISE EXCEPTION fails the
-- verify (and its transaction) if any are missing.
DO $$
BEGIN
    IF (SELECT count(*) FROM categories WHERE id IN (
        '163b5f8525cf4bb3c5818d97ab052737',
        '4eca0b3fa852c239c678aa9f02288313',
        '6616e8ab0466c3da83b73d3019b7644b',
        '221ec27e93e319ba4a06151abd49ce8d',
        'ab62321b0ed1d49110ec817168436ea9'
    )) <> 5 THEN
        RAISE EXCEPTION 'verify failed: missing seeded categories';
    END IF;
END $$;
