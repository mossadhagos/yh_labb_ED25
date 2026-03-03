-- Example initialization script
-- This script runs automatically when the database is first created

-- Create a sample schema
CREATE SCHEMA IF NOT EXISTS lab;

-- Create a sample table
CREATE TABLE IF NOT EXISTS lab.students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create another sample table
CREATE TABLE IF NOT EXISTS lab.courses (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a junction table for many-to-many relationship
CREATE TABLE IF NOT EXISTS lab.enrollments (
    student_id INTEGER REFERENCES lab.students(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES lab.courses(id) ON DELETE CASCADE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id)
);

-- Insert sample data
INSERT INTO lab.students (first_name, last_name, email) VALUES
    ('Alice', 'Anderson', 'alice.anderson@example.com'),
    ('Bob', 'Brown', 'bob.brown@example.com'),
    ('Charlie', 'Chen', 'charlie.chen@example.com')
ON CONFLICT (email) DO NOTHING;

INSERT INTO lab.courses (course_code, course_name, credits) VALUES
    ('CS101', 'Introduction to Computer Science', 3),
    ('DB201', 'Database Management Systems', 4),
    ('WEB301', 'Web Development', 3)
ON CONFLICT (course_code) DO NOTHING;

-- Grant permissions
GRANT ALL PRIVILEGES ON SCHEMA lab TO labuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA lab TO labuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA lab TO labuser;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA lab GRANT ALL ON TABLES TO labuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA lab GRANT ALL ON SEQUENCES TO labuser;
