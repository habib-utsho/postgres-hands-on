CREATE VIEW dept_avg_salary AS
SELECT dept_name, avg(salary)
FROM employees
    JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY
    dept_name


SELECT * FROM dept_avg_salary;