/*
# 그룹조인
1. 그룹함수에 대한 이해
	여러가지 통계 함수를 통해서 여러 행으로 처리된 데이터를 단일행 
	또는 통계적으로 연산되어 줄어든 행으로 처리한다.
2. 조인의 형식
	테이블과 테이블의 연관관계 컬럼을 기준으로 해서 효율적으로 데이터를 출력하기 위하여 사용된다.
	1) equi
	2) non equi
	3) outer join
	4) subquery를 통한 조인
	5) inline view를 통한 가상테이블 조인
	 
3. 그룹함수를 통한 조인처리
	1) 통계 함수를 통한 결과값이 있을 그 내용을 기준으로 조인을 하는 것을 말한다.
		주로 subquery를 통한 조인이나, inline view를 통한 조인을 사용한다.
		통계 함수를 통한 데이터는 전체데이터를 가져오고 통계값만 가져올 수 있기에 subquery나 
		inline view를 통해서 join을 처리한다.
		ex) 부서별  최고급여를 그룹함수 sql을 통해서 처리할 수 있지, subquery나 inline view를 사용하여
			조인하지 않으면 부서별 최고급여자의 전체 정보를 가지고 올 수 없다.
# 그룹함수의 기본 형식
1. 형식
	SELECT 컬럼명, 함수명(컬럼)
	FROM 테이블명
	WHERE 테이블의 컬럼에 대한 조건
	GROUP BY 그룹처리할 컬럼
	HAVING 함수명(컬럼)에 대한 조건
	0) 그룹함수는 group by, having을 통하지 않고, 선언하면, 해당 테이블의 전체 데이터에 대한 통계를 가지고 올 수 있다.
		select sum(sal) from emp; ==> 사원정보의 전체 급여의 총계
		select max(sal)
		from emp
		where job = 'MANAGER'; ==> 직책이 MANAGER인 사원 중에 최고급여
	1) GROUP BY : 그룹을 지정할 컬럼으로 반드시, SELECT에서 그룹별로 처리한
		컬럼을 지정할 때, 사용된다. SELECT에서 선언된 그룹할 컬럼은 반드시 여기에 선언되어야 한다. 
		SELECT deptno, sum(sal) 
		from emp
		group by deptno; ==> 부서별 급여의 총계
			10	4000 ==> 해당 부서의 급여의 총계
			20	7000
			30	8000
	2) HAVING : 그룹함수에 대한 조건 지정. 함수명으로 조건을 처리하기 때문에 
		WHERE 조건과 구분하여 처리하여야 한다.
2. 그룹함수의 종류
	1) count(컬럼명), count(*) 형식으로 컬럼명이 있을 때는 NULL을 제외한 갯수를 처리하고,
		*을 처리할 때는 NULL을 포함한 통계치(갯수)를 처리한다.
	COUNT : 행의 갯수
	MAX : 최대값
	MIN: 최소값
	SUM : 합
	AVG : 평균값
	STDDEV : 표준편차, VARIANCE : 분산

*/ 
-- GROUP이 처리되지 않는 저체 데이터를 통한 통계치
-- 각각의 내용으로 전체 기준과 NULL을 제외한 기준을 확인할 수 있다.
SELECT COUNT(*), COUNT(COMM),COUNT(MGR)
FROM emp;
-- 그룹함수는 여러개를 같이 사용할 수 있다.
SELECT COUNT(sal), MAX(sal), MIN(sal), MAX(hiredate), Min(hiredate)
FROM emp;
-- hiredate와 같이 날짜형인 경우에는 현재를 기준으로 최근 입사, 최초 입사등으로
-- 개념으로 데이터를 호출할 때도 함수를 활용한다.
-- WHERE 조건안에 그룹을 처리하여 데이터를 확인할 수 있다.
SELECT COUNT(sal), max(sal) 
FROM emp
WHERE sal<4000;
-- 4000미만의 조건하에 그룹함수가 적용된 경우..
SELECT * FROM emp;
-- ex) 3000이하의 급여중 최대 급여와 최근에 입사한 입사일을 출력하세요.
-- max(sal) : 3000이하 중 최대급여
SELECT max(sal),max(hiredate),count(*)
FROM emp
WHERE sal <= 3000;
-- 그룹이 적용이 되는 데이터
-- 사원번호별로 최대 급여
SELECT DISTINCT  deptno
FROM emp;

SELECT deptno, sal
FROM emp
ORDER BY deptno, sal;
SELECT deptno, max(sal)
FROM emp
GROUP BY deptno;
-- 그룹함수 적용된 내용을 여러 개 선언하여도 무방하다.
SELECT deptno, min(sal), max(sal), avg(sal), sum(sal), count(sal),
		min(hiredate), max(hiredate)
