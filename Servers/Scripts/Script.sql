SELECT * FROM dept;

SELECT * FROM dept
WHERE dname LIKE '%'||'SALES'||'%'
and loc LIKE '%'||'CHICAGO'||'%';

SELECT * FROM emp100;

SELECT * FROM MEMBER;

SELECT * FROM dept100;

select * from dept where deptno=30 and dname='SALES';
/*
 select * from dept where deptno=? and dname=?
 */
