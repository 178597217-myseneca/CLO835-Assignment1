CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE IF NOT EXISTS employees_info (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    skill_set VARCHAR(30),
    work_location VARCHAR(30)
);

INSERT INTO employees_info (first_name, last_name, skill_set, work_location) VALUES
    ('Aanchal', 'Thakur', 'Cloud', 'Toronto'),
    ('Jonna', 'Jones', 'Architecture', 'London');

SELECT * FROM employees_info;
