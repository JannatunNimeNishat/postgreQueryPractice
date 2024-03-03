-- Active: 1709106603147@@127.0.0.1@5432@ph@public

------------------------ 20-4 Exploring Views In PostgreSQL----------

CREATE VIEW dept_avg_salary
AS
SELECT department_name, avg(salary) from sub_queries_employees
GROUP BY (department_name)

SELECT * from dept_avg_salary


