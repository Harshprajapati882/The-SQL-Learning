/*
================================================================================
FILE: syntax-examples.sql
TOPIC: SQL Syntax - Comprehensive Examples
DESCRIPTION: Detailed SQL syntax examples covering case sensitivity, statements,
database operations, and table operations
================================================================================
*/

-- =====================
-- 1. CASE SENSITIVITY
-- =====================
-- SQL keywords are case-insensitive
SELECT * FROM students;  -- lowercase
SELECT * FROM students;  -- uppercase

-- =====================
-- 2. SEMICOLON STATEMENT
-- =====================
SELECT * FROM students; SELECT * FROM courses;

-- =====================
-- 3. CREATE DATABASE
-- =====================
CREATE DATABASE school_db;

-- =====================
-- 4. USE STATEMENT
-- =====================
USE school_db;

-- =====================
-- 5. CREATE TABLE
-- =====================
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    course_id INT,
    enrollment_date DATE
);

-- =====================
-- 6. INSERT INTO
-- =====================
INSERT INTO students (student_id, name, age, email, course_id, enrollment_date) 
VALUES (1, 'John Doe', 20, 'john@example.com', 101, '2024-01-15');

INSERT INTO students (name, age, email, course_id, enrollment_date) 
VALUES ('Jane Smith', 22, 'jane@example.com', 102, '2024-02-10');

INSERT INTO students (name, age, email, course_id, enrollment_date) 
VALUES ('Bob Johnson', 21, 'bob@example.com', 101, '2024-01-20');

INSERT INTO students (name, age, email, course_id, enrollment_date) 
VALUES ('Alice Brown', 20, 'alice@example.com', 103, '2024-03-05');

INSERT INTO students (name, age, email, course_id, enrollment_date) 
VALUES ('Charlie Davis', 23, 'charlie@example.com', 102, '2024-02-15');

-- =====================
-- 7. DESC (DESCRIBE)
-- =====================
DESC students;

-- =====================
-- 8. SELECT & WHERE CLAUSE
-- =====================
SELECT * FROM students WHERE age > 20;

-- =====================
-- 9. AND/OR OPERATORS
-- =====================
SELECT * FROM students WHERE age > 20 AND name = 'John Doe';

SELECT * FROM students WHERE age < 21 OR age > 22;

-- =====================
-- 10. IN CLAUSE
-- =====================
SELECT * FROM students WHERE age IN (20, 21, 22);

-- =====================
-- 11. BETWEEN CLAUSE
-- =====================
SELECT * FROM students WHERE age BETWEEN 20 AND 22;

-- =====================
-- 12. LIKE OPERATOR
-- =====================
SELECT * FROM students WHERE name LIKE 'J%';   -- Names starting with 'J'
SELECT * FROM students WHERE name LIKE '%son';  -- Names ending with 'son'
SELECT * FROM students WHERE name LIKE '%oh%';  -- Names containing 'oh'

-- =====================
-- 13. DISTINCT CLAUSE
-- =====================
SELECT DISTINCT age FROM students;
SELECT DISTINCT course_id FROM students;

-- =====================
-- 14. ORDER BY CLAUSE
-- =====================
SELECT * FROM students ORDER BY age ASC;    -- Ascending order
SELECT * FROM students ORDER BY age DESC;   -- Descending order
SELECT * FROM students ORDER BY name ASC, age DESC;  -- Multiple columns

-- =====================
-- 15. GROUP BY CLAUSE
-- =====================
SELECT course_id, COUNT(*) as student_count FROM students GROUP BY course_id;

SELECT age, COUNT(*) as age_count FROM students GROUP BY age;

-- =====================
-- 16. COUNT FUNCTION
-- =====================
SELECT COUNT(*) as total_students FROM students;

SELECT COUNT(*) as students_above_20 FROM students WHERE age > 20;

-- =====================
-- 17. HAVING CLAUSE
-- =====================
SELECT age, COUNT(*) as age_count FROM students GROUP BY age HAVING COUNT(*) > 1;

SELECT course_id, COUNT(*) as student_count FROM students 
GROUP BY course_id HAVING COUNT(*) >= 2;

-- =====================
-- 18. ALTER TABLE
-- =====================
ALTER TABLE students ADD phone VARCHAR(15);

ALTER TABLE students MODIFY email VARCHAR(150);

-- =====================
-- 19. TRUNCATE TABLE
-- =====================
-- TRUNCATE TABLE students;  -- Removes all records but keeps structure

-- =====================
-- 20. CREATE INDEX
-- =====================
CREATE INDEX idx_email ON students(email);

CREATE INDEX idx_student_name ON students(name);

-- =====================
-- 21. DROP INDEX
-- =====================
-- DROP INDEX idx_email;

-- =====================
-- 22. RENAME TABLE
-- =====================
-- RENAME TABLE students TO learners;

-- =====================
-- 23. DROP TABLE
-- =====================
-- DROP TABLE students;

-- =====================
-- 24. DROP DATABASE
-- =====================
-- DROP DATABASE school_db;
