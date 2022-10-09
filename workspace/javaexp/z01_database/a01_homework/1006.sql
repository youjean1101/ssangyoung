--[1단계:개념] 1. 테이블의 구조 변경형식(추가, 삭제, 수정)을 기본예제를 통해 기술하세요.
--[1단계:코드] 2. 부서테이블을 dept12 복사테이블을 만들고, 부서관리자명, 부서생성일을 추가하세요.
CREATE TABLE dept12
AS SELECT * FROM dept;
ALTER TABLE dept12 
ADD (mgrname varchar(20),
	deptdate DATE); 
SELECT * FROM dept12;

--[1단계:코드] 3. 사원테이블과 등급테이블을 조인해서 복사테이블 emp17만들고, losal, hisal을 삭제 처리하세요.
DROP TABLE emp17;
CREATE TABLE emp17 AS SELECT e.*,s.*
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;
SELECT * FROM emp17;
ALTER TABLE emp17 DROP COLUMN losal;
ALTER TABLE emp17 DROP COLUMN hisal;

--[1단계:코드] 4. emp20 복사테이블을 만들고, 사원명의 최대 byte크기를 확인한 후, char(최대크기)로 변경하세요.
CREATE TABLE emp20 AS SELECT * 
FROM emp;
SELECT * FROM emp20;
SELECT vsize(ename) FROM emp20; --최대 byte크기:6
ALTER TABLE emp20
modify ename char(6);

--[1단계:개념] 5. 무결성 제약 조건의 장점과 종류를 예시를 통해서 기술하세요.
--[1단계:코드] 6. 물품정보테이블(물품번호, 물건명, 가격, 재고량)을 만들되, 물품번호, 물건명을 not null 제약 조건을 선언하여 생성하고, 
-- 생성된 여부를 메타테이블을 통해 확인하세요.
SELECT * FROM proinfo;
CREATE TABLE proinfo ( 
 	pno NUMBER CONSTRAINT PROINFO_PNO_NN NOT NULL, 
 	name varchar2(6) CONSTRAINT PROINFO_PNO_NN2 NOT NULL, 
 	price number, 
 	stock NUMBER);
 SELECT * FROM proinfo;
INSERT INTO proinfo VALUES(12,'사과',3000,100);
INSERT INTO proinfo VALUES(12,'사과',3000,NULL);
INSERT INTO proinfo VALUES(12,NULL,3000,100); -- NULL로 에러발생
INSERT INTO proinfo VALUES(NULL,'사과',3000,100); -- NULL로 에러발생
SELECT * FROM sys.ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE 'PROINFO%';

--[1단계:코드] 7. 도서대여시스템의 테이블 (도서, 대여, 회원)에서 대여 테이블의 회원아이디와 도서일련번호 두개 컬럼을 primary key로 설정하세요.
DROP TABLE customer20;
CREATE TABLE customer20(
	id varchar2(30) PRIMARY key,
	name char(20),
	point NUMBER);
SELECT * FROM customer20;
CREATE TABLE book20(
	isbn varchar2(10) PRIMARY KEY,
	name varchar2(50),
	writer varchar2(30),
	price NUMBER 
	);
select*FROM book20;


CREATE table bookrent20(
	id CONSTRAINT customer20_id_fk	REFERENCES customer20(id),
	isbn CONSTRAINT book20_isbn_fk	REFERENCES book20(isbn),
	rentdate DATE,
	payway varchar2(30)
	);
select*FROM bookrent20;
--[1단계:코드] 8. 회원테이블(회원아이디, 패스워드, 이름, 권한, 포인트) 권한이 관리자, 일반사용자, 방문객만 입력가능, 
-- 포인트가 0이상 입력가능하게 제약사항을 처리해서 테이블을 생성하세요.
CREATE TABLE member20(
	id varchar2(30),
	passwd varchar2(30),
	name char(20),
	auth char(20) CONSTRAINT member20_auth_ck check(auth IN ('maneger','user','customer')),
	point NUMBER CONSTRAINT member20_point_ck check(point>=0)
);
SELECT * FROM member20;

