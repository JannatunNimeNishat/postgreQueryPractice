-- Active: 1709106603147@@127.0.0.1@5432@ph@public

select * from employees;

-------20-5 Exploring Functions In PostgreSQL---------------
--creating a function
CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL
as
$$
    SELECT count(*) FROM employees;
$$;

---- calling the function
SELECT emp_count();



--- deleting function with void return type
create or REPLACE FUNCTION delete_emp()
RETURNS void
LANGUAGE SQL
as
$$
    DELETE from employees WHERE employee_id = 30;
$$


SELECT delete_emp();


------------------------ function with parameter -------------------
create or REPLACE FUNCTION delete_emp_by_id(p_emp_id int)
RETURNS void
LANGUAGE SQL
as 
$$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

SELECT delete_emp_by_id(29);



---------------------- 20-6 Exploring Stored Procedure In PostgreSQL-----------------







