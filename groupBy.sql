-- Active: 1709106603147@@127.0.0.1@5432@ph@public

------------- 19-2 Grouping  And Filtering Data with GROUP BY and HAVING ---------
--19-2.1 GROUP BY
SELECT country, count(*) from students 
GROUP BY country;

--Q. find the avg age of every country student ?
--ans:
SELECT country,count(*), avg(age) from students
    GROUP BY country;


--19-2.2 HAVING
-- GROUP BY er data gula ke amra caile filter korte pari.
-- GROUP BY korar pore je data ta output asbe tar upore amra filter korte pari HAVING deya

--Q. Filter Groups Using HAVING to show only Countries with Average Age Above 18?
--ans:
select country, avg(age) from students
    GROUP BY country
    HAVING avg(age)>18;

--Q. Count Students Born in Each Year
select  extract(year from dob::date) as birth_year , count(*)
    from students
    GROUP BY birth_year;

