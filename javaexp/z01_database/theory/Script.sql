/*
# 데이터 수정
1. update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어이다.
2. 기본형식
	update 테이블명
	set 컬럼1 = 변경할 데이터,
		컬럼2 = 변경할 데이터
		...
	where 조건문
3. 주의사항
	1) where 절을 생략하면 테이블의 모든 행이 수정된다.
	2) 조건문과 변경할 데이터부분을 subquery를 이용하여 처리할 수 있다.
 */
SELECT * FROM emp10;
UPDATE emp10
	SET empno = 1000,
		job = '사원'
	WHERE empno = 7369;
-- ex1) emp10 보너스가 null인 데이터를 모두 1000으로 수정 처리하세요.
SELECT * FROM emp10;
UPDATE emp10
	SET comm = 1000
	WHERE comm is NULL;
-- ex2) emp10 1/4분기에 입사한 사원정보를 현재날짜로 수정처리하세요.
UPDATE emp10
	SET hiredate = sysdate
	WHERE to_char(hiredate, 'Q') =1;

/*
 # subquery를 통한 수정 처리
 1. update 명령문에 set부분이나 where 조건절에 subquery를 이용하여 수정 처리하는 것을 말한다.
 2. 다른 테이블이나 현재 테이블에 정보를 변경할 때, 일단 query를 수행한 결과로 해당
 	데이터를 수정 처리하는 것을 말한다.
 3. 변경할 컬럼의 타입과 갯수는 반드시 일치하여야 한다.
 4. 유형
 	1) set부분 subquery 활용
 		- 한 개의 컬럼 set 컬럼명 = (결과가 1개인 컬럼 query)
 		- 두개 이상의 컬럼 set(컬럼명,...) = (결과가 2개 이상 컬럼 query)
 -- 부서번호가 10인 사원정보의 급여를 부서정보 20인 사원의 최고급여로 변경 처리
 */
SELECT ename, sal
FROM emp10
WHERE deptno = 10;
SELECT max(sal)
FROM emp10
WHERE deptno = 20;
UPDATE emp10
	SET sal = (
	 SELECT max(sal)
	 FROM emp10
	 WHERE deptno =20
);
SELECT * FROM emp10;
-- ex) emp10에 직책인 SALESMAN인 사람의 평균 급여를 사원번호 7499에 급여로 수정처리하세요.
SELECT avg(sal) FROM emp10
WHERE job ='SALESMAN';

SELECT empno, sal FROM emp10
WHERE empno = '7499';

UPDATE emp10
	SET sal = (
	SELECT avg(sal) FROM emp10
	WHERE job ='SALESMAN'
	)
WHERE empno = 7499;
SELECT * FROM emp10;
	
-- ex) 2사분기 최고급여를 사원명 ALLEN의 급여로 변경처리하세요.
SELECT max(sal)
FROM emp10
WHERE to_char(hiredate,'Q')= 2;
UPDATE emp10 SET sal=(
	select max(sal)
	FROM emp10
	WHERE to_char(hiredate,'Q')= 2
	)
WHERE ename = 'ALLEN';
SELECT * FROM emp10
WHERE ename = 'ALLEN';
-- ex) 직책이 MANAGER인 사원의 최저급여를 SMITH의 급여로 수정하세요.
SELECT min(sal)
FROM emp10
WHERE job = 'MANAGER';

UPDATE emp10 SET sal =(
	SELECT min(sal)
	FROM emp10
	WHERE job = 'MANAGER')
WHERE ename = 'SMITH';
SELECT * FROM emp10;
/*
# 데이터삭제 처리
1. 조회조건 WHERE을 통해 특정한 데이터를 ROW단위로 삭제 처리한다.
2. ROW단위이기에 삭제구문을 선택하는 컬럼이 없다.
	DELETE	-- 선택하는 컬럼이 없음.
	FROM 테이블
	WHERE 조건
3. 조건은 기존에 데이터와 같은 subquery를 이용해서 조건을 활용가능하다.
	ex) 급여 중에 가장 낮은 데이터를 삭제 처리하세요.
*/
SELECT * FROM emp10;
DELETE FROM EMP10
WHERE empno = 7369;
DELETE 
FROM emp10 
WHERE sal = (
	SELECT min(sal) FROM emp10);
	
-- ex) 부서별로 가장 최근에 입사한 사원을 삭제 처리하세요.
SELECT * FROM emp10;

DROP TABLE emp10;

CREATE TABLE emp10
AS SELECT * FROM emp;

SELECT job, hiredate 
FROM emp10
WHERE HIREDATE  = (
	SELECT min(hiredate)
	FROM emp10
	GROUP BY job);
	
SELECT job,max(hiredate)
	FROM emp10
	GROUP BY job;
-- 정답
SELECT deptno, max(hiredate)
FROM emp10
GROUP BY deptno;
SELECT * FROM emp10;
DELETE 
FROM EMP10
WHERE (deptno, hiredate) in(
	SELECT deptno, max(hiredate)
	FROM emp10
	GROUP BY deptno);