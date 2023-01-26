SELECT * FROM emp100;

	select max(sal)
	from emp100
	where deptno = 20;

	select max(mgr)
	from emp100;

	select job
	from emp100
	where ename = 'WARD';
	
SELECT * FROM emp100 WHERE empno=7499;
SELECT * FROM emp100 WHERE ename='ALLEN';
-- 최대 급여안 사원의 정보
--SELECT * FROM emp100 e
--WHERE sal = (SELECT max(sal) FROM emp100 );
SELECT max(sal) FROM emp100;

SELECT * FROM salgrade;
/*
private int grade;
private double losal;
private double hisal;
*/