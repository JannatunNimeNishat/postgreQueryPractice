-- Active: 1709106603147@@127.0.0.1@5432@ph@public

------------------- 20-2 Exploring Subqueries ------------

create table sub_queries_employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO sub_queries_employees (employee_name, department_name, salary, hire_date) 
VALUES
('John Doe', 'Human Resources', 55000.00, '2020-05-15'),
('Jane Smith', 'Marketing', 60000.00, '2019-08-20'),
('Michael Johnson', 'Finance', 65000.00, '2018-12-10'),
('Emily Brown', 'Sales', 58000.00, '2021-02-28'),
('William Taylor', 'Engineering', 70000.00, '2017-10-05'),
('Jennifer Davis', 'Human Resources', 59000.00, '2019-04-25'),
('David Martinez', 'Marketing', 62000.00, '2020-11-12'),
('Jessica Wilson', 'Finance', 67000.00, '2018-06-30'),
('Daniel Anderson', 'Sales', 60000.00, '2017-09-15'),
('Lisa Thomas', 'Engineering', 72000.00, '2021-07-03'),
('Robert Rodriguez', 'Human Resources', 56000.00, '2018-03-22'),
('Karen Lee', 'Marketing', 63000.00, '2019-10-18'),
('Matthew Harris', 'Finance', 68000.00, '2020-01-09'),
('Amanda Clark', 'Sales', 61000.00, '2018-08-14'),
('Christopher Walker', 'Engineering', 74000.00, '2017-05-27'),
('Sarah Allen', 'Human Resources', 57000.00, '2021-03-30'),
('Kevin Young', 'Marketing', 64000.00, '2018-11-28'),
('Laura King', 'Finance', 69000.00, '2017-07-11'),
('Ryan Scott', 'Sales', 62000.00, '2019-06-05'),
('Melissa Baker', 'Engineering', 76000.00, '2020-09-22'),
('James Evans', 'Human Resources', 58000.00, '2018-04-17'),
('Ashley Garcia', 'Marketing', 65000.00, '2019-01-14'),
('Jason Turner', 'Finance', 70000.00, '2017-12-03'),
('Michelle White', 'Sales', 63000.00, '2018-09-19'),
('Justin Hall', 'Engineering', 78000.00, '2020-02-10'),
('Stephanie Martinez', 'Human Resources', 59000.00, '2019-05-25'),
('Erica Thompson', 'Marketing', 66000.00, '2018-10-08'),
('Andrew Nelson', 'Finance', 71000.00, '2017-08-01'),
('Nicole Perez', 'Sales', 64000.00, '2020-11-04');


SELECT * from sub_queries_employees


select  max(salary) from sub_queries_employees department_name
    WHERE department_name = 'Human Resources'
    -- GROUP BY department_name


-- Q. Retrieve all employees whose salary is greater then the highest salary of the HR department ? 
-- ans:
SELECT * from sub_queries_employees WHERE
    salary > (SELECT max(salary) from sub_queries_employees WHERE 
    department_name = 'Human Resources'
    )

-- sub quest can return
-- 1. Can return a single value
-- 2. Can return multiple rows
-- 3. Can return a single column



--NOTE: select er vitore sub-query ke always single value return korte hobe.

--Sub-query in side FROM
-- find the sum of salaries for each department with sub-query?
-- with sub-query
SELECT * from
    (SELECT department_name, sum(salary) from sub_queries_employees GROUP BY department_name) as sum_dept_salary;

-- with out sub-query
select department_name, sum(salary) from sub_queries_employees
    GROUP BY department_name;


select employee_name, salary, department_name from sub_queries_employees
WHERE department_name IN
(SELECT department_name FROM sub_queries_employees where department_name LIKE '%R%');
