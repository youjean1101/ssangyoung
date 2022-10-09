/*
# 전날 sql 파일 처리
1. 파일에 내용을 적고, 실행하는 것을 기존에 연결 상태로 계속할 수 있다.
2. 저장을 누르는 순간 연결은 끊어진다.
	- 파일에 변경된 내용은 마지막에 저장을 하든지 
	- 중요한 부분에서 저장을 한번 하고, 위 연결 옵션을 다시 선택..
	
 */
SELECT ename, job FROM emp;

SELECT * FROM emp;
-- 주석
-- 커서를 명령문에 위치시키고 ctrl+enter(실행)
/*
블럭 후, ctrl+shift+/ 여러줄 주석
# 데이터 조회하기
데이터는 select 구문을 이용하여 저장된 데이터를 호출할 수 있다.
1. 기본 형식
	select * | 컬럼1, 컬럼2
	from 테이블명
	where 조건
*/
SELECT *
FROM emp;
-- emp 테이블의 전체 컬럼(*)을 검색
SELECT ename, job, deptno
FROM emp;
-- emp 테이블의 ename, job, deptno 컬럼을 검색
-- ex1) dept 테이블의 전체 컬럼 검색
SELECT * FROM dept;
-- ex2) emp 테이블의 empno,mgr, hiredate, deptno 출력
SELECT empno, mgr,hiredate,deptno FROM emp ;
/*
2. 테이블명과 컬럼명의 별칭(alias) 처리하기
	테이블명과 컬럼명에는 as라는 키워드를 쓰거나 공백을 통해서
	별칭을 선언하여, 컬럼명이나 테이블명으로 활용할 수 있다.
*/
SELECT empno, empno AS NO, ename AS name,
		hiredate birthdate, deptno dno -- 타이틀명이 중요
FROM emp; 
/*
ex) 다음과 같이 별칭을 as, 공백을 이용하여 컬럼을 출력하세요
emp 테이블의 empno ==> eno, ename ==> name, mgr ==> management,
			sal ==> salary
*/
SELECT empno AS eno, ename AS name, mgr AS management, sal AS salary
FROM emp;
/*
# 기본적인 테이블 처리 문법은 여러 테이블과 함께 사용할 때, 활용된다.
동일한 컬럼이 있을 경우 구분하기 위한 내용이다.
테이블이 하나밖에 없을 때는 테이블명을 생략하여도 된다.
*/
SELECT * FROM  emp;
SELECT * FROM dept; 
SELECT emp.deptno, ename, dept.deptno, loc
FROM emp, dept;
SELECT e.deptno, ename, d.deptno, loc
FROM emp e, dept d;
SELECT  deptno, ename
FROM emp;
SELECT deptno, dname
FROM dept;
-- 그런데, 특정 칼럼을 나타내고 전체 컬럼을 나타낼 때는 alias를 
-- 하나의 테이블인 경우도 처리하여야 한다.
SELECT empno NO, e.*
FROM emp e;
--SELECT empno NO, *
--FROM emp; -- 에러발생.
/*
# alias의 공백과 특수문자 사용
1. alias명으로 공백이나 특수문자를 사용할 때는 ""로 양옆에
	쌍따옴표를 처리한다.
2. 한글이라도 붙여서 처리하는 경우에는 필요없다.
**/
SELECT ename "사 원 정 보", ename "@ 사원 정보 #", -- 공백에는 ""를 붙여야함
	sal 급여
FROM emp;
-- ex) 해당 컬럼이 alias로 처리하여 출력하세요.
-- 		empno("사 원 번 호") ename("!!@사원명@!!"),
--		sal("급!!!여")
SELECT empno "사 원 번 호", ename "!!@사원명@!!", sal "급!!!여"
FROM emp;
/*
 # 데이터의 산출 연산 처리와 문자 연결
 1. 숫자형/날짜형 데이터가 있는 컬럼은 연산처리가 가능하다.
 	1) 일반 숫자
 		사칙연산자(+,-,*,/), %(지원하지 않음 - mod(데이터1,
 		데이터2) - 함수 파트에서 나머지연산 지원
 */
SELECT empno, empno + 10 "사원번호+10",
	sal*0.5 "급여의 50%", deptno,
	sal*(deptno/10) "급여와 부서 연산",
	mod(sal, deptno) "나머지"
FROM emp;
-- ex) 사원번호(empno)를 만단위체제로 10000을 더하여 처리하고, 
-- 		sal와 comm을 합산하여 아래의 컬럼형태로 나타내세요.
-- 		사원번호(만단위) 급여(sal) 보너스(comm) 합산(sal+comm)
SELECT empno+10000 "사원번호(만단위)", 
	sal "급여(sal)", comm "보너스(comm)", 
	sal+comm "합산1(sal+comm)", sal+nvl(comm,0) "합산2(sal+comm)"
FROM emp;
-- comm값이 없는 경우 합산하면 null 된다.
-- 연산을 처리하는 경우 피연산자가 하나라도 데이터가 null인 경우 연산이 되지 않고, null로 처리가 된다.
-- nvl(컬럼, null인 경우 초기값) null인 경우 특정한 값으로 초기화
-- 위의 comm이 null인 경우 0으로 처리하여 연산을 처리할 수 있게 한다.
/*
 2. 컬럼과 문자열 연결 처리 : 문자열 || 문자열
 	- 데이터 베이스는 문자열 + 문자열을 처리하지 않는다.
 	1) 기본형식
 		select 컬럼명 || '연결할문자열', 컬럼명1||컬럼명2,
 */
SELECT  empno ||'번' 사원번호,
		empno ||'/'||deptno "사원번호/부서번호",
		empno || ename "사원번호와 이름"
FROM emp;
-- 사원정보(emp)의 컬럼 내용
-- empno(사원번호), ename(사원명), job(직책), mgr(관리자번호)
-- hiredate(입사일), sal(급여), comm(보너스), deptno(부서번호)
-- ex1) 
--	# 사원 정보 #	
--	사원명 @@@의 사원번호는 @@@입니다.
SELECT '사원명 '|| ename ||'의 사원번호는 '|| empno ||' 입니다.'
"# 사원 정보 #"
FROM emp;

		