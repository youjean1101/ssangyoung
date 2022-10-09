/*
 # 데이터 무결성 제약조건
 1. 목적
 	- 데이터의 정확성과 일관성을 보장하기 위함
 2. 데이터의 정확성을 유지하여 다양한 종류의 업무규칙을 고려하는 예
 	1) 학생테이블에 학년 데이터는 1,2,3,4 중의 하나만 입력
 	2) 모든 학번은 유일하게 처리
 	3) 학생테이블의 지도교수 번호는 지도교수테이블의 교수번호 중의 하나로만 추가/변경 가능
 3. 데이터 무결성 제약조건의 장점
 	1) 테이블 생성시 무결성 제약조건을 정의 가능
 		- 생성 후 제약조건 설정도 테이블 구조변경 명령을 통해 가능
 	2) 테이블에 대한 정의, 데이터 딕셔너리에 저장되므로 응용프로그램에서 
 		입력된 모든 데이터에 대한 동일하게 적용 가능
 	3) 제약조건을 활성화/비활성할 수 있는 융통성을 가지고 있다.
 4. 무결성 제약조건의 종류
 	1) not null : 해당 컬럼이 null을 포함할 수 없음. 즉 반드시 데이터를 입력하여야 
 		하는 컬럼 지정
 	2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 도는 열 조합을 지정하여야 한다.
 		ex) 학번, 주민번호, 사원번호를 중복하지 않아야 한다.
 			- null을 처리가 가능하고, null은 중복이 가능하다.
 	3) primary key : 해당 컬럼 값은 반드시 존재해야 하면 유일해야 한다.
 		not null과 unique가 결합한 형태
 		주로 테이블에서 식별해야 할 컬럼 즉, key를 지정할 때 사용되니다.
 	4) foreign key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하고 시행
 		ex) 사원의 테이블의 부서번호는 반드시 부서테이블에 있는 부서번호이어야 한다.
 	5) check : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건을 지정처리
 		ex) 학생테이블의 학년은 1~4만 데이터로 입력/수정할 수 있다.
 5. 설정 형식
 	1) 테이블 생성이나 구조 변경시 추가옵션 설정
 		컬럼명 데이터타입 constraint 제약조건명 제약조건
 		제약조건명 : 일반적으로 제약조건명은 테이블명_컬럼명_제약조건종류약어로 선언한다.
 			ex) emp_empno_pk : 사원테이블의 사원번호를 primary key로 설정함
 				을 포함하는 내용이다.
 6. 제약조건 설정의 내용을 확인하는 메타테이블
 	1) SYS.ALL_CONSTRAINTS : db시스템에 있는 제약정보의 메타테이블
 */
SELECT * FROM sys.ALL_CONSTRAINTS;
DROP TABLE student01;
CREATE TABLE student01(
	name varchar2(30) CONSTRAINT student01_name_nn NOT NULL
	);
SELECT * FROM student01;
INSERT INTO student01 values('홍길동');
INSERT INTO student01 values(null); -- 제약조건 에러 발생
-- ex) student02테이블에 학생번호, 이름, 국어, 영어, 수학점수로 컬럼을 설정하고, 
--		번호와 이름을 not null로 설정하고 데이터를 입력해보세요.

CREATE TABLE student02(
	NO NUMBER CONSTRAINT student02_NO_NN NOT NULL,
	NAME VARCHAR(50) CONSTRAINT STUDENT02_NAME_NN NOT NULL,
	KOR NUMBER(3),
	ENG NUMBER(3),
	MATH NUMBER(3)
	);
