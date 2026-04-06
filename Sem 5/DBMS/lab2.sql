-- Database Management System Lab Experiment .
-- Note: Copy and execute each query one by one for new database setup

-- Step 0: Create new database
DROP DATABASE IF EXISTS lab2_new;
CREATE DATABASE lab2_new;
USE lab2_new;

-- Step 1: Create employee table
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    empID INT PRIMARY KEY,           
    empName VARCHAR(50),             
    email VARCHAR(100)               
);

-- Step 2: Create empinfo table
DROP TABLE IF EXISTS empinfo;
CREATE TABLE empinfo (
    empID INT PRIMARY KEY,           
    department VARCHAR(50),          
    salary DECIMAL(6,2)              
);

-- Step 3: Insert sample data into employee table
INSERT INTO employee (empID, empName, email) VALUES
(1, 'Priyanka', 'priyanka.tapkir@gmail.com'),
(2, 'Aarav', 'aarav.shah@gmail.com'),
(3, 'Sneha', 'sneha.more@gmail.com'),
(4, 'Rohit', 'rohit.patil@gmail.com'),
(5, 'Tanishq', 'tanishq.tamgadge@gmail.com'),
(6, 'Dipanshu', 'dipanshu.ambilkar@gmail.com'),
(7, 'Onyx', 'onyx123@gmail.com'),
(8, 'Keshav', 'keshav.pawar@gmail.com');

-- Step 4: Insert sample data into empinfo table
INSERT INTO empinfo (empID, department, salary) VALUES
(1, 'HR', NULL),
(4, 'IT', 55000.00),
(5, 'Sales', 60000.00),
(6, 'AI&DS', 70000.00),
(7, 'Finance', 75000.00),
(8, 'AI&DS', NULL);

-- Step 5: Queries

-- 1️⃣ INNER JOIN – Employees having matching records in both tables
SELECT e.empID, e.empName, e.email, i.department, i.salary
FROM employee e
INNER JOIN empinfo i ON e.empID = i.empID;

-- 2️⃣ LEFT JOIN – All employees, even if department info is missing
SELECT e.empID, e.empName, e.email, i.department, i.salary
FROM employee e
LEFT JOIN empinfo i ON e.empID = i.empID;

-- 3️⃣ RIGHT JOIN – All department info, even if employee data is missing
SELECT e.empID, e.empName, e.email, i.department, i.salary
FROM employee e
RIGHT JOIN empinfo i ON e.empID = i.empID;

-- 4️⃣ FULL OUTER JOIN – Simulated using UNION (MySQL does not support FULL JOIN)
SELECT e.empID, e.empName, i.department, i.salary
FROM employee e
LEFT JOIN empinfo i ON e.empID = i.empID
UNION
SELECT e.empID, e.empName, i.department, i.salary
FROM employee e
RIGHT JOIN empinfo i ON e.empID = i.empID;

-- 5️⃣ Create view and use subquery – Find employee(s) with highest salary
DROP VIEW IF EXISTS viewemp;
CREATE VIEW viewemp AS
SELECT e.empID, e.empName, e.email, i.department, i.salary
FROM employee e
JOIN empinfo i ON e.empID = i.empID;

SELECT empName, email
FROM viewemp
WHERE salary = (SELECT MAX(salary) FROM viewemp);

-- 6️⃣ Subquery – Employees from 'IT' department
SELECT empName, email
FROM viewemp
WHERE department = 'IT';

-- 7️⃣ View Query – Employees with salary above 60000
SELECT empName, email
FROM viewemp
WHERE salary > 60000;

-- 8️⃣ Subquery in FROM clause – Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM empinfo
WHERE salary IS NOT NULL
GROUP BY department;

-- 9️⃣ Using IS NULL – Employees with no salary record
SELECT empName, email
FROM viewemp
WHERE salary IS NULL;

-- 🔟 Verify the created view
SELECT * FROM viewemp;
