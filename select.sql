-- Active: 1709106603147@@127.0.0.1@5432@ph
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) not NULL,
    last_name VARCHAR(50) not NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

drop table students

INSERT into students(first_name,last_name,age,grade,course,email,dob,blood_group,country)
VALUES
    /* ('John', 'Doe', 18, 'A+', 'Mathematics', 'john.doe@example.com', '2006-05-15', 'O+', 'United States'),
    ('Alice', 'Smith', 17, 'B-', 'Physics', 'alice.smith@example.com', '2007-08-21', 'A-', 'Canada'),
    ('Michael', 'Johnson', 19, 'A+', 'Chemistry', 'michael.johnson@example.com', '2005-12-10', 'B+', 'United Kingdom'),
    ('Emily', 'Brown', 18, 'O-', 'Biology', 'emily.brown@example.com', '2006-03-28', 'O-', 'Australia'),
    ('David', 'Lee', 17, 'A-', 'Computer Science', 'david.lee@example.com', '2007-10-05', 'AB-', 'India'),
    ('Sarah', 'Wilson', 16, 'B+', 'History', 'sarah.wilson@example.com', '2008-02-14', 'A+', 'United States'),
    ('Daniel', 'Martinez', 18, 'A', 'English Literature', 'daniel.martinez@example.com', '2006-09-30', 'B-', 'Mexico'), */
  -- ('Sophia', 'Garcia', 17, 'A-', 'Art',  '2007-04-25', 'O-', 'Spain'),
    /* ('Matthew', 'Taylor', 19, 'A+', 'Geography', 'matthew.taylor@example.com', '2005-11-08', 'AB+', 'Canada'),
    ('Olivia', 'Rodriguez', 18, 'O+', 'Music', 'olivia.rodriguez@example.com', '2006-06-19', 'A-', 'Australia'),
    ('Ethan', 'Hernandez', 17, 'B', 'Physical Education', 'ethan.hernandez@example.com', '2007-12-03', 'B+', 'United Kingdom'), */
 -- ('Emma', 'Lopez', 16, 'A', 'Chemistry', '2008-03-10', 'O+', 'Brazil'),
    /* ('Alexander', 'Gonzalez', 19, 'A+', 'Computer Science', 'alexander.gonzalez@example.com', '2005-10-27', 'A+', 'Germany'),
    ('Mia', 'Perez', 18, 'B-', 'Mathematics', 'mia.perez@example.com', '2006-07-12', 'O-', 'France'); */
  --('William', 'Sanchez', 17, 'A-', 'Physics', '2007-05-28', 'B-', 'Italy');
  ('Sophie', 'Williams', 18, 'B+', 'Mathematics', 'sophie.williams@example.com', '2006-09-02', 'A-', 'United States'),
    ('Noah', 'Brown', 17, 'A', 'Physics', 'noah.brown@example.com', '2007-04-20', 'B+', 'Canada'),
    ('Isabella', 'Garcia', 16, 'B-', 'Mathematics', 'isabella.garcia@example.com', '2008-02-15', 'O+', 'Spain'),
    ('James', 'Taylor', 19, 'A+', 'Physics', 'james.taylor@example.com', '2005-11-25', 'AB+', 'Australia'),
    ('Liam', 'Hernandez', 18, 'B', 'Mathematics', 'liam.hernandez@example.com', '2006-06-10', 'A-', 'United Kingdom'),
    ('Charlotte', 'Lopez', 17, 'A-', 'Physics', 'charlotte.lopez@example.com', '2007-12-05', 'O-', 'Brazil'),
    ('Benjamin', 'Gonzalez', 16, 'B+', 'Mathematics', 'benjamin.gonzalez@example.com', '2008-03-20', 'A+', 'Germany'),
    ('Amelia', 'Perez', 19, 'A', 'Physics', 'amelia.perez@example.com', '2005-10-12', 'O+', 'France'),
    ('Lucas', 'Sanchez', 18, 'B-', 'Mathematics', 'lucas.sanchez@example.com', '2006-07-28', 'O-', 'Italy'),
    ('Avery', 'Rivera', 17, 'A-', 'Physics', 'avery.rivera@example.com', '2007-05-15', 'B-', 'Japan');

select * from students

select email,age  from students WHERE (age>18)

