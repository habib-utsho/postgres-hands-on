-- Get employees count
CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees;
$$;

SELECT emp_count ();

CREATE FUNCTION delete_employee_by_id(id INT)
RETURNS void
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employees.employee_id = id;
$$;

SELECT delete_employee_by_id (29);

SELECT * FROM employees;




-- Procedure (Difference between function is procedure nothing return anything)
CREATE PROCEDURE remove_emp_by_id(id INT)
LANGUAGE plpgsql
AS
$$
  DECLARE
  isEmployeeExist BOOLEAN;
BEGIN
    SELECT EXISTS(
        SELECT employee_id FROM employees WHERE employee_id = id
    ) INTO isEmployeeExist;

    IF isEmployeeExist THEN
       DELETE FROM employees 
       WHERE employees.employee_id = id;
       RAISE NOTICE 'Employee with id % deleted successfully', id;
    ELSE
       RAISE NOTICE 'Employee with id % does not exist', id;
    END IF;
END;
$$;

CALL remove_emp_by_id (25);