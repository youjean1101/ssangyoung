--2022-10-04
--[1단계:개념] 1. EQUI join과 NON EQUI join의 차이점을 기술하세요
--[1단계:코드] 2. 직책이 SALESMAN의 급여와 등급을 출력하요
SELECT ename, job, e.sal, s.grade 
FROM emp e, salgrade s
WHERE sal BETWEEN losal and hisal
AND job='SALESMAN';

SELECT * FROM salgrade;
SELECT * FROM emp;

--[2단계:코드] 3. 1사분기에 입사한 사원중, 부서명이 ACCOUNTING인 사원의 이름, 급여와 급여등급 출력하세요.
SELECT * FROM DEPT;
SELECT * FROM emp;

SELECT d.dname 부서명, to_char(hiredate,'Q') 분기, ename, sal, s.grade
FROM emp e, salgrade s, dept d
WHERE (s.grade,dname,to_char(hiredate,'Q')) IN (
		SELECT s.grade,dname,to_char(hiredate,'Q')
		FROM emp e,dept d,salgrade s
		WHERE to_char(hiredate,'Q') = 1
		AND dname = 'ACCOUNTING')
		AND sal BETWEEN losal and hisal;

--[1단계:개념] 4. outer join의 기본 형식과 equi join과의 차이점을 기술하세요.
--[2단계:코드] 5. 부서별 최고급여액을 출력하되 사원정보가 없는 부서는 0으로 표현하여 출력하세요.

SELECT d.deptno 부서별, nvl(max(sal+nvl(e.comm,0)),0) 최고급여액
from emp e, dept d
WHERE e.deptno(+) = d.deptno
GROUP BY d.deptno;

SELECT * from emp;

--[1단계:코드] 6. 관리자하위에 포함된 사원을 기준으로 관리자의 하위 직원의 수를 관리자명, 사원수로 출력하세요.


SELECT m.ename 관리자명, count(e.ename) 사원수
FROM emp e, emp m
WHERE e.mgr = m.empno
group BY m.ename;

SELECT mgr, count(ename)
FROM emp
GROUP BY mgr;

SELECT * FROM emp;
--[1단계:개념] 7. subquery란 무엇인가? 여러가지 유형과 함께 기술하세요. 
--[1단계:코드] 8. JAMES와 같은 입사일의 분기를 가진 사원을 출력하세요.
SELECT *
FROM emp
WHERE to_char(hiredate,'Q') in(
	SELECT to_char(hiredate,'Q')
	FROM emp
	WHERE ename ='JAMES');
--[1단계:코드] 9. ALLEN과 같은 관리자를 둔 사원을 출력하세요.
SELECT *
FROM emp
WHERE mgr IN(
	SELECT mgr
	FROM emp
	WHERE ename='ALLEN');
--[1단계:코드] 10. 보너스가 가장 많은 사원정보(사원명, 부서명, 보너스)를 출력하세요.
SELECT ename, dname, comm
FROM emp e, dept d
WHERE comm IN (
	SELECT max(comm)
	FROM emp);

SELECT max(comm)
	FROM emp;

--[1단계:코드] 11. 12월에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
SELECT *
FROM emp
WHERE (deptno,to_char(hiredate,'MM')) in(
	SELECT deptno,to_char(hiredate,'MM')
	FROM emp
	WHERE to_char(hiredate,'MM')=12
	AND deptno=20);

s
--[1단계:개념] 12. 다중행/다중열의 SUBQUERY의 종류와 차이점을 예제를 통해 기술하세요. 

