SELECT * FROM dept;

SELECT * FROM dept
WHERE dname LIKE '%'||'SALES'||'%'
and loc LIKE '%'||'CHICAGO'||'%';

SELECT * FROM emp100;

SELECT * FROM MEMBER;

INSERT INTO member values('himan','0000','홍길동','회원',200,'인천');

SELECT * FROM dept100;

select * from dept where deptno=30 and dname='SALES';
/*
 select * from dept where deptno=? and dname=?
 */
