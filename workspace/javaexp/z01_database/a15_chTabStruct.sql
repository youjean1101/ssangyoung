/*
# 테이블 구조의 변경
1. 개요
	테이블을 사용하다보면 여러가지 상황에 따라 테이블의 구조를 변경하는 경우가 발생한다.
	테이블의 구조를 변경하는데 필요한 명령을 파악하고, 테이블 구조의 변경시 발생하는 데이터 처리
	에 대한 내용을 파악해보자.

2. 컬럼의 추가
	alter table 테이블명
	add 컬럼명 데이터유형 [default 디폴트데이터, 제약조건]
*/
DROP TABLE emp14;
CREATE TABLE emp14
AS SELECT empno, ename, job, sal FROM emp;
SELECT * FROM emp14;
-- 주소 추가
ALTER TABLE emp14
ADD address varchar2(20);
-- 기본데이터가 있는 컬럼 추가
ALTER TABLE emp14
ADD hiredate DATE default sysdate;
-- ex) emp15로 부서명, 사원명, 직책, 급여로 복사 테이블을 만들고,
-- 	해당테이블에 bonus 컬럼 default데이터 0을 입력처리하세요.
DROP TABLE emp15;
CREATE TABLE emp15
AS SELECT dname, ename, job, sal 
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO ;
SELECT * FROM emp15;
ALTER TABLE emp15
ADD ( 
	bonus NUMBER DEFAULT 0,
	gender char(1)
);
-- 2개 이상의 컬럼을 추가할 때는 add(컬럼1, 컬럼2, 컬럼3) 형식으로 처리
SELECT * FROM emp15;
/*
 # 컬럼의 삭제
 1. 기본형식
 	alter table 테이블명 drop column 컬럼명;
*/
SELECT * FROM emp15;
-- 직책 삭제
ALTER TABLE emp15 DROP COLUMN job;
-- ex) emp16으로 사원정보와 부서정보가 조인된 컬럼을 만들고, 
-- 		deptno를 모두 삭제
CREATE TABLE emp16
AS SELECT e.*, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO ;
SELECT * FROM emp16;
ALTER TABLE emp16 DROP COLUMN deptno;
/*
# 테이블 컬럼 변경
1. 기능
	1) 테이블에서 컬럼의 타입, 크기, 기본값 변경은 가능하다.
	2) 기본형식
		ALTER TABLE 테이블명
		MODIFY 컬러명 변경할 데이터 유형;
	3) 데이터의 유무에 따른 한계
		- 데이터가 없는 경우 : 컬럼 타입이나 크기 변경이 자유롭다.
		- 데이터가 있는 경우 : 타입변경은 같은 유형끼리 변경하되 작은유형에서 큰유형으로 변경가능하다.
	4) 기본 값의 변경은 변경 후에 입력되는 데이터로부터 적용된다.
*/
-- 데이터가 없는 경우
DROP TABLE emp16;
CREATE TABLE emp16
AS SELECT * FROM emp WHERE 1=0; 
SELECT * FROM emp16;
-- 날짜 유형에서 문자열 유형으로 변경 : 데이터 없으므로 가능
ALTER TABLE emp16 
modify hiredate varchar(16);

DROP TABLE emp17;
CREATE TABLE emp17 AS SELECT * FROM emp;

ALTER TABLE emp17 
modify hiredate varchar2(16); -- 데이터가 있으므로 에러 발생

SELECT * FROM emp17;
ALTER TABLE emp17 
modify ename varchar2(50); -- 같은 데이터 유형에서 크게 변경하는 것은 가능

-- ex1) emp18로 데이터가 없는 복사테이블 생성 사원명을 날짜 유형으로 변경
CREATE TABLE emp18 AS SELECT * FROM emp WHERE 1=0; 
SELECT * FROM emp18;
ALTER TABLE emp18 
modify ename date;

-- ex2) emp19로 데이터가 있는 복사테이블 생성 직책과 이름을  varchar(50)으로 각각 변경
CREATE TABLE emp19
AS SELECT * FROM emp; 

SELECT * FROM emp19;

ALTER TABLE emp19 
modify (job varchar2(50),
		ename varchar2(50));


