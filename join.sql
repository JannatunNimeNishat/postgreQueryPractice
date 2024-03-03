-- Active: 1709106603147@@127.0.0.1@5432@ph@public
---------------------19-6 Joining TABLE With Inner Join ---------------------------------
create Table "join_user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) not NULL
);

create Table "join_post"(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "join_user"(id) on delete CASCADE
);


insert into "join_user" (username)
values
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT into join_post (title,user_id) VALUES
('Enjoying a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with Sagor', 4),
('Nodi''s wisdom always leaves me inspired', 4)

TRUNCATE TABLE join_post;

drop TABLE join_user;
drop TABLE join_post;

SELECT * from join_user;
SELECT * from join_post;


------------------ 19-6.1 INNER JOIN -----------------------
SELECT * FROM join_post  INNER join "join_user" 
    ON join_post.user_id = "join_user".id;

--with alice
SELECT post.id as "p_id", "user".id as "u_id" FROM join_post as post INNER join "join_user" as "user"
    ON post.user_id = "user".id;


-------------------  19-7 Understanding Left And Right Joins ------------------

---------------- 19-7.1 Left JOIN ----------------------------------------------
INSERT into join_post (id,title,user_id)
    VALUES (5,'This is test post title',NULL)

-- Left join gives left table priority. That means it first shows the match values from the table and then it shows 
-- the rest of values from table. 

SELECT * from join_post as p LEFT JOIN join_user as u
ON p.user_id = u.id;



---------------- 19-7.2 Right JOIN ----------------------------------------------
SELECT * from join_post as p RIGHT JOIN join_user as u
on p.user_id = u.id;






------------------------------------- 19-8 Exploring Full, Cross, And Natural Joins -------------

---------------- 19-8.1 Full JOIN -------------------------------------

-- the FULL JOIN keyword selects ALL records from both tables, even if there is not a match. For rows with a match the values from both tables are available, if there is not a match the empty fields will get the value NULL.

SELECT * from join_post as p FULL JOIN join_user as u
    on p.user_id = u.id;




