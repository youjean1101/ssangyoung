/*
# 그룹함수란?
1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화하여 그룹별로 
	결과를 출력하는 함수, 그룹함수는 통계적인 결과를 출력하는데
	자주 사용한다.
2. 사용법
	select 기준컬럼, 그룹함수(컬럼)
	from 테이블명
	[where]
	group by 그룹컬럼
	having 그룹함수를 적용한 결과를 조건 처리
3. 그룹함수의 종류
	1) count() : 데이터의 건수, 행의 갯수
	2) max() : null을 제외한 모든 행의 최대값
	3) min() : null을 제외한 모든 행의 최소값
	4) sum() : null을 제외한 모든 행의 합
	5) avg() : null을 제외한 모든 행의 평균값
	6) stddev() : null을 제외한 모든 행의 표준편차
	7) variance() : null을 제외한 모든 행의 분산 값 
**/
SELECT count(comm), count(*) FROM emp;
SELECT deptno, sal FROM emp ORDER BY deptno, sal;
SELECT max(sal), min(sal), count(*) FROM emp;
SELECT deptno, max(sal), min(sal), count(*)
FROM emp
GROUP BY deptno
ORDER BY deptno;
-- ex) 직책별와 사원의 수와 평균급여를 출력하세요.
SELECT job 직책, count(job) 사원의수, round( avg(sal) ) 평균급여
FROM emp
GROUP BY job
ORDER BY floor(avg(sal)) desc;
-- 날짜형 데이터 min, max()는 최근 데이터, 가장 먼저 데이터
SELECT deptno, min(hiredate) "가장 먼저(입사)", max(hiredate) "가장 나중(입사)"
FROM emp
GROUP BY deptno
ORDER BY deptno;
-- 부서별로 평균 급여 중에 조건 검색
SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno
HAVING avg(sal)>=2000; -- 적용한 그룹함수의 조건을 처리할 때는 having을 활용한다.
-- ex) 부서별로 최대값이 3000이상인 사원을 검색하세요.
SELECT deptno 부서, max(sal) 최대값
FROM emp
GROUP BY deptno
HAVING max(sal)>=3000;
/*
# 함수를 적용한 그룹데이터 처리.
1. 그룹데이터를 함수를 적용해서 변경한 데이터를 기준으로 처리할 수 있다.
2. 기본형식
	select 함수(데이터), 그룹함수()
	from 테이블
	group by 함수(데이터)
 */
-- 분기별 최대 급여액 출력
SELECT to_char(hiredate,'Q') 분기, max(sal)
FROM emp
GROUP BY to_char(hiredate,'Q')
ORDER BY to_char(hiredate,'Q');
SELECT * FROM emp;
-- ex) 연도별 사원의 수와 최대급여를 출력하세요.
SELECT to_char(hiredate,'YYYY') 연도,COUNT(ename) 사원수,max(sal) 최대급여
FROM emp
GROUP BY to_char(hiredate,'YYYY')
ORDER BY 연도; -- ORDER by는 alias이름으로 지원 처리
