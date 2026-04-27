-- Active: 1776581529734@@127.0.0.1@5432@postgres

-- CREATE TABLE "user"(
--     id SERIAL PRIMARY KEY,
--     username VARCHAR(25) not NULL
-- )
-- CREATE TABLE post(
--     id SERIAL PRIMARY KEY,
--     title TEXT not NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DELETE RESTRICT not NULL
-- )

-- INSERT INTO "user"(username) VALUES
--        ('Utsho'), ('Habib'), ('Ahashan'), ('Akash')

-- INSERT INTO post(title, user_id) VALUES
--         ('Summer days is going well', 1),
--         ('There are some certain issue', 2),
--         ('Winter fallen behind summer', 3),
--         ('Good days will come soon', 4)


SELECT title, username,user_id, u.id as user_id_remote, post.id as post_id FROM post  
   JOIN "user" as u 
   on post.user_id = u.id;   
   
SELECT * FROM "user";





-- Deletion constraint on DELETE user
--  1. Cascading Deletion -> ON DELETE CASCADE -- referential action for a foreign key that ensures data integrity by automatically deleting dependent records when a referenced record is removed. 
--  2. Setting NULL -> ON DELETE SET NULL
--  3. Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default) 
--  4. Set default value -> ON DELETE SET DEFAULT VALUE