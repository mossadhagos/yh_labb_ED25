-- ============================================================
-- seed_data.sql
-- Insert fake data in dependency order
-- ============================================================

-- 1. Anlaggningar
INSERT INTO anlaggning (namn, ort, adress) VALUES
    ('YrkesCo Göteborg',  'Göteborg',  'Avenyn 12, 411 36 Göteborg'),
    ('YrkesCo Stockholm', 'Stockholm', 'Kungsgatan 55, 111 22 Stockholm');

-- 2. Företag
INSERT INTO foretag (namn, organisationsnummer, f_skatt, adress) VALUES
    ('TechConsult AB',  '556123-4567', TRUE,  'Storgatan 1, 111 11 Stockholm'),
    ('DataExperts HB',  '969123-4568', TRUE,  'Lilla Bommen 1, 411 04 Göteborg'),
    ('AI Solutions AB', '556987-6543', FALSE, 'Drottninggatan 10, 111 51 Stockholm');

-- 3. Program
INSERT INTO program (namn, beskrivning) VALUES
    ('AI och maskininlärning',       'Utbildning inom artificiell intelligens och maskininlärning med Python.'),
    ('Webbutveckling med JavaScript','Fullstack webbutveckling med moderna JavaScript-ramverk.'),
    ('Data och analys',              'Dataanalys, visualisering och databashantering.');

-- 4. Kurser
INSERT INTO kurs (namn, kurskod, poang, beskrivning) VALUES
    ('Python programmering',      'PY101', 30, 'Grundläggande programmering i Python.'),
    ('Maskininlärning',           'ML201', 40, 'Supervised och unsupervised learning med scikit-learn.'),
    ('Databaser och SQL',         'DB101', 25, 'Relationsdatabaser, SQL och datamodellering.'),
    ('JavaScript grundkurs',      'JS101', 30, 'Grundläggande JavaScript för webbutveckling.'),
    ('React och frontend',        'JS201', 35, 'Komponentbaserad frontend-utveckling med React.'),
    ('Dataanalys med Python',     'DA201', 30, 'Pandas, NumPy och visualisering med Matplotlib.'),
    ('Statistik och sannolikhet', 'ST101', 20, 'Grundläggande statistik för dataanalys.');

-- 5. Utbildningsledare
INSERT INTO utbildningsledare (fornamn, efternamn, email) VALUES
    ('Anna',    'Lindqvist', 'anna.lindqvist@yrkesco.se'),
    ('Björn',   'Eriksson',  'bjorn.eriksson@yrkesco.se'),
    ('Cecilia', 'Holm',      'cecilia.holm@yrkesco.se');

INSERT INTO ul_personuppgifter (ul_id, personnummer) VALUES
    (1, '198501012345'),
    (2, '197903034567'),
    (3, '199212128901');

-- 6. Utbildare
INSERT INTO utbildare (fornamn, efternamn, email, typ) VALUES
    ('David',   'Svensson', 'david.svensson@yrkesco.se',   'anstald'),
    ('Emma',    'Nilsson',  'emma.nilsson@techconsult.se',  'konsult'),
    ('Fredrik', 'Berg',     'fredrik.berg@dataexperts.se',  'konsult'),
    ('Greta',   'Lund',     'greta.lund@yrkesco.se',        'anstald');

INSERT INTO konsult (utbildare_id, foretag_id, arvode_per_timma) VALUES
    (2, 1, 850.00),
    (3, 2, 950.00);

-- 7. Klasser (3 per program)
INSERT INTO klass (namn, program_id, ul_id, anlaggning_id, start_datum, slut_datum) VALUES
    ('AI-23A', 1, 1, 1, '2023-09-01', '2025-06-01'),
    ('AI-24A', 1, 1, 1, '2024-09-01', '2026-06-01'),
    ('AI-25A', 1, 2, 2, '2025-09-01', '2027-06-01'),
    ('WEB-23A', 2, 2, 2, '2023-09-01', '2025-06-01'),
    ('WEB-24A', 2, 3, 1, '2024-09-01', '2026-06-01'),
    ('WEB-25A', 2, 3, 2, '2025-09-01', '2027-06-01'),
    ('DA-23A',  3, 1, 1, '2023-09-01', '2025-06-01'),
    ('DA-24A',  3, 2, 2, '2024-09-01', '2026-06-01'),
    ('DA-25A',  3, 3, 1, '2025-09-01', '2027-06-01');

-- 8. Students
INSERT INTO student (fornamn, efternamn, email, klass_id) VALUES
    ('Erik',    'Johansson', 'erik.johansson@student.se',   1),
    ('Maria',   'Karlsson',  'maria.karlsson@student.se',   1),
    ('Oskar',   'Nilsson',   'oskar.nilsson@student.se',    2),
    ('Sofia',   'Berg',      'sofia.berg@student.se',       4),
    ('Linus',   'Andersson', 'linus.andersson@student.se',  4),
    ('Maja',    'Larsson',   'maja.larsson@student.se',     7);

INSERT INTO student_personuppgifter (student_id, personnummer) VALUES
    (1, '200001011234'),
    (2, '200102025678'),
    (3, '199912129012'),
    (4, '200203033456'),
    (5, '200104047890'),
    (6, '200005051234');

-- 9. Program-Kurs kopplingar
INSERT INTO program_kurs (program_id, kurs_id) VALUES
    (1, 1), (1, 2), (1, 3),
    (2, 4), (2, 5), (2, 3),
    (3, 1), (3, 3), (3, 6), (3, 7);

-- 10. Kurs-Utbildare kopplingar
INSERT INTO kurs_utbildare (kurs_id, utbildare_id, klass_id) VALUES
    (1, 1, 1), (2, 2, 1), (3, 3, 1),
    (4, 1, 4), (5, 2, 4), (3, 3, 4),
    (1, 4, 7), (3, 1, 7), (6, 2, 7);