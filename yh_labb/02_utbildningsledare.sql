-- ============================================================
-- 02_utbildningsledare.sql
-- ============================================================

CREATE TABLE utbildningsledare (
    id          SERIAL PRIMARY KEY,
    fornamn     VARCHAR(100) NOT NULL,
    efternamn   VARCHAR(100) NOT NULL,
    email       VARCHAR(200) NOT NULL UNIQUE
);

-- Sensitive data in separate table for access control (GDPR + 3NF)
CREATE TABLE ul_personuppgifter (
    id              SERIAL PRIMARY KEY,
    ul_id           INT         NOT NULL UNIQUE REFERENCES utbildningsledare(id) ON DELETE CASCADE,
    personnummer    VARCHAR(13) NOT NULL UNIQUE
);