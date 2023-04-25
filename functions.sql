/*Functions

1. Create a function that will calculate the age of a person based on their date of birth.
*/

CREATE OR REPLACE FUNCTION calculate_age (dob IN DATE)
RETURN NUMBER
IS
 age NUMBER;
BEGIN
 age := TRUNC(MONTHS_BETWEEN(SYSDATE, dob) / 12);
 RETURN age;
END;
/
To call the function, you can use the following syntax:
DECLARE
 emp_age NUMBER;
BEGIN
 emp_age := calculate_age(TO_DATE('01-JAN-1980', 'DD-MON-YYYY'));
 DBMS_OUTPUT.PUT_LINE('Employee Age: ' || emp_age);
END;
/
2. Create a function that will return the total number of employees in a department based on the
department ID.
CREATE OR REPLACE FUNCTION get_department_size (dept_id IN NUMBER)
RETURN NUMBER
IS
 emp_count NUMBER;
BEGIN
 SELECT COUNT(*) INTO emp_count
 FROM employees e
 WHERE e.department_id = dept_id;
 RETURN emp_count;
END;
/
To call the function, you can use the following syntax:
DECLARE
 dept_size NUMBER;
BEGIN
 dept_size := get_department_size(60);
 DBMS_OUTPUT.PUT_LINE('Department Size: ' || dept_size);
END;

