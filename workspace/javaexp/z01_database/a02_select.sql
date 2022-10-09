/*
# SELECT sql의 명령문의 표준 형식
1. 주로 데이터를 선택해서 가져올 때, 활용된다.
2. 기본 형식
	select * | 컬럼명 : 열단위로 나타날 데이터를 선택
	from 테이블명 테이블별칭 : 대상 테이블명과 alias명
	where 조건문 : 행단위로 나타날 데이터 filtering 처리
	group by 그룹할 컬럼지정 : 특정 컬럼 기준으로 합산, 갯수, 최대/최소값
	having : 그룹의 조건을 지정 : 그룹 컬럼의 조건
	order by : 정렬할 우선 순위 컬럼 지정
 */
-- where 조건 처리
SELECT deptno, ename, sal -- [열단위 선택] 컬럼단위로 행을 선택
FROM emp
WHERE sal >= 3000; -- [행단위 filtering] sal가 3000이상인 경우만 검색
-- group 함수 처리
SELECT deptno, SAL 
FROM emp
ORDER BY deptno;
SELECT deptno, max(sal) "부서번호별 최고 연봉"
FROM emp
GROUP BY deptno; -- 그룹할 부서번호 설정
-- order by 정렬 처리
SELECT sal, ename
FROM emp
ORDER BY sal desc; -- sal를 기준으로 데이터를 정렬 처리 (desc - 역정렬)
/*
# where 조건문
1. 질의어에서 필요한 관계대수(=,>=,<=,>,<,!=,<>)로 select의 컬럼에 대하여 
	행단위로 조건에 해당하는 데이터를 로딩해준다.
2. 관계대수를 연결하는 논리처리(and, or, not, sbuquery(중첩정의))를 통해서 행단위 데이터를 
	필터링한다.
*/
-- 연봉의 2000~4000 사이의 사원 정보를 출력하세요.
SELECT sal, e.*
FROM emp e
WHERE sal>=2000 AND sal<=4000;
-- 부서번호가 10인 데이터
SELECT deptno, e.*
FROM emp e
WHERE deptno=10;
-- 사원명이 'KING'인 사람의 정보 출력
SELECT *
FROM emp
WHERE ename = 'KING';
-- empno(사원번호), ename(사원명), job(직책명), mgr(관리자번호), hiredate(입사일)
-- sal(급여), deptno(부서번호)
-- ex1) 직책이 'SALESMAN'인 사원정보를 출력하세요
 SELECT *
 FROM emp
 WHERE  job='SALESMAN';
-- ex2) 급여가 2000 이상인 사원명, 급여, 부서번호를 출력하세요.
SELECT ename "사원명 ", sal "급여", deptno "부서번호"
FROM emp
WHERE sal>=2000;
-- ex3) 연봉이 1000~3000이고 부서번호가 10인 사원의 사원번호, 사원명, 급여, 부서번호를 출력하세요.
SELECT empno "사원번호", ename "사원명", sal "급여", deptno "부서번호"
FROM emp
WHERE sal>=1000 AND sal<=3000 AND deptno=10;
/*
 # 테이블에 ALIAS를 사용하는 경우
 1. 두개 이상의 테이블을 사용하는데, 두개 테이블에 공통 컬럼이 있을 경우
 		해당 컬럼명 앞에 e.컬럼명, d.컬럼명으로 어디 소속의 테이블인지 지정할 때
 2. 한개 테이블이라도 전체 컬럼을 나타내고 e.* 소속되어 있는 다른 컬럼을 나타낼 때.
 */
SELECT deptno, e.*
FROM EMP e;
SELECT *
FROM dept d;
SELECT e.deptno, empno, ename, d.deptno, dname
FROM EMP e, DEPT d 
WHERE e.deptno = d.deptno;
/*
 # where 조건문 사용되는 비교 연산자
 1. = : 같을 때 ==(X)
 	!= : 같지 않을 때 ( <> )
 	not(조건문) : 해당 조건이 아닐 때
 2. is not null : null이 아닐 때
 	is null : null일 때
 	ex) 컬럼명 = null (X) ==> 컬럼명 is null
 		컬럼명 != null (X) ==> 컬럼명 is not null
 		
 */
SELECT *
FROM emp
WHERE deptno = 20;
SELECT *
FROM emp
WHERE  deptno != 20;
SELECT *
FROM emp 
WHERE depno <> 20; -- <> 도 같지 않을 떄에 사용된다.
SELECT *
FROM emp
WHERE NOT (deptno = 20); -- NOT(조건문)으로 반대 조건
SELECT *
FROM emp
WHERE NOT (deptno = 20 AND deptno = 30);
-- 부서번호가 20이고 30인 경우가 아닐 때 부서번호가 20이 아니거나 30인 경우
-- deptno != 20 or deptno <> 30 - 드모르강 법칙

SELECT *
FROM emp;
-- ex1) 부서번호가 30이 아닌 경우 처리를 위의 연산자의 내용으로 3가지를 기술하세요.
SELECT * FROM emp
WHERE deptno <>30;

SELECT * FROM emp
WHERE deptno != 30;

SELECT * FROM emp
WHERE not (deptno = 30);

-- ex2) 보너스가 null인 경우와 null이 아닌 경우를 출력하세요.
SELECT * FROM emp
WHERE comm = NULL; -- (X)

SELECT * FROM emp
WHERE comm IS NULL;

SELECT * FROM emp
WHERE comm IS NOT NULL;

-- ex3) 급여가 1000미만 이거나 4000 이상이 아닌 경우를 출력하세요.
SELECT * FROM emp
WHERE NOT (sal<1000 OR sal>=4000);
-- sal>=1000 and sal < 4000
/*
 # 논리 연산자
 1. or : 둘 중에 하나만 참인 경우 참

 # between 구문
 1. 컬럼명 between A and B
 	동일한 결과 내용으로 컬럼명>=A and 컬럼명<=b
*/
-- sal가 1000에서 2000사이 데이터 출력
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;
-- ex) empno가 7600~7900 사이의 사원 정보 출력..
SELECT * FROM  emp
WHERE empno BETWEEN 7600 AND 7900;
