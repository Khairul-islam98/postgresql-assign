-- Active: 1729099285669@@127.0.0.1@5432@university_db

-- create database
CREATE DATABASE university_db;

-- create student table
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INTEGER,
    email VARCHAR(100),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);

-- create a courses table
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credits INTEGER
);

-- create an enrollment table
CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);

-- insert data students table
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- insert data courses table
INSERT INTO courses(course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- insert data enrollment table
INSERT INTO enrollment(student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);

-- Query 1: Insert a new student data
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Khairul Islam', 25, 'janeyrahman900@gmail.com', 59, 60, NULL);

-- Query 2: Retrieve the names of all students who are enrolled in the course
SELECT student_name FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON courses.course_id = enrollment.course_id
WHERE course_name = 'Next.js';

-- Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);

