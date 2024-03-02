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
    user_id INTEGER REFERENCES "user"(id)
);

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

