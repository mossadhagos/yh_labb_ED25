-- ============================================================
-- 06_junction_tables.sql
-- Resolves M:M relationships
-- ============================================================

-- Which courses belong to which program
CREATE TABLE program_kurs (
    program_id  INT NOT NULL REFERENCES program(id) ON DELETE CASCADE,
    kurs_id     INT NOT NULL REFERENCES kurs(id)    ON DELETE CASCADE,
    PRIMARY KEY (program_id, kurs_id)
);

-- Which utbildare teaches which kurs in which klass
CREATE TABLE kurs_utbildare (
    kurs_id      INT NOT NULL REFERENCES kurs(id)      ON DELETE CASCADE,
    utbildare_id INT NOT NULL REFERENCES utbildare(id) ON DELETE CASCADE,
    klass_id     INT NOT NULL REFERENCES klass(id)     ON DELETE CASCADE,
    PRIMARY KEY (kurs_id, utbildare_id, klass_id)
);