-- alies
select email as "student email",age as "student age" from students WHERE (age>18)

-- sort the result based on CONDITIOn
select * from students ORDER BY first_name asc;
select * from students ORDER BY age DESC;
select * from students ORDER BY dob asc;

-- finding duplicate VALUES
select country from students ORDER BY country asc;

-- finding unique countries
select DISTINCT country from students;


---------- data filtering ----------------
--q1. select students from USA
--ans:
SELECT * from students where country = 'India';

--q2. select students with 'B-' grade in Physics
--ans:
SELECT * FROM students where course = 'Physics' AND grade = 'B-'

--q3. select students with a specific blood group ('A+')
--and:
SELECT * FROM students where blood_group = 'A+'

--q4. select students from the India or from Australia
--ans:
SELECT * FROM students where country = 'India' OR country = 'Australia'


--q5. select students from the Australia or India and the age is 20
--ans:
SELECT first_name, country from students where (country ='Australia' OR country ='India') AND age = 18;


--q6. select students with grade of 'A' or 'B' in Math or Physics;
--ans:
SELECT * from students where (course = 'Math' OR course = 'Physics') And (grade = 'A' OR grade = 'B') ;


------------------------ Functions-------------------------
--1. Scalar
--2. Aggregate

---1.1Upper case---
SELECT upper(first_name) as first_name_in_upper_case, * from students;
 

---1.2contact 2 COLUMNS ----
select concat(first_name,'',last_name) as full_name from students;
--1.3 
select  length(first_name) from students;

---------------------- AGGREGATE -----------
--2.1 avg
SELECT avg(age) as avg_age from students;
--2.2 sum
 SELECT sum(age) as total_age from students;
 --2.3 count the number of ROWS
 select count(*) from students;
-- 2.4 find the student who's first_name length is max.
--ans:
SELECT max(length(first_name)) from students;


-----------------------------18-7 Logical Negation --------
SELECT * from students
WHERE NOT country = 'India';


------------------------- Null -------------
-- Note: postgres e null er sate jai kori na kno sum, multi, avg, = , != sob khetrai result null asbe
select * from students
    where email = null; 
    -- will not return any value
-- to solve this problem we can use IS operator in place of = 
SELECT * from students
    where email is null

select * from students
    where email is not null

-------------------------------------  Null-Coalescing Operator----------
-- amra caile null ke replace kore onno value dekhate pari null er jaigai.
select COALESCE(email,'Email not provided') as "Email", blood_group, first_name from students;




------------------ 18-8 IN,BETWEEN,LIKE, ILIKE operators ------------------
--1. IN: 
--Multiple OR ke amra IN deya replace korte pari
select * from students 
    where country IN('India','Canada')

--1.1 NOT IN
select * from students 
    where country NOT IN('India','Canada')

--2 BETWEEN 
-- amra akta range er modde data ber korte pari
SELECT * from students
    where age BETWEEN 16 and 17;

--- BETWEEN date er range ber korte bashi kaje ase
SELECT * FROM students
    where dob BETWEEN '2007-04-01' and '2007-12-01' ORDER BY dob;

--3 LIKE  (case SENSITIVE)
-- given pattern er sate match kore data neya ase
SELECT * from students
    where first_name LIKE '%a'; -- ses a a ase amon nam er student 
    
--4 ILIKE (case in-SENSITIVE)
SELECT * from students
    where first_name ILIKE '%A';



---------------------------------- 18-9 Pagination with Limit Offset and Data Deletion ---------------------
--1. LIMIT
SELECT * from students LIMIT 2;

--2. Offset:
-- offset deya amra skip korte pari.
SELECT * from students limit 5 OFFSET 1;


--3. pagination with limit and offset
--3.1 -> 1st page
SELECT * from students limit 5 OFFSET 5 * 0;
--3.2 -> 2nd page
SELECT * from students limit 5 OFFSET 5 * 1;
--3.3 -> 3rd page
SELECT * from students LIMIT 5 OFFSET 5 * 2;


select * from students where email ILIKE 'default%';

---4. Delete operation
--q. delete those students who's grade is 'C' and lives in India
DELETE from students
    where grade = 'C' and country='India';




------------------------- Update Operator ------------------------
-- Update those students email with a default email who's email is null
UPDATE students
    set email = 'defaultEmail@default.com' 
    where email is null;




