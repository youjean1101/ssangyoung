SELECT * FROM emp100;
-- 최고 관리자 번호
SELECT max(mgr) FROM emp100;

SELECT * FROM EMP100
WHERE empno=(
	SELECT max(mgr) 
	FROM emp100
);

-- 40번 부서의 최근 입사자의 입사일
SELECT max(hiredate) FROM emp100
WHERE deptno=40
GROUP BY deptno;
	
SELECT * FROM emp100
WHERE hiredate IN(
	SELECT max(hiredate) FROM emp100
	WHERE deptno=30
	GROUP BY deptno
);

SELECT max(hiredate) FROM emp100 --최신
GROUP BY DEPTNO;

--직책이 SALESMAN의 최저 급여
SELECT min(sal) FROM emp100
WHERE job='SALESMAN';

SELECT * FROM EMP100
WHERE sal=(
SELECT min(sal) FROM emp100
WHERE job='SALESMAN');

--연봉이 2000~4000 구간의 사원의 수
SELECT count(*) FROM emp100
WHERE sal BETWEEN 2000 AND 4000;

--1/4분기에 입사한 사원의 수
SELECT count(*) FROM emp100
WHERE to_char(hiredate,'q')=1;

SELECT to_char(hiredate,'q') FROM emp100;

-- 1) 직책이 MANAGER인 사원의 최고 급여자
SELECT * FROM EMP100
WHERE sal=(SELECT max(sal) FROM emp100
WHERE job='MANAGER');

--2) 부서번호가 10인 부서정보 (Dept alias 등록 필요 - dept - 공통 mybatis에)
SELECT * FROM dept
WHERE deptno=10;

-- 3) 사원명이 TURNER인 사원의 정보
SELECT * FROM emp100
WHERE ename='TURNER';

-- 4) 최초 입사자의 사원 정보 
SELECT * FROM emp100
WHERE hiredate=(
	SELECT max(hiredate) FROM emp100);
-- 5) 2/4분기 최고 급여자의 정보
SELECT *
FROM emp100
WHERE sal=(
SELECT max(sal)FROM EMP100 e 
WHERE to_char(hiredate,'q')=2);

select * from salgrade;

SELECT * FROM MEMBER;

select e.empno, e.ename, d.dname, nvl(m.ename,'') mename, e.job
		from emp100 e, emp100 m, dept d
		where e.mgr = m.empno(+)
		and e.deptno = d.deptno
		and e.ename like '%'||''||'%'
		and e.job like '%'||''||'%';

CREATE TABLE member200(
	id varchar2(100) PRIMARY KEY,
	pass varchar2(100),
	name varchar2(100),
	auth varchar2(100),
	point number
);
INSERT INTO member200 values('himan','7777','홍길동','admin',1000);
INSERT INTO member200 values('higirl','8888','홍현아','admin',2000);
INSERT INTO member200 values('goodman','5555','오길동','normal',1000);
INSERT INTO member200 values('badgirl','3333','신영희','quest',1000);
INSERT INTO member200 values(#{id},#{pass},#{name},#{auth},#{point});

select * from member200
where id like '%'||''||'%'
and name like '%'||''||'%'
and auth = 'admin';
--<if test="auth!=''">
--and auth = #{auth}
--</if>
select * from member200
where id = 'himan';

update member200
	set name='himan',
		pass='9999',
		point=3000,
		auth='admin'
	where id = 'himan';
	
delete member200
where id = #{id};

SELECT DISTINCT auth
FROM member200;

SELECT * FROM emp;

SELECT * FROM MEMBER200;

SELECT * FROM dept100 ORDER BY deptno;
INSERT INTO dept100 values(#{deptno},#{dname},#{loc});

UPDATE dept100 SET dname='마케팅'
					loc=''
WHERE deptno='75';
DELETE FROM dept100 WHERE deptno='94';

UPDATE dept100 SET deptno='94' 
WHERE deptno='92' AND dname='테스트';

INSERT INTO dept100 values('91','테스트','테스트');
INSERT INTO dept100 values('92','테스트','테스트');
INSERT INTO dept100 values('93','테스트','테스트');
