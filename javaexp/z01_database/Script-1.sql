SELECT * FROM emp01
WHERE ename LIKE '%'||'A'||'%'
AND job LIKE '%'||'ER'||'%'
;
-- 매개변수에 의해 검색의 조건을 처리하는 기능메서드 만들기
select * 
from dept 
where dname like '%'||'O'||'%'
AND loc LIKE '%' ||''||'%'
;
SELECT empno, ename, job, mgr, hiredate, sal, comm,deptno
FROM emp01
WHERE ename LIKE '%'||''||'%'
AND job LIKE '%'||''||'%'
AND sal BETWEEN 1000 AND 2000
;

--[1단계:코드] 3. 부서별 최고 급여자를 sql를 만들고 이것을 출력하는 기능메서드를 만들고 출력처리하세요.
SELECT * FROM emp01;

SELECT *
FROM emp01
WHERE sal IN (
	SELECT max(sal)
	FROM emp01
	GROUP BY deptno)
;

SELECT * FROM salgrade;

SELECT deptno, empno, ename, job, sal
FROM emp01
WHERE sal BETWEEN 1000 AND 2000
;