--[1단계:코드] 9. 캡쳐로 제시 화면의 ERD의 실제테이블을 제약사항을 적용하여 테이블을 생성하고, 데이터를 입력 확인하세요.
CREATE TABLE customer3(
	id varchar2(30) PRIMARY key,
	name char(20),
	point NUMBER);
SELECT * FROM customer3;

CREATE TABLE book3(
	isbn varchar2(10) PRIMARY KEY,
	name varchar2(50),
	writer varchar2(30),
	price NUMBER 
	);
select*FROM book3;


CREATE table bookrent3(
	id CONSTRAINT customer3_id_fk	REFERENCES customer3(id),
	isbn CONSTRAINT book3_isbn_fk	REFERENCES book3(isbn),
	rentdate DATE,
	payway varchar2(30)
	);
select*FROM bookrent3;

INSERT INTO customer3 values('admin', '홍길동',2000); 
INSERT INTO customer3 values('himan', '마길동',2000); 
INSERT INTO customer3 values('goodman', '마길동',2000); 
INSERT INTO book3 values('A1000000','sql기초','김아무개',30000); 
INSERT INTO book3 values('A1000002','자바','채쌤',20000); 
INSERT INTO book3 values('A1000003','컴퓨터사이언스','마스터',40000); 
INSERT INTO bookrent3 values('admin','A1000000',sysdate,'계좌이체'); 
INSERT INTO bookrent3 values('himan','A1000003',sysdate,'계좌이체'); 
INSERT INTO bookrent3 values('goodman','A1000000',sysdate,'계좌이체'); 
INSERT INTO bookrent3 values('admin','A1000002',sysdate,'계좌이체'); 
SELECT * FROM bookrent3;
--[1단계:개념] 10. 시퀀스의 기본 생성 형식과 호출 속성을 정리해보세요.
--[1단계:코드] 11. 아래의 여러가지 시퀀스를 생성해보세요.
--      1) 9999~1000 2씩 감소 
CREATE SEQUENCE seq_05
	INCREMENT BY -2
	START WITH 9999
	MINVALUE 1000
	MAXVALUE 9999;

SELECT seq_05.nextval 현재번호, seq_05.currval FROM dual;

--	2) 5000~9999 1씩 증가 
CREATE SEQUENCE seq_06
	INCREMENT BY 1
	START WITH 5000
	MINVALUE 5000
	MAXVALUE 9999;
	SELECT seq_06.nextval 현재번호, seq_06.currval FROM dual;

--	3) 0~21 3씩 증가 반복 
CREATE SEQUENCE seq_07
	INCREMENT BY 3
	START WITH 0
	MINVALUE 0
	MAXVALUE 21
	CYCLE 
	cache 5;
	SELECT seq_07.nextval 현재번호, seq_07.currval FROM dual;

--	4) 5~1000 5씩 증가
	CREATE SEQUENCE seq_08
	INCREMENT BY 5
	START WITH 5
	MINVALUE 5
	MAXVALUE 1000;
	SELECT seq_08.nextval 현재번호, seq_08.currval FROM dual;

--[1단계:코드] 12. 게시판테이블(번호, 내용)을 만들고, sequence를 만들어 1부터 시작하여 번호가 증가되어 입력되게 처리하세요.

CREATE TABLE board1(
		num	NUMBER,
		contents varchar(50));

CREATE SEQUENCE boardseq
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 1000;
	SELECT boardseq.nextval 현재번호, boardseq.currval FROM dual;

INSERT INTO board1(num) values(boardseq.nextval);
INSERT INTO board1(num) values(boardseq.nextval);
SELECT * FROM board1;

--[1단계:개념] 13. DML의 종류를 기술하세요.