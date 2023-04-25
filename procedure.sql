/*Procedure
1. Create a procedure that will insert a new record into the employees table.*/

CREATE OR REPLACE PROCEDURE add_employee (first_name IN VARCHAR2, last_name IN
VARCHAR2, email IN VARCHAR2, hire_date IN DATE, job_id IN VARCHAR2, salary IN
NUMBER, manager_id IN NUMBER, department_id IN NUMBER)
IS
BEGIN
 INSERT INTO employees (emp_id, first_name, last_name, email, hire_date, job_id, salary,
manager_id, department_id)
 VALUES (emp_id, first_name, last_name, email, hire_date, job_id, salary, manager_id,
department_id);
 COMMIT;
END;
/
/*To call the procedure, you can use the following syntax:*/
BEGIN
 add_employee(1,'John', 'Doe', 'johndoe@email.com', SYSDATE, 'IT_PROG', 5000, 100, 60);
END;
/
/*2. Create a procedure that will update the salary of an employee based on their employee ID.*/
CREATE OR REPLACE PROCEDURE update_employee_salary (emp_id IN NUMBER,
new_salary IN NUMBER)
IS
BEGIN
 UPDATE employees SET salary = new_salary WHERE employee_id = emp_id;
 COMMIT;
END;
/
/*To call the procedure, you can use the following syntax:*/
BEGIN
 update_employee_salary(100, 6000);
END;
/