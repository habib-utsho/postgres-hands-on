
-- CREATE TABLE "user"(
--     id SERIAL PRIMARY KEY,
--     username VARCHAR(25) not NULL
-- )
-- CREATE TABLE post(
--     id SERIAL PRIMARY KEY,
--     title TEXT not NULL,
--     user_id INTEGER REFERENCES "user"(id) not NULL
-- )

-- INSERT INTO "user"(username) VALUES
--        ('Utsho'), ('Habib'), ('Ahashan'), ('Akash')

-- INSERT INTO post(title, user_id) VALUES
--         ('Summer days is going well', 1),
--         ('There are some certain issue', 2),
--         ('Winter fallen behind summer', 3),
--         ('Good days will come soon', 4)


SELECT * FROM post;
-- SELECT * FROM "user";



-- Deletion constraint on DELETE user
--  1. Cascading Deletion -> ON DELETE CASCADE
--  2. Setting NULL -> ON DELETE SET NULL
--  3. Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default) 
--  4. Set default value -> ON DELETE SET DEFAULT VALUE