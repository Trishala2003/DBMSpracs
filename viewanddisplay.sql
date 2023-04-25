/*Perform the following
1. Display all the fields of employee table
2. Retrieve employee number and their salary
3. Retrieve average salary of all employee
4. Retrieve number of employee
5. Retrieve distinct number of employee
6. Retrieve total salary of employee group by employee name and count similar names
7. Retrieve total salary of employee which is greater than >120000
8. Display name of employee in descending order
9. Display details of employee whose name is AMIT and salary greater than 50000;*/

/*1. Display all the fields of employee table*/
SQL> select * from employee;

/*2. Retrieve employee number and their salary*/
SQL> select empno, salary from employee;

/*3. Retrieve average salary of all employee*/
SQL> select avg(salary) from employee;

/*4. Retrieve number of employee*/
SQL> select count(*) from employee;

/*5. Retrieve distinct number of employee*/
SQL> select count(DISTINCT emp_name) from employee;

/*6. Retrieve total salary of employee group by employee name and count similar names*/
SQL> SELECT EMP_NAME, SUM(SALARY),COUNT(*) 
FROM EMPLOYEE 2 
GROUP BY(EMP_NAME);

/*7. Retrieve total salary of employee which is greater than >120000*/
SQL> SELECT EMP_NAME, SUM(SALARY) FROM
EMPLOYEE 2 GROUP BY(EMP_NAME)
3 HAVING SUM(SALARY)>120000;

/*8. Display name of employee in descending order*/
SQL> select emp_name 
from employee 2 
order by emp_name desc;

/*9. Display details of employee whose name is AMIT and salary greater than 50000;*/
SQL> select * 
from employee 2 
where emp_name='Amit' and salary>50000;


