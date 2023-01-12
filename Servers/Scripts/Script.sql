SELECT * FROM dept;

SELECT * FROM dept
WHERE dname LIKE '%'||'SALES'||'%'
and loc LIKE '%'||'CHICAGO'||'%';

SELECT * FROM emp100;
SELECT * FROM emp01;
INSERT INTO emp01 values(7999,'마길동','대리',7902,to_date('2023-01-01','YYYY-MM-DD'),
3500,100,10);
/*
 INSERT INTO emp01 values({},'{}','{}',{},to_date('{}','YYYY-MM-DD'),
{},{},{})
 */

CREATE TABLE dept01
AS SELECT * FROM dept;

SELECT * FROM dept01;

SELECT * FROM MEMBER;
DELETE FROM MEMBER WHERE id='higirl';

INSERT INTO member values('himan','0000','홍길동','회원',200,'인천');
INSERT INTO member values('higirl','0000','마길동','회원',50,'서울홍대');
INSERT INTO member values('goodman','0000','김길동','회원',100,'천안');
INSERT INTO member values('moveman','0000','김이동','user01',100,'천안');
INSERT INTO member values('user01','0000','김이동2','user02',100,'천안');
INSERT INTO member values('user02','0000','김이동3','user03',100,'천안');
INSERT INTO member values('mgr','0000','김관리자','admin',100,'천안');

SELECT * FROM dept100;

select * from dept where deptno=30 and dname='SALES';
/*
 select * from dept where deptno=? and dname=?
 */
SELECT e.empno,e.ename FROM emp100 m,emp100 e
/*
 <select name="mgr">
 	<option value="7499">ALLEN</option>
 	<option value="7521">WARD</option>
 	<option value="7566">JONES</option>
 	<option value="7654">MARTIN</option>
 	<option value="7698">BLAKE</option>
 </select>
 7499	ALLEN
7521	WARD
7566	JONES
7654	MARTIN
7698	BLAKE
7782	CLARK
7844	TURNER
7900	JAMES
7934	MILLER
 */
WHERE e.mgr = m.empno;
SELECT deptno, dname FROM dept100;
/* 
<select name="deptno">
 	<option value="10">인사</option>
 	<option value="20">RESEARCH</option>
 	<option value="30">SALES</option>
 	<option value="40">OPERATIONS</option>
 	<option value="88">회계</option>
 </select>
55	인사
20	RESEARCH
30	SALES
40	OPERATIONS
88	회계
 * */

SELECT DISTINCT e.mgr code, m.ename val
FROM emp100 e, emp100 m
WHERE e.mgr = m.empno
ORDER BY code;

SELECT deptno code, dname val 
FROM dept100
ORDER BY code;

SELECT grade code,(losal||'~'||hisal) val
FROM salgrade
ORDER BY code;

SELECT * FROM emp100;
INSERT INTO emp100 values(1001,'마길동','부장',7839,sysdate,7000,1000,10);
INSERT INTO emp100 values(1002,'오길동','차장',1001,sysdate,6000,1000,10);