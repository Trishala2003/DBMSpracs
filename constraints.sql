/*DBMS CODES*/

/*CREATE TABLE WITH CONSTRAINTS*/

CREATE TABLE employees (
employee_id NUMBER(5) PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
email VARCHAR2(100) UNIQUE,
hire_date DATE DEFAULT SYSDATE,
salary NUMBER(10,2) CHECK (salary > 0),
department_id NUMBER(5) REFERENCES departments(department_id) ON DELETE SET NULL
);

/* In this example, we create a table called "employees" with the following columns:
 employee_id: a numeric column with a maximum of 5 digits, set as the primary key of the table.
 first_name and last_name: string columns that cannot be null.
 email: a string column with a maximum length of 100 characters, with a unique constraint applied to
ensure no duplicate emails are stored.
 hire_date: a date column that defaults to the current system date when a new row is inserted.
 salary: a numeric column that must have a value greater than 0.
 department_id: a numeric column that references the department_id column in another table called
"departments", with the constraint that if a department is deleted, the corresponding department_id
value in the "employees" table should be set to NULL.*/

CREATE TABLE employees9 (
employee_id NUMBER(5) PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
hire_date DATE CHECK (hire_date BETWEEN TO_DATE('01-JAN-2000', 'DD-MON-YYYY') AND
TO_DATE('31-DEC-2022', 'DD-MON-YYYY'))
);

/*Date constraints: Date constraints can be used to restrict the values that can be entered into a date column.
For example, the following statement creates a table with a hire_date column that must be between January
1, 2000 and December 31, 2022*/

CREATE TABLE employees (
employee_id NUMBER(5) PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
salary NUMBER(10,2) CHECK (salary BETWEEN 1000 AND 100000)
);

/*Range constraints: Range constraints can be used to restrict the values that can be entered into a numeric
column to a specific range. For example, the following statement creates a table with a salary column that
must be between 1000 and 100000*/

CREATE TABLE customers (
customer_id NUMBER(5) PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
email VARCHAR2(100) UNIQUE
);

/*Unique constraint: A unique constraint can be used to ensure that no duplicate values are entered into a
column. For example, the following statement creates a table with an email column that must be unique

Not null constraint: A NOT NULL constraint can be used to ensure that a column must have a value
entered into it when a row is inserted or updated. For example, the following statement creates a table with
a phone_number column that cannot be null

creating a table with a constraint that requires a specific column value to start with a certain number*/

CREATE TABLE phone_numbers (
 id INT PRIMARY KEY,
 phone_number VARCHAR(20) CONSTRAINT phone_starts_with CHECK (phone_number LIKE '1%')
);

/*Example of creating a table with a constraint that requires a specific column value to start with a
certain string (An)*/
CREATE TABLE example_table (
 id INT PRIMARY KEY,
 name VARCHAR(50) CONSTRAINT name_starts_with CHECK (name LIKE 'An%')
);

/*creating a table with a check constraint for city value to be one of Pune or Mumbai and Cname must
be in capital letters*/

CREATE TABLE customers (
 id INT PRIMARY KEY,
 cname VARCHAR(50) CHECK (cname = UPPER(cname)),
 city VARCHAR(50) CHECK (city IN ('Pune', 'Mumbai'))
);

CREATE TABLE employees (
 employee_id NUMBER(6) PRIMARY KEY,
 first_name VARCHAR2(20),
 last_name VARCHAR2(25),
 email VARCHAR2(25),
 phone_number VARCHAR2(20),
 hire_date DATE,
 job_id VARCHAR2(10),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2),
 manager_id NUMBER(6),
 department_id NUMBER(4)
);

/*-- Inserting Date*/

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
salary, commission_pct, manager_id, department_id)
VALUES (100, 'Steven', 'King', 'steven.king@example.com', '515.123.4567', TO_DATE('17-JUN-1987',
'DD-MON-YYYY'), 'AD_PRES', 24000, NULL, NULL, 90);