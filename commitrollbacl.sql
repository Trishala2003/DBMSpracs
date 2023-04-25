/*Perform the following:
1. Create company database
2. Viewing all databases
3. Viewing all Tables in a Database,
4. Creating Tables (With and Without Constraints)
5. Inserting/Updating/Deleting Records in a Table
6. Saving (Commit) and Undoing (rollback)*/

/*SOLUTION:
1. Creating a Database */

CREATE DATABASE Company;

/*2. Viewing all databases*/

SHOW DATABASES;

/*3. Viewing all Tables in a Database,*/

SHOW tables;

4/*. Creating Tables (With and Without Constraints)*/

CREATE TABLE DEPARTMENT
(DNO VARCHAR2 (20) PRIMARY KEY,
DNAME VARCHAR2 (20),
MGRSTARTDATE DATE);

CREATE TABLE EMPLOYEE
(SSN VARCHAR2 (20) PRIMARY KEY,
FNAME VARCHAR2 (20),
LNAME VARCHAR2 (20),
ADDRESS VARCHAR2 (20),
SEX CHAR (1),
SALARY INTEGER,
SUPERSSN REFERENCES EMPLOYEE (SSN),
DNO REFERENCES DEPARTMENT (DNO));

/*NOTE: Once DEPARTMENT and EMPLOYEE tables are created we must alter department
table to add foreign constraint MGRSSN using sql command*?

ALTER TABLE DEPARTMENT
ADD MGRSSN REFERENCES EMPLOYEE (SSN);

/*5. Inserting/Updating/Deleting Records in a Table,*/

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‗RNSECE01‘,'JOHN',‘SCOTT‘,‘BANGALORE‘,‘M‘, 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‗RNSCSE01‘,'JAMES',‘SMITH‘,‘BANGALORE‘,‘M‘, 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‗RNSCSE02‘,‘HEARN‘,‘BAKER‘,‘BANGALORE‘,‘M‘, 700000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‗RNSCSE03‘,‘EDWARD‘,‘SCOTT‘,‘MYSORE‘,‘M‘, 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSCSE04‘,‘PAVAN‘,‘HEGDE‘,‘MANGALORE‘,‘M‘, 650000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSCSE05‘,‘GIRISH‘,‘MALYA‘,‘MYSORE‘,‘M‘, 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSCSE06‘,‘NEHA‘,‘SN‘,‘BANGALORE‘,‘F‘, 800000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSACC01‘,‘AHANA‘,‘K‘,‘MANGALORE‘,‘F‘, 350000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSACC02‘,‘SANTHOSH‘,‘KUMAR‘,‘MANGALORE‘,‘M‘, 300000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSISE01‘,‘VEENA‘,‘M‘,‘MYSORE‘,‘M‘, 600000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‗RNSIT01‘,‘NAGESH‘,‘HR‘,‘BANGALORE‘,‘M‘, 500000);

INSERT INTO DEPARTMENT VALUES (‗1‘,‘ACCOUNTS‘,‘01-JAN01‘,‘RNSACC02‘);
INSERT INTO DEPARTMENT VALUES (‗2‘,‘IT‘,‘01-AUG-16‘,‘RNSIT01‘);
INSERT INTO DEPARTMENT VALUES (‗3‘,‘ECE‘,‘01-JUN-08‘,‘RNSECE01‘);
INSERT INTO DEPARTMENT VALUES (‗4‘,‘ISE‘,‘01-AUG-15‘,‘RNSISE01‘);
INSERT INTO DEPARTMENT VALUES (‗5‘,‘CSE‘,‘01-JUN-02‘,‘RNSCSE05‘);

/*Update*/

UPDATE EMPLOYEE SET DNO=‘5‘, SUPERSSN=‘RNSCSE06‘ WHERE
SSN=‘RNSCSE05‘;

/*Delete entries of employee table where DNO =1*/

DELETE FROM EMPLOYEE WHERE DNO=1;

/*6. COMMIT and ROLLBACK
Before concluding this section on Data Manipulation Language commands there are two
further commands, which are very useful. Changes made to the database by INSERT,
UPDATE and DELETE commands are temporary until explicitly committed. This is
performed by the command:
COMMIT;
On execution of this command all changes to the database made by you are made
permanent and cannot be undone.
 A COMMIT is automatically executed when you exit normally from SQL*Plus.
However, it does no harm to occasionally issue a COMMIT command.
 A COMMIT does not apply to any SELECT commands as there is nothing to
commit.
 A COMMIT does not apply to any DDL commands (eg CREATE TABLE,
CREATE INDEX, etc). These are automatically committed and cannot be rolled
back.
 If you wished to rollback (ie undo) any changes made to the database since the
last commit, you can issue the command:
ROLLBACK;
A group of related SQL commands that all have to complete successfully or otherwise be
rolled back, is called a transaction. Part of your research for Outcome 3 includes
investigating transaction processing and the implications of rollback and commit.*/