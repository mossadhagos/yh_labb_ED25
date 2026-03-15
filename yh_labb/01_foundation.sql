-- ============================================================
-- 01_foundation.sql
-- Tables with no foreign key dependencies
-- ============================================================

CREATE TABLE anlaggning (
    id      SERIAL PRIMARY KEY,
    namn    VARCHAR(100) NOT NULL,
    ort     VARCHAR(100) NOT NULL,
    adress  VARCHAR(200) NOT NULL
);

CREATE TABLE foretag (
    id                   SERIAL PRIMARY KEY,
    namn                 VARCHAR(200) NOT NULL,
    organisationsnummer  VARCHAR(11)  NOT NULL UNIQUE,
    f_skatt              BOOLEAN      NOT NULL DEFAULT FALSE,
    adress               VARCHAR(200) NOT NULL
);

CREATE TABLE program (
    id           SERIAL PRIMARY KEY,
    namn         VARCHAR(200) NOT NULL,
    beskrivning  TEXT
);

CREATE TABLE kurs (
    id           SERIAL PRIMARY KEY,
    namn         VARCHAR(200) NOT NULL,
    kurskod      VARCHAR(20)  NOT NULL UNIQUE,
    poang        INT          NOT NULL CHECK (poang > 0),
    beskrivning  TEXT
);