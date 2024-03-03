-- Active: 1709106603147@@127.0.0.1@5432@ph

-------------- Query Practice: Part 1: ---------------

-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

drop table departments;
drop table employees;

-- Inserting sample data into the departments table

INSERT INTO departments (department_name) VALUES 
    ('HR'), 
    ('Marketing'), 
    ('Finance'), 
    ('IT'), 
    ('Sales'), 
    ('Engineering'), 
    ('Customer Support'), 
    ('Administration'), 
    ('Research'), 
    ('Quality Assurance');

-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES 
    ('John Doe', 1, 60000.00, '2022-01-10'),
    ('Jane Smith', 2, 75000.50, '2021-05-22'),
    ('Bob Johnson', 3, 80000.75, '2020-11-15'),
    ('Alice Williams', 4, 90000.25, '2019-08-03'),
    ('David Lee', 5, 65000.50, '2020-03-18'),
    ('Sara Brown', 6, 70000.00, '2021-09-28'),
    ('Mike Miller', 7, 55000.75, '2022-02-05'),
    ('Emily Davis', 8, 95000.00, '2018-12-12'),
    ('Chris Wilson', 9, 72000.50, '2020-06-30'),
    ('Amy White', 10, 68000.25, '2021-11-09'),
    ('John Johnson', 1, 62000.00, '2022-01-15'),
    ('Jessica Thompson', 2, 78000.50, '2021-06-05'),
    ('Michael Harris', 3, 85000.75, '2020-11-25'),
    ('Emma Martinez', 4, 92000.25, '2019-09-15'),
    ('James Taylor', 5, 67000.50, '2020-04-08'),
    ('Sophia Anderson', 6, 72000.00, '2021-10-10'),
    ('William Jackson', 7, 56000.75, '2022-02-10'),
    ('Olivia Nelson', 8, 97000.00, '2018-12-20'),
    ('Daniel White', 9, 73000.50, '2020-07-05'),
    ('Ava Wilson', 10, 69000.25, '2021-11-15'),
    ('Matthew Brown', 1, 63000.00, '2022-01-20'),
    ('Emily Garcia', 2, 76000.50, '2021-06-15'),
    ('Christopher Allen', 3, 86000.75, '2020-12-05'),
    ('Madison Hall', 4, 93000.25, '2019-09-25'),
    ('Andrew Cook', 5, 68000.50, '2020-04-18'),
    ('Abigail Torres', 6, 73000.00, '2021-10-20'),
    ('Ethan Murphy', 7, 57000.75, '2022-02-15'),
    ('Ella King', 8, 98000.00, '2018-12-28'),
    ('Nathan Rivera', 9, 74000.50, '2020-07-15'),
    ('Mia Roberts', 10, 70000.25, '2021-11-20');


select * from departments;
select * from employees;


--1. Inner Join to Retrieve Employee and Department Information:
SELECT * from employees as e INNER JOIN departments as d
    ON e.department_id = d.department_id;

-- both keys has the same name then we use USING() function.
--Ex:
SELECT * FROM employees INNER JOIN departments
    USING(department_id)


-- 2.Show Department Name with Average Salary:
SELECT d.department_name, round(avg(e.salary)) as salary FROM employees as e INNER JOIN departments as d
    USING(department_id)
    GROUP BY d.department_name

-- 3.Count Employees in Each Department:
SELECT d.department_name, count(*) as "count_emp" from employees as e INNER JOIN departments as d 
USING(department_id)
GROUP BY (d.department_name)


--4.Find the Department name with the Highest Average Salary:

select d.department_name, round(avg(e.salary)) as "avg_salary" from employees as e INNER JOIN departments as d
 USING(department_id)
GROUP BY (d.department_name)
ORDER BY "avg_salary" desc
LIMIT 1

-- 5.Count Employees Hired Each Year:
SELECT extract(YEAR from hire_date) as hire_year, count(*) from employees 
    GROUP BY (hire_year)



CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
    (1, '2022-01-05', 100.50),
    (2, '2020-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2020-05-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2021-02-01', 250.50),
    (1, '2022-02-05', 180.25);

SELECT * FROM customers;

-- 6.Find customers who have placed more than 2 orders and calculate the total amount spent by each of these customers.

SELECT customer_id, count(order_id) as total_orders, sum(total_amount) as total_spent  FROM orders 
GROUP BY(customer_id)
HAVING count(order_id) > 2



-- 7.Find the total amount of orders placed each month in the year 2022.
SELECT EXTRACT(month from order_date) as order_month, count(*) as order_places, sum(total_amount) FROM orders
where extract(year from order_date) = 2022
   GROUP BY order_month
--    HAVING EXTRACT(month from order_date) = 2022





