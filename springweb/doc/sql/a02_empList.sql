select deptno, dname
from dept100;
SELECT DISTINCT e.mgr, m.ename
FROM emp100 e, emp100 m
WHERE e.mgr = m.empno;
SELECT DISTINCT job
FROM emp100;

	select e.empno, e.ename, d.dname, m.ename mename, e.job
	from emp100 e, emp100 m, dept d
	where e.mgr = m.empno
	and e.deptno = d.deptno;