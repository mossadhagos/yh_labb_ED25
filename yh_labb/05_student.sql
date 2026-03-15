-- ============================================================
-- 05_student.sql
-- ============================================================

CREATE TABLE student (
    id          SERIAL PRIMARY KEY,
    fornamn     VARCHAR(100) NOT NULL,
    efternamn   VARCHAR(100) NOT NULL,
    email       VARCHAR(200) NOT NULL UNIQUE,
    klass_id    INT          NOT NULL REFERENCES klass(id)
);

-- Sensitive data in separate table for access control (GDPR + 3NF)
CREATE TABLE student_personuppgifter (
    id              SERIAL PRIMARY KEY,
    student_id      INT         NOT NULL UNIQUE REFERENCES student(id) ON DELETE CASCADE,
    personnummer    VARCHAR(13) NOT NULL UNIQUE
);