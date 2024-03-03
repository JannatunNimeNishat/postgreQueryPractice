-- Active: 1709106603147@@127.0.0.1@5432@ph@public

CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

create TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);


INSERT INTO employees VALUES (1, 'John Doe', 101);
INSERT INTO employees VALUES (2, 'Jane Smith', 102);

insert INTO departments VALUES (101, 'Human Resources');
insert INTO departments VALUES (102, 'Marketing');


SELECT * from employees;
SELECT * from departments;

drop table departments;
