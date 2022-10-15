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

-- 정답
SELECT to_char(hiredate, 'YYYY') year, 
		count(*) count, max(sal) sal
FROM emp e
GROUP BY to_char(hiredate,'YYYY');

--class Exp01{
--private String year;
--private int cnt;
--private double sal;
--}
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

-- 정답 (난이도*****)
SELECT e.*,decode(div,0,'짝','홀') div,
		decode(div,0,'100%','50%') bonus_per, -- 보너스 표시
		round(decode(div,0,1,0.5)*sal) bonus, -- 보너스 금액
		sal + round(decode(div,0,1,0.5)*sal) totpay --총 금액
FROM (	
	SELECT empno, MOD(empno,2) div,
				ename, sal
	FROM emp
) e
WHERE div IN ( 0,1 );
-- 프로그램상에 을 0 : 짝, 1 : 홀, 0,1 : 전체 
/*	VO 조건(홀/짝/전체) 이름, 사번, 구분, 급여, 보너스(%), 총급여
	매개변수 : String div
class Exp03_as{
	private String ename;
	private int empno;
	private String div2;
	private double sal;
	private String bonus_per;
	private int bonus;
	private int totpay;
}
public List<Emp03_as> getExp03List(String div){
	List<Emp03_as> list = new ArrayList<Exp03_as>();
	
	return list;
}

 */

--4) 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요  

SELECT floor(months_between(sysdate, hiredate)/12) yy,
		mod(floor(MONTHS_BETWEEN(sysdate, hiredate)),12) mm
FROM emp
WHERE to_char(hiredate,'YYYY/MM/DD') LIKE '%'||'1980/12/17'||'%';

SELECT * FROM emp;
--private int yy;
--private int mm;
--private String inputdate;

-- 정답
SELECT ename,
		floor(mm/12)||'년'||floor(MOD(mm,12))||'개월' workmonth
FROM (
	SELECT ename,months_between(to_date('2001/01/01','YYYY/MM/DD'), hiredate) mm
	FROM emp
); -- '2001년01월01일','YYYY"년"MM"월"DD"일"'
SELECT ename,
		floor(mm/12)||'년'||floor(MOD(mm,12))||'개월' workmonth
FROM (
	SELECT ename,months_between(to_date('2001년01월01일','YYYY"년"MM"월"DD"일"'), hiredate) mm
	FROM emp
);
/*
class exp04_as{
	private String ename;
	private String workmonth;
}
public List<Exp04_as> getExp04List(String std){ }
 
 */
 

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

-- 정답
SELECT *
FROM emp
WHERE to_char(hiredate,'Q') = (
	SELECT to_char(hiredate,'Q')
	FROM emp
	WHERE ename = 'ALLEN'
);
-- 기존 Emp vo 사용
-- public List<Emp> getExp04(String ename){}

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

-- 정답
SELECT ename, deptno, sal
FROM emp
WHERE mgr IN (
	SELECT EMPNO 
	FROM emp
	WHERE ename ='BLAKE'
);
-- Emp ==> 생성자 추가
-- public List<Emp> getExp06List(String ename){}
SELECT * FROM emp;

--7) 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
SELECT ENAME,DEPTNO,HIREDATE 
FROM EMP  
WHERE DEPTNO IN (
  	SELECT deptno
	FROM EMP e 
	WHERE to_char(hiredate,'MM')= 04);

--private String ename;
--private int deptno;
--private DATE hiredate;
--private int ipmm;

--정답
SELECT *
FROM EMP
WHERE deptno IN (
	SELECT deptno
	FROM EMP 
	WHERE to_char(hiredate,'MM') = '02'
);
-- VO Emp
-- public List<Emp> getExp07(String mm){}
SELECT * FROM SALGRADE s;
--[1단계:확인] 2. 등급테이블의  salgrade1000 테이블을 복사 만들고, 해당 정보를 메서드를 만드세요.
CREATE TABLE salgrade1000
AS SELECT * FROM salgrade;

SELECT * FROM salgrade1000;
class salgrade1000{
	private int grade;
	private double losal;
	private double hisal;
}

--[1단계:확인] 3. 사원명과 부서명의 통합테이블 EmpDept100 테이블을 복사 만들고, 해당 정보를 메서드를 만들고 데이터를 입력하세요.
---  empdept100 테이블에 데이터를 입력하는 문제입니다. 오늘 주로 다룬 내용..
SELECT * FROM EmpDept100;
DELETE FROM EmpDept100 WHERE ename = '홍길동';
DROP TABLE EmpDept100;

CREATE TABLE EmpDept100
AS SELECT empno, ename, job, mgr, hiredate, sal, comm, e.deptno deptno, dname,loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;

--class EmpDept100{
--	private int empno
--	private String ename;
--	private String job;
--	private int mgr;
--	private date hiredate;
--	private String hiredateS;
--	private double sal;
--	private double comm;
--	private int deptno;
--	private String dname;
--	prvate String loc;
--}

INSERT INTO EmpDept100 values(1000, '홍길동', '사원', 7902, '2022-10-14', 3000, 500, 20, 'RESEARCH', '인천');
DELETE FROM EmpDept100 WHERE ename = '홍길동';

--[1단계:확인] 4. member100(아이디, 패스워드, 이름, 권한, 포인트, 등록일) 만들고, 데이터를 등록 후, 조회하는 메서드를 선언 및 출력하세요.
CREATE TABLE member100 (
	id varchar2(20),
	passwd varchar2(30),
	name varchar2(20),
	auth varchar2(20),
	point NUMBER,
	makedate date
);
DROP TABLE member100;
SELECT * FROM member100;
DELETE  FROM member100 WHERE id = 'admin';
INSERT INTO member100 values('admin','1234','홍길동','관리자',200,'2022/10/14');
--private String id;
--private Stinng passwd;
--private String name;
--private String auth;
--private int point;
--private DATE makedate;
--[1단계:확인] 5. 위 member100테이블을 기준으로 아이디, 패스워드를 입력(Scanner)받아 select문으로 
--         데이터를 조회하여 로그인 성공 여부를 출력하는 Dao기능메서드를 만드세요.
SELECT * 
FROM member100
WHERE id = 'admin'
AND passwd = '1234';