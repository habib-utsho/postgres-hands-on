CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) check (salary > 0),
    hire_date DATE NOT NULL,
    dept_id INTEGER REFERENCES departments(dept_id) NOT NULL,
    manager_id INTEGER REFERENCES manager (manager_id)
);

DROP TABLE  employees;
SELECT * from employees;



CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    dept_manager INTEGER,
    FOREIGN KEY (dept_manager) REFERENCES manager (manager_id)
);

create Table manager (
    manager_id SERIAL PRIMARY KEY,
    manager_name VARCHAR(50) NOT NULL
);

INSERT INTO
    manager (manager_name)
VALUES ('Alice'),
    ('Bob'),
    ('Charlie'),
    ('David');

select * from manager;

INSERT INTO
    departments (dept_name, dept_manager)
VALUES ('HR', 1),
    ('Engineering', 2),
    ('Finance', 3),
    ('Sales', 4),
    ('Marketing', 1);

SELECT departments.*, manager.manager_name FROM departments
    JOIN manager ON departments.dept_manager = manager.manager_id;

INSERT INTO employees (employee_name, salary, hire_date, dept_id, manager_id) VALUES
    ('John Doe', 50000.00, '2020-01-15', 6, 1),
    ('Jane Smith', 60000.00, '2019-03-22', 7, 2),
    ('Emily Davis', 55000.00, '2021-06-10', 8, 3),
    ('Michael Brown', 70000.00, '2018-11-05', 9, 4),
    ('Sarah Wilson', 65000.00, '2020-09-30', 10, 1),
    ('David Lee', 48000.00, '2021-01-20', 6, 2),
    ('Olivia Martinez', 62000.00, '2018-07-25', 9, 1);

SELECT employees.*, departments.dept_name, manager.manager_name FROM employees
    JOIN departments ON employees.dept_id = departments.dept_id
    JOIN manager ON employees.manager_id = manager.manager_id;