-- INSERT INTO teacher (name, email, dob, district )
-- VALUES 
--       ('Test1',  'habib50@gmail.com', '15 May 1999', 'Dinajpur'),
--       ('Test2',  'habib51@gmail.com', '25 May 1998', 'Lalmonirhut'),
--       ('Test3', 'habib52@gmail.com', '14 May 1995', 'Pabna'),
--       ('Kislu',  'habib53@gmail.com', '05 May 1994', 'Natore'),
--       ('Bashed', 'habib54@gmail.com', '05 May 1993', 'Bogura')

-- District wise group data and  need count and avg age ; avg age must should greater than 20 
-- select district, count(*), COALESCE(avg(age)::TEXT, 'N/A') as avg_age  from teacher
--     GROUP BY district 
--     HAVING avg(age)>20;


-- Count teacher born in each year
SELECT extract(year FROM dob) as birth_year , count(*)
  FROM teacher
  GROUP BY birth_year
