-- Active: 1709106603147@@127.0.0.1@5432@ph
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) not NULL,
    last_name VARCHAR(50) not NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    bod DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);



INSERT into students(first_name,last_name,age,grade,course,email,dob,blood_group,country)
VALUES
    ('John', 'Doe', 18, 'A+', 'Mathematics', 'john.doe@example.com', '2006-05-15', 'O+', 'United States'),
    ('Alice', 'Smith', 17, 'B-', 'Physics', 'alice.smith@example.com', '2007-08-21', 'A-', 'Canada'),
    ('Michael', 'Johnson', 19, 'A+', 'Chemistry', 'michael.johnson@example.com', '2005-12-10', 'B+', 'United Kingdom'),
    ('Emily', 'Brown', 18, 'O-', 'Biology', 'emily.brown@example.com', '2006-03-28', 'O-', 'Australia'),
    ('David', 'Lee', 17, 'A-', 'Computer Science', 'david.lee@example.com', '2007-10-05', 'AB-', 'India'),
    ('Sarah', 'Wilson', 16, 'B+', 'History', 'sarah.wilson@example.com', '2008-02-14', 'A+', 'United States'),
    ('Daniel', 'Martinez', 18, 'A', 'English Literature', 'daniel.martinez@example.com', '2006-09-30', 'B-', 'Mexico'),
    ('Sophia', 'Garcia', 17, 'A-', 'Art', 'sophia.garcia@example.com', '2007-04-25', 'O-', 'Spain'),
    ('Matthew', 'Taylor', 19, 'A+', 'Geography', 'matthew.taylor@example.com', '2005-11-08', 'AB+', 'Canada'),
    ('Olivia', 'Rodriguez', 18, 'O+', 'Music', 'olivia.rodriguez@example.com', '2006-06-19', 'A-', 'Australia'),
    ('Ethan', 'Hernandez', 17, 'B', 'Physical Education', 'ethan.hernandez@example.com', '2007-12-03', 'B+', 'United Kingdom'),
    ('Emma', 'Lopez', 16, 'A', 'Chemistry', 'emma.lopez@example.com', '2008-03-10', 'O+', 'Brazil'),
    ('Alexander', 'Gonzalez', 19, 'A+', 'Computer Science', 'alexander.gonzalez@example.com', '2005-10-27', 'A+', 'Germany'),
    ('Mia', 'Perez', 18, 'B-', 'Mathematics', 'mia.perez@example.com', '2006-07-12', 'O-', 'France'),
    ('William', 'Sanchez', 17, 'A-', 'Physics', 'william.sanchez@example.com', '2007-05-28', 'B-', 'Italy');

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


 