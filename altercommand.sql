/*Perform the following:
1. Rename the table dept as department
2. Add a new column PINCODE with not null constraints to the existing table DEPT
3. All constraints and views that reference the column are dropped automatically,along
with the column.
4. Rename the column DNAME to DEPT_NAME in dept table
5. Change the data type of column loc as CHAR with size 10
6. Delete table*/

/*SOLUTION:
Create Table*/
SQL> CREATE TABLE DEPT(DEPTNO INTEGER, DNAME VARCHAR(10),LOC
VARCHAR(4), PRIMARY KEY(DEPTNO));

/*1. Rename the table dept as department*/
SQL> ALTER TABLE DEPT RENAME TO DEPARTMENT;

/*2. Add a new column PINCODE with not null constraints to the existing table DEPT*/
SQL> ALTER TABLE DEPARTMENT ADD(PINCODE NUMBER(6) NOT NULL);
SQL> DESC DEPARTMENT;

/*3. All constraints and views that reference the column are dropped automatically,along
with the column.*/
SQL> ALTER TABLE DEPARTMENT DROP column LOC CASCADE
CONSTRAINTS;

/*Rename the column DNAME to DEPT_NAME in dept table*/
SQL> ALTER TABLE DEPT RENAME COLUMN DNAME TO DEPT_NAME ;

/*5. Change the datatype of colunm loc as CHAR with size 10*/
SQL> ALTER TABLE DEPARTMENT MODIFY LOC CHAR(10) ;

/*Delete table*/
SQL> DROP TABLE DEPARTMENT;

