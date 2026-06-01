-- Deploy practice-exam-db:20260531180039_seed_categories to pg
-- requires: 20260531101721_create_categories

-- Seeds the five exam categories used by ALL_EXAMS in practice-exam-web
-- (exam-list.data.ts). The "Wszystkie" / all-filter pseudo-category is
-- intentionally excluded since no exam belongs to it. Icons are the
-- representative Material Symbols name for each category; colors use the
-- app's palette tokens (primary / secondary / tertiary).
-- ON CONFLICT DO NOTHING on the fixed UUID primary keys keeps this idempotent.
-- The dash-less hex literals are valid uuid input and cast automatically.

BEGIN;

INSERT INTO categories (id, name, icon, color) VALUES
    ('163b5f8525cf4bb3c5818d97ab052737', 'Akademickie', 'school',          'primary'),
    ('4eca0b3fa852c239c678aa9f02288313', 'Technologia', 'code',            'tertiary'),
    ('6616e8ab0466c3da83b73d3019b7644b', 'Zawodowe',    'workspaces',      'secondary'),
    ('221ec27e93e319ba4a06151abd49ce8d', 'Medyczne',    'stethoscope',     'primary'),
    ('ab62321b0ed1d49110ec817168436ea9', 'Licencje',    'directions_car',  'tertiary')
ON CONFLICT (id) DO NOTHING;

COMMIT;
