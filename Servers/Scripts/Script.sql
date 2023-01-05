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
