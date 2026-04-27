-- A trigger is a database object in postgreSQL that automatically executes a specified set of actions in response to certain database events or conditions.

-- Table level events;
-- INSERT, UPDATE, DELETE, TRUNCATE

-- Database level events;
-- db startup, db shutdown, connection start and end etc

-- Syntax:

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON TABLE_NAME
-- FOR EACH ROW
-- EXECUTE FUNCTION function_name()

CREATE   Table deleted_employees_audit (
    id SERIAL PRIMARY KEY,
    deleted_employee_id INT NOT NULL,
    deleted_employee_name VARCHAR(50) NOT NULL,
    deleted_at TIMESTAMP
)

DROP TABLE deleted_employees_audit

CREATE OR replace FUNCTION save_deleted_employee_func()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
    BEGIN
      INSERT INTO deleted_employees_audit (deleted_employee_id, deleted_employee_name, deleted_at)  VALUES (OLD.employee_id, OLD.employee_name, now());
      RAISE NOTICE 'Deleted % User audit log created!', OLD.employee_name;
      RETURN OLD;
    END;
$$;

CREATE OR replace Trigger save_deleted_employee_trigger
 BEFORE DELETE
 on employees
 FOR EACH ROW
 EXECUTE FUNCTION save_deleted_employee_func();

CALL remove_emp_by_id (26);

SELECT * FROM employees

SELECT * FROM deleted_employees_audit

