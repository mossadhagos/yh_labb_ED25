-- ============================================================
-- Query 1: Utbildningsledare and their klasser
-- ============================================================

SELECT 
    ul.fornamn || ' ' || ul.efternamn AS utbildningsledare,
    k.namn                            AS klass,
    p.namn                            AS program,
    a.ort                             AS ort
FROM utbildningsledare ul
JOIN klass k ON k.ul_id = ul.id
JOIN program p ON p.id = k.program_id
JOIN anlaggning a ON a.id = k.anlaggning_id
ORDER BY ul.efternamn, k.namn;


-- ============================================================
-- Query 2: Kurser per program
-- ============================================================

SELECT 
    p.namn        AS program,
    k.kurskod     AS kurskod,
    k.namn        AS kurs,
    k.poang       AS poang
FROM program p
JOIN program_kurs pk ON pk.program_id = p.id
JOIN kurs k ON k.id = pk.kurs_id
ORDER BY p.namn, k.kurskod;

-- ============================================================
-- Query 3: Utbildare, kurs och klass
-- ============================================================

SELECT
    u.fornamn || ' ' || u.efternamn AS utbildare,
    u.typ                           AS typ,
    k.namn                          AS kurs,
    kl.namn                         AS klass,
    p.namn                          AS program
FROM utbildare u
JOIN kurs_utbildare ku ON ku.utbildare_id = u.id
JOIN kurs k            ON k.id = ku.kurs_id
JOIN klass kl          ON kl.id = ku.klass_id
JOIN program p         ON p.id = kl.program_id
ORDER BY u.efternamn, kl.namn;

-- ============================================================
-- Query 4: Studenter, deras klass och utbildningsledare
-- ============================================================

SELECT
    s.fornamn || ' ' || s.efternamn    AS student,
    kl.namn                            AS klass,
    p.namn                             AS program,
    ul.fornamn || ' ' || ul.efternamn  AS utbildningsledare,
    a.ort                              AS ort
FROM student s
JOIN klass kl              ON kl.id = s.klass_id
JOIN program p             ON p.id = kl.program_id
JOIN utbildningsledare ul  ON ul.id = kl.ul_id
JOIN anlaggning a          ON a.id = kl.anlaggning_id
ORDER BY kl.namn, s.efternamn; 

-- ============================================================
-- Query 5: Konsulter, deras företag och arvode
-- ============================================================

SELECT
    u.fornamn || ' ' || u.efternamn AS utbildare,
    f.namn                          AS foretag,
    f.organisationsnummer           AS orgnr,
    f.f_skatt                       AS f_skatt,
    k.arvode_per_timma              AS arvode_per_timma,
    kurs.namn                       AS kurs,
    kl.namn                         AS klass
FROM utbildare u
JOIN konsult k         ON k.utbildare_id = u.id
JOIN foretag f         ON f.id = k.foretag_id
JOIN kurs_utbildare ku ON ku.utbildare_id = u.id
JOIN kurs              ON kurs.id = ku.kurs_id
JOIN klass kl          ON kl.id = ku.klass_id
ORDER BY u.efternamn; 

-- ============================================================
-- Query 6: Sammanfattning per klass
-- ============================================================

SELECT
    kl.namn                            AS klass,
    p.namn                             AS program,
    ul.fornamn || ' ' || ul.efternamn  AS utbildningsledare,
    a.ort                              AS ort,
    COUNT(DISTINCT s.id)               AS antal_studenter,
    COUNT(DISTINCT ku.kurs_id)         AS antal_kurser
FROM klass kl
JOIN program p             ON p.id = kl.program_id
JOIN utbildningsledare ul  ON ul.id = kl.ul_id
JOIN anlaggning a          ON a.id = kl.anlaggning_id
LEFT JOIN student s        ON s.klass_id = kl.id
LEFT JOIN kurs_utbildare ku ON ku.klass_id = kl.id
GROUP BY kl.id, kl.namn, p.namn, ul.fornamn, ul.efternamn, a.ort
ORDER BY kl.namn;