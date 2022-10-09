/*
# check
1. 특정한 데이터를 조건이나 범위를 지정해서, 해당 범위에 데이터만 입력되도록 처리한 것을 말한다.
2. 형식
	컬럼명 데이터유형 constraint 제약명 check (where 조건문 형식 설정)
	컬럼명 데이터유형 check (where 조건문 형식 설정) 
 */
DROP TABLE emp04;
CREATE TABLE emp04(
	gender varchar2(1) CONSTRAINT emp04_gender_ck check(gender IN('F','M'))
);
SELECT * FROM emp04;
INSERT INTO emp04 VALUES('F');
INSERT INTO emp04 VALUES('M');
INSERT INTO emp04 VALUES('K'); -- 에러발생
SELECT *
FROM sys.ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMP04';
-- ex) student05테이블 이름, 학년(1~4), 국어(1~100) 제약조건을 설정하여 테이블을
--		생성하고 확인하세요.
SELECT * FROM student05;
CREATE TABLE student05(
	name varchar2(50),
	grade number(1) CONSTRAINT student05_grade_ck check(grade BETWEEN 1 AND 4),
	KOR NUMBER(3) CHECK (kor BETWEEN 1 AND 100)
);
INSERT INTO student05 VALUES('홍길동', 1, 100);
INSERT INTO student05 VALUES('김길동', 5, 100); --에러
INSERT INTO student05 VALUES('신길동', 1, 101); --에러
/*
# 외래키 설정(foreign key)
1. 연관관계에 있는 두 테이블에 대하여, 한쪽 테이블에 있는 데이터 기준으로 다른쪽 테이블의 데이터를 입력할 수 있게 하는 것을 말한다.
2. 기본 형식
	컬럼명 데이터유형 CONSTRAINT 테이블명_컬럼명_fk REFERENCES 테이블명(컬럼명)
*/
-- 교수테이블과 학생테이블의 담당교수지정컬럼

CREATE TABLE professor01(
	tno NUMBER PRIMARY KEY,
	name varchar2(50)
);
DROP TABLE student06;
CREATE TABLE student06(
	name varchar2(50),
	tno NUMBER CONSTRAINT student06_tno_fk REFERENCES professor01(tno)
);
INSERT INTO professor01 VALUES(1000,'홍길동교수');
INSERT INTO student06 values('김길동학생',1000);
INSERT INTO student06 values('마길동학생',1000);
INSERT INTO student06 values('오길동학생',1001); --참조에러발생
SELECT * FROM student06;
-- ex) 물건테이블(물건번호, 물건명, 가격),
-- 		구매테이블(구매번호, 구매수량, 물건번호-외래키설정)
DROP TABLE product3;
CREATE TABLE product3(
	proNum NUMBER PRIMARY key,
	proName varchar2(50),
	proPrice number
	);
SELECT * FROM product3;
CREATE TABLE buyproduct3(
	buyNum NUMBER PRIMARY key,
	proCnt NUMBER,
	proNum CONSTRAINT buyproduct3_proNum_fk	REFERENCES product3(proNum)
	);
SELECT * FROM buyproduct3;
INSERT  INTO product3 values(1,'수박',3000);
INSERT INTO buyproduct3 values(10,3,1);
INSERT INTO buyproduct3 values(10,3,1);
INSERT INTO buyproduct3 values(10,3,1);
SELECT proName, proPrice, procnt
FROM product3 p , buyproduct3 b
WHERE p.proNum = b.proNum;