SELECT * FROM student02;
SELECT * FROM sys.ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE 'STUDENT02%';
INSERT INTO student02 values(1,'홍길동', 70,80,90);
INSERT INTO student02(NO, name) values(2,'오길동');
INSERT INTO student02(name,kor)  values('마길동', 80); --에러발생
INSERT INTO student02(NO, kor)  values(2,80); --에러발생
SELECT * FROM student02;
-- unique
DROP TABLE student03;
CREATE TABLE student03(
	sno NUMBER CONSTRAINT STUDENT03_SNO_UQ UNIQUE,
	NAME VARCHAR(50)
);
INSERT INTO student03 values(1,'홍길동');
INSERT INTO student03 values(2,'김길동');
INSERT INTO student03 values(null,'마길동');
INSERT INTO student03 VALUES(null,'오길동');
INSERT INTO student03 values(2,'신길동'); --에러발생
SELECT * FROM student03;
SELECT * FROM sys.ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE 'STUDENT03%';
-- ex) employee01에 사원번호, 사원명, 급여를 설정하되, 사원번호는 unique,
--		사원명은 not null로 제약조건을 설정하고, 데이터 입력 및 메타테이블을 통해 확인하세요.
DROP TABLE employee01;
CREATE TABLE employee01(
	empno number(4) CONSTRAINT EMPLOYEE01_EMPNO_UQ UNIQUE,
	ENAME VARCHAR(50) CONSTRAINT EMPLOYEE01_EMPNO_NN NOT NULL,
	SAL NUMBER
);
SELECT * FROM employee01;
INSERT INTO employee01 values(1000,'홍길동',3500);
INSERT INTO employee01 values(1001,'김길동',4500);
INSERT INTO employee01 values(1000,'김길동',3500); -- 중복데이터 등록 에러 발생.
INSERT INTO employee01 values(1002,null,3500); -- NULL입력 에러발생
INSERT INTO employee01 values(null,'마길동',3500);
INSERT INTO employee01 values(null,'마길동',4500);
SELECT * FROM sys.ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE 'EMPLOYEE01%';
-- PRIMARY KEY : NOT NULL + UNIQUE
CREATE TABLE EMPLOYEE02(
	EMPNO NUMBER(4) PRIMARY KEY --제약조건의 이름을 지정하지 않음.
);
SELECT * FROM EMPLOYEE02;
CREATE TABLE EMPLOYEE03(
	EMPNO NUMBER(4) CONSTRAINT EMPLOYEE3_EMPNO_PK PRIMARY KEY 
); -- 제약 조건 이름 지정
SELECT * FROM EMPLOYEE03;
INSERT INTO EMPLOYEE02 values(1000);
INSERT INTO EMPLOYEE02 values(null);-- 에러발생
INSERT INTO EMPLOYEE02 values(1000);-- 에러발생
SELECT *
FROM sys.ALL_CONSTRAINTS
WHERE TABLE_NAME IN ('EMPLOYEE02','EMPLOYEE03');
-- ex) student04 테이블에 학번(primary key), 이름(not null), 주민번호(unique)
--		국어, 영어, 수학 점수로 테이블을 구성하여 데이터를 입력 확인하세요.
CREATE TABLE student04(
	sno char(10) CONSTRAINT student04_sno_pk PRIMARY KEY,
	name varchar(50) CONSTRAINT student04_name_nn NOT null,
	civilCode char(13) CONSTRAINT student04_civilCode_uq UNIQUE,
	kor number(3),
	eng number(3),
	math number(3)
);
INSERT  INTO student04 values('SMO2003001','홍길동','9510102702618',70,80,90);
INSERT  INTO student04 values('SMO2003002',null,'9510102702618',70,80,90);
INSERT  INTO student04 values('SMO2003003','마길동','9510102702618',80,80,85);
INSERT  INTO student04 values('SMO2003004','오길동','9610102702618',8000,80,90);
SELECT * FROM student04;
SELECT *
FROM sys.ALL_CONSTRAINTS
WHERE TABLE_NAME = 'STUDENT04';
-- 컬럼을 두개를 기준으로 프라이머리키를 설정하는 경우
-- 하단에 constraint 제약조건명 조약조건 유형(컬럼1,컬럼2..)
CREATE TABLE buybook(
	id varchar2(30), 
	isbn char(10),
	buydate DATE,
	paycheck varchar2(30),
	CONSTRAINT buybook_id_isbn_pk PRIMARY key(id,isbn) 
);
SELECT * 
FROM sys.ALL_CONSTRAINTS
WHERE TABLE_NAME = 'BUYBOOK';
SELECT * FROM buybook;

