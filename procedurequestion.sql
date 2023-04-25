/*Given an integer i, write a PL/SQL procedure to insert the tuple (i, 'xxx') into a given relation.
SOLUTION:*/
CREATE TABLE T2 (
a INTEGER,
b CHAR(10));
CREATE OR REPLACE PROCEDURE addtuple1(x IN NUMBER)
AS
BEGIN
INSERT INTO T2 VALUES(x, 'xxx');
END addtuple1;
.
run;