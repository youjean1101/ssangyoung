--1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
SELECT ename,dname, sal, grade
FROM emp e, SALGRADE s ,DEPT d 
WHERE  sal BETWEEN losal AND hisal
AND e.DEPTNO  = d.DEPTNO
AND to_char(hiredate,'q') ='1'
OR dname ='ACCOUNTING';


SELECT * FROM dept;

--private String ename;
--private String dname;
--private double sal;
--private int grade;
--private int losal;
--private int hisal;
--private String div;


--2) 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
SELECT  to_char(hiredate,'YYYY') yy, count(empno) cnt, max(sal) mxsal
FROM EMP e 
GROUP BY to_char(hiredate,'YY')
HAVING to_char(hiredate,'YY')='80';


--private date hiredate;
--private int empno;
--private double sal;

--3) 사번을 기준으로 홀/짝인 경우 홀인경우 보너스를 50%, 짝인 경우 보너스를 100% 추가하여 급여를 계산하기로 했다.  
--	조건(홀/짝/전체)  이름, 사번, 구분, 급여, 보너스(%), 총급여   를 출력하세요

SELECT ENAME , EMPNO,
		mod(empno, 2) div, sal, 
		decode (mod(empno, 2),0,sal,sal*0.5) bonus, 
		nvl2(NULLIF(mod(empno,2),0),sal+(sal*0.5),sal*2) totsal
FROM EMP e;

--private String ename;
--private int empno;
--private int div;
--private double sal;
--private double bonus;
--private double totsal;
--private int game;

--4) 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요  

SELECT floor(months_between(sysdate, hiredate)/12) yy,
		mod(floor(MONTHS_BETWEEN(sysdate, hiredate)),12) mm
FROM emp
WHERE to_char(hiredate,'YYYY/MM/DD') LIKE '%'||'1980/12/17'||'%';

SELECT * FROM emp;
--private int yy;
--private int mm;
--private String inputdate;

--5) 사원명을 조건으로 해당 사원과 같은 입사일의 분기를 가진 사원전체 정보를 출력하세요.
SELECT *
FROM emp 
WHERE to_char(hiredate, 'Q') in (
      SELECT to_char(hiredate, 'Q') 
      FROM emp 
      WHERE ename LIKE '%'||'SMITH'||'%');
    SELECT * FROM emp;
--private int empno;
--private String ename;
--private String job;
--private int mgr;
--private Date hiredate;
--private double sal;
--private double comm;
--private int deptno;

--6 관리자명을 기준(조건)으로 관리자 하위에 포함된 직원정보(직원명, 부서번호, 급여) 출력하세요.
SELECT m.ENAME mgrname,e.ENAME ename, e.deptno, e.SAL  
FROM EMP e ,emp m
WHERE e.mgr=m.EMPNO
AND m.ENAME = 'JONES';
SELECT * FROM emp;
--private String mgrname;
--private String ename;
--private int deptno;
--private double sal;

--7) 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
SELECT ENAME,DEPTNO,HIREDATE 
FROM EMP  
WHERE DEPTNO IN (
  	SELECT deptno
	FROM EMP e 
	WHERE to_char(hiredate,'MM')= 04);

private String ename;
private int deptno;
private DATE hiredate;
private int ipmm;