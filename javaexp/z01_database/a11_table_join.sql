/*
 # 조인(join)
 1. 조인의 개념
 	1) 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 것을 말한다.
 	2) 관계형 데이터베이스 분야의 표준
 		entity relation diagram(ERD)
 	3) 두개 이상의 테이블을 결합한다는 의미
 2. 조인의 필요성
 	1) 조인을 사용하지 않는 일반적인 예
 		학생 주소록을 출력하기 위해 학생들의 학번, 이름, 소속학과
 		이름을 검색
 		학생에 대한 정보 검색하는 단계 필요
 		학생 정보에서 소속학과번호 정보를 추출하여 소속학과 
 		이름을 검색하는 단계 필요
 		ex) 사원 번호가 7369인 사원의 이름과 부서이름, 부서위치를 출력
 			- 사원정보에서 부서번호를 가져온다.
 			- 부서정보에서 부서이름과 부서위치를 가져온다.
 	2) 조인을 하는 경우
 		연관관계에 있는 부서번호를 조회 조건으로 검색을 하면 한번에 
 		원하는 데이터를 가져올 수 있다. 
 */
SELECT * FROM emp;
SELECT * FROM dept; -- deptno로 연관 관계가 설정
-- 7369 사원의 부서정보 가져오기
SELECT *
FROM emp
WHERE empno = 7369;
-- 부서정보 확인 20
SELECT *
FROM dept
WHERE deptno=20; -- 7369 사원의 부서명은 RESEARCH이다.
-- 두개의 검색을 통해서 데이터를 가져옴
-- 조인을 하는 경우 
SELECT e.*, d.*
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND empno = 7369;
/*
 # equi join
 1. 개념
 	1) 조인 대상 테이블에서 공통 컬럼을 '=' equal 비교를 통해 같은 값을 가지는 행을 연결하여
 		결과를 생성하는 조인 방법
 	2) SQL 명령문에서 가장 많이 사용하는 조인 방법
 	3) 조인 애트리뷰트(속성)을 활용하는 대표적인 형식
 2. where 절을 이용한 equi join 사용방법
 	select 테이블1.컬럼명, 테이블2.컬럼명, ....
 	from 테이블1, 테이블2
 	where 테이블1.공통컬럼 = 테이블2.공통컬럼
 	
 	1) from : 조인 대상 테이블을 기술한다. 테이블은 콤마(,) 구분
 	2) where : 조인 애트리뷰트와 '='연산자를 사용하여 조인 조건을 기술
 		- 기타 조건에 대한 설정을 and 조건으로 연결하여 처리한다.
 */
-- 연봉이 3000이상인 사원의 사원명과 부서명을 출력
SELECT ename, sal, dname, e.deptno --공통컬럼만 alias이름 선언한다.(키값)
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal > = 3000;
SELECT * FROM emp;
--ex) 직책이 SALESMAN인 사원의 부서번호, 부서명, 사원명, 직책을 출력하세요.
SELECT e.deptno 부서번호 ,dname 부서명, ename 사원명, job 직책 
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND job = 'SALESMAN';
-- dept(부서테이블) : 부서번호(deptno), 부서명(dname), 부서위치(loc)
-- 부서명별로 최고급여자
SELECT dname, max(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY dname;

-- ex) 부서위치(loc)별로 가장 마지막에 입사한 입사일을 출력
SELECT loc,  max(hiredate) 최근입사일
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY loc
ORDER BY 최근입사일;
GROUP BY loc
ORDER BY 최근입사일;
/*
# Non equi join
1. 조인하는 두개의 테이블의 값이 동일하지 않고, 범위로서 join하는 경우를 말한다.
*/
SELECT ename, sal FROM emp;
SELECT * FROM salgrade;
SELECT ename,sal, grade, losal||'~'|| hisal 범위
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;
-- ex1) 4등급에 해당하는 사원들의 정보를 출력
SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT s.grade, e.*
FROM emp e, salgrade s
WHERE grade = 4 
AND sal BETWEEN losal AND hisal;
-- ex2) SMITH의 급여와 급여동급을 출력
SELECT ename, sal, s.grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal
and ename = 'SMITH';
-- 
/*
# Outer join
1. equi join의 조인 조건에서 양 테이블의 컬럼 값 중, 어느 하나라도 null이면
	'=' 비교 결과가 거짓이 되어 null값을 가진 행은 조인 결과로 출력 불가
	null에 대하여 어Ej한 연산을 적용하더라도 연산 결과는 null로 처리된다.
	ex) 사원정보와 부서정보 테이블 조인에서 부서번호가 40인 사원정보는 없기에 
		부서정보 40은 출력되지 않게 된다.
2. equi join에서 양측 컬럼 값 중의 하나가 null이지만, 조인 결과로 출력할 필요가 
	있을때, outer join 사용한다.
	ex) 사원정보와 부서정보 테이블을 조인하면서, 사원정보가 없는 40번 부서정보도
		outer join을 이용하면 출력하게 된다.
3. 기본 형식
	1) (+) 기호를 사용하여 해당 테이블에 정보가 없을 지라도 표시할 컬럼을 지정하여 처리한다.
	select 테이블1.컬럼1, 테이블1.공통컬럼, 테이블2.공통컬럼, 테이블2.컬럼1
	from 테이블1, 테이블2
	where 테이블1.공통컬럼(+) = 테이블2.공통컬럼
	**
*/
SELECT DISTINCT deptno FROM emp;
SELECT * FROM dept;
SELECT ename, e.deptno, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;
/*
# 데이터가 없는 테이블의 outer join시 처리한 내용
1. nvl 함수 처리
	없는 데이터에 대하여 nvl함수를 통해 데이터가 없을 표기
2. count(),max() 등 그룹함수 처리
	그룹함수에서는 일반적으로 null을 포함하지 않고 처리가 된다.
*/
SELECT nvl(ename, '사원정보없음') ename, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;

SELECT dname, count(e.deptno) "사원정보의 건수", count(d.deptno) "부서정보의 건수"
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
GROUP BY dname;
-- ex) outer join을 하여 부서명, 사원명, 급여를 출력하되, 급여가 3000이상인 데이터만 출력하세요.
SELECT dname, ename, sal 
FROM emp e, dept d
WHERE e.deptno(+) = d.DEPTNO
AND sal >= 3000;
SELECT dname, nvl(ename,'없음') ename, nvl(sal,0) sal
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
AND sal < 3000;