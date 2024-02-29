-- Active: 1709106603147@@127.0.0.1@5432@ph@public
------------------- 19-1 Date and Date Function -----------------------
--19-1.1. show time zone
show timezone;

--19-1.2. time stamp (time stamp = date + time + time zone)
select now();

create table timeZ(
    ts TIMESTAMP WITHOUT TIME ZONE, 
    tsz TIMESTAMP WITH TIME ZONE
    );

INSERT INTO timeZ 
    VALUES
    ('2024-01-12 10:45:00','2024-01-12 10:45:00');

SELECT * FROM timez;


--19-1.3. get current date 
SELECT CURRENT_DATE;
--or
SELECT now()::date;
-- time
SELECT now()::time;

--19-1.4. formate the timestamp
SELECT to_char(now(), 'yyyy/mm/dd');
SELECT to_char(now(), 'dd-mm-yyyy');
SELECT to_char(now(), 'Day-Month');
 
--19-1.5. Interval
SELECT CURRENT_DATE - INTERVAL '1 year 1 month'


--19-1.6. age function 
-- 2 ta date er difference ta deya dey.
SELECT age(CURRENT_DATE, '1996-04-29')

---Q. add a new column on the result that should contain students age
--ans:
select first_name, age(CURRENT_DATE, dob) from students;

--19-1.7. extract
-- date teka month, year, day extract korte pari
select extract(year from '2024-02-25'::date);
select extract(MONTH from '2024-02-25'::date);
select extract(DAY from '2024-02-25'::date);



