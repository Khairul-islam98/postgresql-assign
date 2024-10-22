-- Active: 1729099285669@@127.0.0.1@5432@university_db

-- create database
CREATE DATABASE university_db

-- create student Table
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INTEGER,
    email VARCHAR(100),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(15)
)

-- create a courses
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
)