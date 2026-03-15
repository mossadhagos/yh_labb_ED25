-- ============================================================
-- 04_klass.sql
-- ============================================================

CREATE TABLE klass (
    id              SERIAL PRIMARY KEY,
    namn            VARCHAR(100) NOT NULL,
    program_id      INT          NOT NULL REFERENCES program(id),
    ul_id           INT          NOT NULL REFERENCES utbildningsledare(id),
    anlaggning_id   INT          NOT NULL REFERENCES anlaggning(id),
    start_datum     DATE,
    slut_datum      DATE,
    CHECK (slut_datum IS NULL OR slut_datum > start_datum)
);