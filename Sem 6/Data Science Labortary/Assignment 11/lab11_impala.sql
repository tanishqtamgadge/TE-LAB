-- Create Database
CREATE DATABASE student_db;

-- Select Database
USE student_db;

-- Create Table
CREATE TABLE student (
    id INT,
    name STRING,
    age INT,
    course STRING
);

-- Insert Data
INSERT INTO student VALUES (1, 'Amit', 20, 'AI');
INSERT INTO student VALUES (2, 'Rahul', 21, 'DS');
INSERT INTO student VALUES (3, 'Sneha', 22, 'IT');

-- Display Table Data
SELECT * FROM student;

-- Simple Queries
SELECT name, age FROM student;

SELECT * FROM student WHERE age > 20;

SELECT COUNT(*) FROM student;

SELECT course, COUNT(*) FROM student GROUP BY course;