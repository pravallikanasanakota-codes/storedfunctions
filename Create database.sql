-- Step 1: Create database
CREATE DATABASE company_db;
USE company_db;

-- Step 2: Create departments table (PRIMARY KEY)
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Step 3: Create employees table with FOREIGN KEY
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    
    CONSTRAINT fk_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);

-- Step 4: Insert valid department records
INSERT INTO departments (department_name, location)
VALUES 
('HR', 'Hyderabad'),
('IT', 'Bangalore'),
('Finance', 'Mumbai');

-- Step 5: Insert valid employee records
INSERT INTO employees (employee_name, email, salary, department_id)
VALUES 
('Rahul', 'rahul@gmail.com', 50000, 1),
('Anita', 'anita@gmail.com', 65000, 2),
('Kiran', 'kiran@gmail.com', 45000, 3);

-- Step 6: View records
SELECT * FROM departments;
SELECT * FROM employees;

-- Step 7: Try inserting INVALID foreign key (will fail)
INSERT INTO employees (employee_name, email, salary, department_id)
VALUES ('Invalid Emp', 'invalid@gmail.com', 40000, 99);

-- Step 8: Test ON DELETE CASCADE
DELETE FROM departments WHERE department_id = 2;

-- Step 9: Verify deletion cascade
SELECT * FROM employees;
