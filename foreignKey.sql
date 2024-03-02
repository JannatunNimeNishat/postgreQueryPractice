-- Active: 1709106603147@@127.0.0.1@5432@ph@public

------------ 19-3 Constructing Relationships with Foreign Key Constrains -------------
-- creating table foreign KEY
--table 1
create table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- table 2
create Table post (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
);

alter table post
    alter COLUMN user_id set NOT NULL; 

DROP TABLE "user2";
DROP TABLE post2;


insert into "user" (username)
values
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT into post (title,user_id) VALUES
('Enjoying a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with Sagor', 4),
('Nodi''s wisdom always leaves me inspired', 4)

select * from post;
SELECT * from "user";

insert into post(title,user_id) VALUES('test', null)



----------------------------- 19-5 Enforcing Referential Integrity: Behaviors During Data Deletion -----------------
--19-5.1  (DEFAULT)  Restrict Deletion -> ON DELETE RESTRICT / ON DELETE ON ACTION 
-- REFERENCES kora ase amon kauke DELETE korte dibe na eta default behaviour
DELETE FROM "user"
    WHERE id = 4;

----------------------19-5.2 Cascading Deletion -> ON DELETE CASCADE--------------------------
CREATE Table user1(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL
);

CREATE Table post1(
    post_id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES user1(id) ON DELETE SET NULL
);

insert into "user1" (user_name)
values
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT into post1 (title,user_id) VALUES
('Enjoying a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with Sagor', 4),
('Nodi''s wisdom always leaves me inspired', 4)


SELECT * from "user1";
SELECT * from post1;

DELETE from user1
    where id = 4;

----------------------19-5.3 Default value -> ON DELETE SET DEFAULT--------------------------
CREATE Table user2(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) not NULL
);

CREATE Table post2(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES user2(id) ON delete set DEFAULT DEFAULT 2; -- default value present take hobe
);

alter Table post2
  RENAME  COLUMN  "post_id" to "user_id"

insert into "user2" (username)
values
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT into post2 (title,user_id) VALUES
('Enjoying a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with Sagor', 4),
('Nodi''s wisdom always leaves me inspired', 4)

SELECT * from user2;
SELECT * from post2;

delete from user2
    where id = 4;

