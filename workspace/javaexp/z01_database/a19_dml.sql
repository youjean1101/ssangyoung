/*
 # 데이터 조작어(Data Manopulation Language)
 1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 똔느 삭제하기 위한 명령어이다.
 2. 종류
 	insert : 입력처리
 	update : 수정처리
 	delete : 삭제처리
 	merge : 병합처리명령어(논리적 테이블의 병합/수정과 동시에 입력)
 3. 트랜잭션
 	여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다.
 	명령어 종류 : COMMIT(정상종료), ROLLBACK(비정상종료 복구)
 	ex) db클라이언트가 접속해서 변경을 했을 때, 본인 계정으로만
 	변경된 데이터가 보인다.(다른 계정으로 접근하면 변경되지 않는 데이터가 보임)
 	이 때, COMMIT하는 순간 현재 클라이언트뿐만 아니라 다른 계정으로 접속하더라도 변경되게 처리된다.
 # 데이터 입력 처리
 1. 테이블에 데이터를 입력하기 위한 명령어 INSERT 구문을 말한다.
 2. 입력방법
 	1) 단일행 입력 : 한번에 하나의 행을 테이블에 입력하는 구문
 	2) 다중행 입력 : 서버 쿼리(subquery)를 이용하여 한번에 여러 행을 동시에 입력하는 구문
 3. 다중행 입력
 	1) 데이터를 하나의 테이블에 여러 행을 한 번에 입력하는 query를 말한다.
 	2) 형식
 		- insert 명령문에서 서버쿼리로 다른 테이블에 조회해 와서 입력처리
 		- insert 명령문에 의해 한번에 여러행을 동시에 입력
 		- 기타형식
 			insert all
 			first insert 
 */
/*
 # 전체 컬럼 입력
 insert into 테이블명
 subquery - 해당 테이블에 맞는 행의 갯수로 입력
 # 지정된 컬럼 입력
 insert into 테이블
 subquery
 */
DROP TABLE emp12;
CREATE TABLE emp12
AS SELECT empno, ename, job,deptno FROM emp WHERE 1=0;
SELECT * FROM emp12;
-- 테이블의 전체컬럼에 맞게 subquery를 선언하여 데이터를 한번에 입력
INSERT INTO emp12
SELECT empno, ename, job, deptno
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 테이블의 지정된 컬럼에 맞게 subquery를 선언하여 데이터를 한번에 입력.
INSERT INTO emp12(empno, ename)
SELECT empno, ename
FROM emp
WHERE to_char(hiredate,'MM') IN('01','05','12');
SELECT * FROM emp12;
-- ex) 사원번호, 부서명, 급여가 있는 데이터가 없는 복사테이블 emp13을 만들고, 
--		부서별 최고 급여를 subquery를 통해 위 emp13테이블에 입력하세요.
CREATE TABLE emp13
AS SELECT empno,dname,sal FROM emp e, dept d 
WHERE 1=0
AND e.deptno = d.deptno;

SELECT * FROM emp13;
-- 1. 부서별 최고급여
-- 3. 입력처리
INSERT INTO emp13
SELECT empno,dname,sal
FROM emp e,dept d
WHERE e.deptno = d.deptno;
AND (e.deptno, sal) in(
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno);
SELECT * FROM emp13;
