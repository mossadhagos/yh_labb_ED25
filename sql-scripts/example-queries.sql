-- Example SQL practice script
-- You can run these queries to practice SQL

-- Basic SELECT queries
SELECT * FROM lab.students;
SELECT * FROM lab.courses;

-- JOIN queries
SELECT 
    s.first_name,
    s.last_name,
    c.course_name,
    e.grade
FROM lab.students s
JOIN lab.enrollments e ON s.id = e.student_id
JOIN lab.courses c ON c.id = e.course_id;

-- Aggregation
SELECT 
    c.course_name,
    COUNT(e.student_id) as enrolled_students
FROM lab.courses c
LEFT JOIN lab.enrollments e ON c.id = e.course_id
GROUP BY c.course_name
ORDER BY enrolled_students DESC;
