/*Triggers Queries
1. BEFORE INSERT trigger to automatically set a new employee's hire date to the current date:*/
CREATE OR REPLACE TRIGGER set_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
 :NEW.hire_date := SYSDATE;
END;
/
/*2. Create a trigger that will prevent a record from being inserted into the employees table if the salary
is less than 1000.*/

CREATE OR REPLACE TRIGGER check_employee_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
 IF :NEW.salary < 1000 THEN
 RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be less than 1000');
 END IF;
END;
/

/*3. Create a trigger that outputs a message to the console, indicating the old and new salaries for the
employee.*/

CREATE OR REPLACE TRIGGER update_employee_salary
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
 IF :OLD.salary != :NEW.salary THEN
 DBMS_OUTPUT.PUT_LINE('Employee ' || :OLD.employee_id || ' salary is changing from ' ||
:OLD.salary || ' to ' || :NEW.salary);
 END IF;
END;
/
