SELECT * FROM emp10;
CREATE TABLE emp01
AS SELECT * FROM emp;
ALTER TABLE emp01
MODIFY (
	job varchar2(50),
	ename varchar2(50),
	empno NUMBER PRIMARY key);
SELECT * FROM emp01;
