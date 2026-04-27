SELECT concat(first_name, ' ', last_name) AS name, email, age, age(CURRENT_DATE, dob) as calculatedAge, dob, is_active FROM student;
-- creating table
-- create table student(
--     stdId SERIAL primary key,
--     first_name VARCHAR(50) not NULL,
--     last_name VARCHAR(50),
--     email VARCHAR(20)  UNIQUE,
--     age INTEGER not null, CHECK (age>=18),
--     is_active BOOLEAN DEFAULT true,
--     dob DATE UNIQUE
-- )

-- rename
-- ALTER TABLE std RENAME TO student;


-- single row insert
-- insert into student(first_name, last_name, age, dob, email) 
-- VALUEs('Habib', 'Utsho', 18, '15 May 6000', 'habib@gmail.com'),('one', 'two', 22, '25 Apr 7000', 'one@gmail.com');



-- insert new field
-- ALTER TABLE student
--       ADD COLUMN email VARCHAR(20) DEFAULT 'default@gmail.com' NOT NULL;


-- change column name
-- ALTER TABLE student
--      RENAME COLUMN studentAge to student_age;


-- update type existing column
-- ALTER TABLE student
--     ALTER COLUMN first_name TYPE VARCHAR(50);


-- add/modify constraint to an existing column
-- ALTER TABLE student
--     ADD CONSTRAINT unique_student_email UNIQUE (email);
--    ALTER COLUMN email set NOT NULL;
--    ALTER COLUMN email DROP NOT NULL;



-- Drop (totally remove the table)
-- DROP TABLE student;

-- Truncate (remove the table data not data type or constraint)
-- TRUNCATE TABLE student;
