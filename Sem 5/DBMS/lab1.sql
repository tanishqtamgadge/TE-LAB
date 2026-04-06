-- ✅ Create a new database
CREATE DATABASE company;

-- ✅ Use the created database
USE company;

-- ✅ Create the main 'employee' table
CREATE TABLE employee (
    empNo INT,                     -- Employee number (unique identifier)
    empName VARCHAR(30),           -- Employee name
    hire_date DATE,                -- Date of joining
    PRIMARY KEY (empNo)            -- Primary key to ensure unique empNo
);

-- ✅ Create the secondary 'empData' table with a foreign key
CREATE TABLE empData (
    emp_id INT AUTO_INCREMENT,     -- Auto-increment employee info ID
    empNo INT,                     -- Employee number (foreign key reference)
    department VARCHAR(30),        -- Department name
    retire_date DATE,              -- Retirement date
    FOREIGN KEY (empNo) REFERENCES employee(empNo), -- Links empNo to employee table
    PRIMARY KEY (emp_id)           -- Primary key for this table
);

-- ✅ Add a new column for employee email
ALTER TABLE employee ADD COLUMN email VARCHAR(30);

-- ✅ Rename table 'empData' to 'empinfo' for better readability
RENAME TABLE empData TO empinfo;

-- ✅ Add a descriptive comment to the 'employee' table
ALTER TABLE employee COMMENT = 'This table contains employee data';

-- ✅ Insert an empty row (just for demonstration)
INSERT INTO empinfo () VALUE ();

-- ✅ Remove all data from 'empinfo' table (truncate)
TRUNCATE TABLE empinfo;

-- ✅ Insert sample data into 'employee' table
INSERT INTO employee (empNo, empName, hire_date, email) VALUES
(101, 'Rahul Sharma', '2020-01-15', 'rahul.sharma@gmail.com'),
(102, 'Priya Mehta',  '2021-03-20', 'priya.mehta@gmail.com'),
(103, 'Arjun Patel',  '2022-07-10', 'arjun.patel@gmail.com'),
(104, 'Neha Verma',   '2021-08-25', 'neha.verma@gmail.com'),
(105, 'Karan Singh',  '2020-09-12', 'karan.singh@gmail.com'),
(106, 'Simran Kaur',  '2023-04-01', 'simran.kaur@gmail.com'),
(107, 'Vikram Das',   '2022-11-05', 'vikram.das@gmail.com');

-- ✅ Add a new column to 'empinfo' table for storing salary
ALTER TABLE empinfo ADD COLUMN salary DECIMAL(5,2);

-- ✅ Insert data into 'empinfo' table
INSERT INTO empinfo (emp_id, empNo, department, retire_date, salary) VALUES
(NULL, 102, 'HR',       '2040-05-07', 65000.00),
(NULL, 103, 'Finance',  '2040-06-07', 72000.00),
(NULL, 104, 'IT',       '2041-02-07', 58000.00),
(NULL, 105, 'Sales',    '2039-12-07', 55000.00),
(NULL, 106, 'Admin',    '2042-08-07', 76000.00),
(NULL, 107, 'IT',       '2041-08-07', 80000.00),
(NULL, 101, 'HR',       '2040-05-07', NULL);

-- ✅ Update employee with empNo = 101 and set salary to NULL
UPDATE empinfo SET salary = NULL WHERE empNo = 101;

-- ✅ Create a view combining data from both tables
CREATE VIEW viewemp AS
SELECT 
    e.empNo, 
    e.empName, 
    e.email, 
    i.department, 
    i.salary
FROM 
    employee AS e
INNER JOIN 
    empinfo AS i 
ON 
    e.empNo = i.empNo;

-- ✅ Add an index on empNo column for faster searching
ALTER TABLE employee ADD INDEX emp_index (empNo);

-- ✅ Create a synonym (if system supports it)
CALL sys.create_synonym_db('company', 'New_Company');

-- ✅ Display all data from employee, empinfo, and viewemp
SELECT * FROM employee;
SELECT * FROM empinfo;
SELECT * FROM viewemp;
