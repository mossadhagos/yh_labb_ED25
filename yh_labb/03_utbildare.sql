-- ============================================================
-- 03_utbildare.sql
-- ============================================================

CREATE TABLE utbildare (
    id          SERIAL PRIMARY KEY,
    fornamn     VARCHAR(100) NOT NULL,
    efternamn   VARCHAR(100) NOT NULL,
    email       VARCHAR(200) NOT NULL UNIQUE,
    typ         VARCHAR(20)  NOT NULL CHECK (typ IN ('anstald', 'konsult'))
);

CREATE TABLE konsult (
    id                  SERIAL PRIMARY KEY,
    utbildare_id        INT          NOT NULL UNIQUE REFERENCES utbildare(id) ON DELETE CASCADE,
    foretag_id          INT          NOT NULL REFERENCES foretag(id),
    arvode_per_timma    NUMERIC(8,2) NOT NULL CHECK (arvode_per_timma > 0)
);