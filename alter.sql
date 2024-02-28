-- Active: 1709106603147@@127.0.0.1@5432@ph
select * from person1;

--ALTER
--1. add a column to a existing TABLE
ALTER TABLE person1
ADD COLUMN email VARCHAR(255) DEFAULT 'default@email.com' NOT NULL;

INSERT INTO person1 VALUES(7,23,'ni13');

--2. drop a COLUMN
alter Table person1 
    DROP email;

--3 alter a tables column data TYPES
ALTER Table person1
ALTER COLUMN user_name TYPE VARCHAR(55) 

-- alter a tables column CONTAINS
ALTER Table person1
ADD CONSTRAINT age check(age>=18);

ALTER Table person1
alter COLUMN user_name  set not NULL;


ALTER Table person1
alter COLUMN user_name drop not null;

ALTER table person1 
ADD constraint unique_person1_age UNIQUE(age);

ALTER table person1 
DROP constraint unique_person1_age;

