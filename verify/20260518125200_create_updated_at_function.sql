-- Verify practice-exam-db:20260518125200_create_updated_at_function on pg

-- Casting the signature to regprocedure raises an error if the function
-- does not exist, failing the verify.
SELECT 'set_updated_at()'::regprocedure;
