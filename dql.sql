-- CREATE TABLE teacher(
--     teacher_id serial primary KEY,
--     name VARCHAR(50) NOT NULL, 
--     age INT check (age >=18),
--     email VARCHAR(35) , 
--     dob DATE,
--     district VARCHAR(45)
-- )


-- INSERT INTO teacher (name, age, email, dob, district )
-- VALUES 
--       ('Habib', 19, 'habib1@gmail.com', '15 May 2000', 'Kurigram'),
--       ('Rahim', 29, 'habib2@gmail.com', '25 May 2000', 'Noakhali'),
--       ('Rashed', 21, 'habib3@gmail.com', '14 May 2000', 'Kurigram'),
--       ('Kislu', 22, 'habib4@gmail.com', '05 May 2000', 'Sylhet'),
--       ('Bashed', 25, 'habib5@gmail.com', '05 May 2000', 'Kurigram')





-- Add an extra column
-- ALTER TABLE teacher 
--        ADD COLUMN hobby VARCHAR(25) DEFAULT NULL;

-- ALTER TABLE teacher
--   DROP COLUMN hobby; 

-- UPDATE teacher
-- SET hobby = 'Tennis', age = age + 1
-- WHERE teacher_id = 38;


-- SELECT teacher_id, name as "teacherName", district, blood_group as bg, age FROM teacher
--        WHERE (district = 'Kurigram' OR blood_group = 'O+') AND age >= 20 AND email IS NOT NULL ORDER BY age ASC;
SELECT teacher_id, name, COALESCE(hobby, 'N/A') as hobby, * FROM teacher 
    WHERE district IN('Kurigram', 'Noakhali') AND age BETWEEN 18 AND 50 LIMIT 5 OFFSET 0;   


-- DELETE FROM teacher
--   WHERE teacher_id = 40;
 

-- Distinct or unique data
-- SELECT DISTINCT blood_group FROM teacher;

-- Clear table data , not constraint
-- TRUNCATE table teacher;