FROM emp
GROUP BY deptno;
-- count()의 경우, null이 포함된 것과 그렇지 않는 것이 차이가 컬럼이나 *에 따라서 
-- 차이가 난다.
SELECT deptno, count(comm), count(*)
FROM emp
GROUP BY deptno;
-- having은 통계함수가 적용된 내용에 대한 조건을 처리할 때, 사용된다.
SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno
HAVING avg(sal)>=2000;
-- avg()에 의해서 평균치가 나오고 그 평균치에 대한 조건을 처리할 때 사용된다.
SELECT * FROM emp;
-- ex) 직책(job) 별로 최대급여와 데이터건수를 출력하되 데이터건수가 2이상인 것을 검색하세요.
SELECT job, count(*),max(sal) FROM emp
GROUP BY job
HAVING count(*) >= 2;
-- where 조건은 우선 그룹처리한 데이터를 일단 조건에 의해 filtering 하고, 
-- 그 다음 데이터를 기준으로 통계함수에 의해 처리되고, 그 처리된 통계함수를 
-- having에 의해 조건을 처리된다.
-- 그러므로 1) where조건, 2) having에 의해 순차별로 조건 처리된다.

/*
 # 그룹할수를 통한 조인 방법
 1) subquery를 통한 조인
 2) inline view를 통한 가상테이블 조인
 */
-- 최대급여에 해당 하는 사원을 출력
-- 1) 최대 급여를 그룹함수를 활용해서 가져와서
-- 2) 급여를 위 최대 급여에 equi 조인으로 처리한다.
SELECT max(sal) FROM emp;

SELECT * FROM emp
WHERE sal = (
	SELECT max(sal) FROM emp
);
-- ex) 평균급여보다 많은 사원을 출력하세요.
SELECT avg(sal) FROM emp;

SELECT *
FROM emp
WHERE sal > (
	SELECT avg(sal)
	FROM emp);
-- 부서별 최고 급여자의 정보를 출력하세요.
-- 1) 부서별 최고 급여
SELECT deptno, max(sal)
FROM emp
GROUP BY deptno;
--	데이터 출력 결과가 2행이상일 때는 in으로 처리하여야 한다.
-- 2) subquery로 사원 정보
SELECT *
FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno
);
SELECT * FROM emp;
-- ex) 직책별 최초 입사자를 출력하세요
	SELECT job, min(hiredate)
	FROM emp
	GROUP BY job;

SELECT *
FROM emp
where (job,hiredate) IN (
	SELECT job, min(hiredate)
	FROM emp
	GROUP BY job);
-- 위 내용을 inline 뷰를 통해서 처리
SELECT e.* FROM emp e,(
	SELECT job, min(hiredate) hiredate
	FROM emp
	GROUP BY job
) me
WHERE e.job = me.job
AND e.hiredate = me.hiredate;

SELECT * FROM emp;
-- ex) 직책별 최고 급여자를 inline 뷰를 통해서 조인하여 출력하세요.
SELECT job,max(sal) msal
	FROM emp
	GROUP BY job;

SELECT e.*
FROM EMP e ,(
	SELECT job,max(sal) msal
	FROM emp
	GROUP BY job
) jma
WHERE e.sal =jma.msal
AND e.job = jma.job;
-- 여러가지 함수를 이용해서 변형된 데이터를 기준으로 subquery join이나, inline view를 
-- 통한 조인
-- 분기별 최저급여자를 출력
-- to_char(날짜데이터, 'Q')
-- 1. 분기별 최저급여
SELECT to_char(hiredate,'Q') div, min(sal) misal
FROM emp
GROUP BY to_char(hiredate, 'Q')
ORDER BY div;

SELECT e1.*, e.*
FROM emp e, (
	SELECT to_char(hiredate,'Q') div, min(sal) misal
	FROM emp
	GROUP BY to_char(hiredate, 'Q')
) e1
WHERE to_char(e.hiredate, 'Q') = e1.div
AND e.sal = e1.misal
ORDER BY div;


-- ex) 사원정보 홀수/짝수별 최고급여 정보를 출력하세요. hint) decode(mod(empno,2),0,'짝','홀)
SELECT decode(mod(empno,2),0,'짝','홀') div, max(sal)
FROM emp
GROUP BY MOD(empno,2);

SELECT decode(mod(e.empno,2),0,'짝','홀') div, e.*
FROM emp e, (
				SELECT mod(empno,2) div, max(sal) msal
				FROM emp
				GROUP BY MOD(empno,2)
			) e1
WHERE mod(e.empno,2) = e1.div
AND e.sal = e1.msal;



