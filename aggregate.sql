-- SELECT * from teacher where age >= 20 and district = 'Kurigram' order by age desc;

SELECT SUM(age) as total_age,  AVG(age) as average_age, COUNT(*) as total_teachers, MAX(age) as max_age, MIN(age) as min_age FROM teacher;