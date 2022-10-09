--[1단계:개념] 1. 테이블 생성/삭제 기본 코드를 기술하세요.
--[1단계:코드] 2. 온라인 컴퓨터 부품판매 사이트에서 컴퓨터정보를 테이블로 만들려고 한다.
-- 온라인 사이트를 참고하여 테이블을 만들어 보세요.
CREATE TABLE computerinfo(
	category varchar2(30),
	cpu varchar2(50),
	ram NUMBER,
	graphicard varchar2(50),
	mainboard varchar2(50));

CREATE TABLE customer2(
	id varchar2(20),
	name char(20),
	point number);

CREATE TABLE buycom(
	category varchar2(30),
	id varchar2(20),
	buydate DATE,
	buyway char(20));

SELECT * FROM computerinfo;
SELECT * FROM customer2;
SELECT * FROM buycom;


--[1단계:개념] 3. database 모델링에서 엔티티, 속성, 엔티티 타입, 인스턴스, 객체 집합을 예제와 함께 개념을 정리해보세요.
--[1단계:개념] 4. 모델링에서 유도속성에 대하여 기술하세요.
--[1단계:개념] 5. 데이터를 입력하는 형식 2가지 및 삭제처리를 기술하세요.
--[1단계:코드] 6. 부서테이블을 기준으로 dept10 복사테이블을 만들고 컬럼 크기를 변경후, 데이터를 입력하세요.
CREATE TABLE dept10
AS SELECT * FROM dept;
SELECT * FROM dept10;
ALTER TABLE SCOTT.DEPT10 MODIFY DNAME VARCHAR2(20);
ALTER TABLE SCOTT.DEPT10 MODIFY LOC VARCHAR2(50);
INSERT INTO dept10 values(50, '정유진', '로스앤젤레스'); 
SELECT * FROM dept10;

--[1단계:코드] 8. 도서관의 도서대여시스템에 도서, 도서대여, 회원 정보를 만들어 erd 생성(논리/물리모델) 처리하세요 
CREATE TABLE librarybook(
	isbn varchar2(10),
	name varchar2(50),
	writer varchar2(30),
	rentterm NUMBER);
SELECT * FROM librarybook;
INSERT INTO librarybook values('a10000000','채쌤의 자바프로그래밍 핵심','채쌤',14);
INSERT INTO librarybook values('a10000001','이것이 자바다','신용권',14);
INSERT INTO librarybook values('a10000002','데이터베이스 개론과 실습','박우창',14);
INSERT INTO librarybook values('a10000003','빅데이터','굿덷',14);

CREATE TABLE memberinfo(
	id varchar2(30),
	name char(20));
SELECT * FROM memberinfo;
INSERT INTO memberinfo values('admin','홍길동');
INSERT INTO memberinfo values('man','마길동');
INSERT INTO memberinfo values('woman','김길동');
INSERT INTO memberinfo values('tty','김아무개');

CREATE TABLE bookrent(
	isbn varchar2(10),
	id varchar2(30),
	rentdate date);
SELECT * FROM bookrent; 
INSERT INTO bookrent values('a10000000','admin',sysdate);
INSERT INTO bookrent values('a10000001','man',sysdate);
INSERT INTO bookrent values('a10000001','woman',sysdate);
INSERT INTO bookrent values('a10000003','tty',sysdate);
INSERT INTO bookrent values('a10000002','man',sysdate);
INSERT INTO bookrent values('a10000000','man',sysdate);

--[1단계:코드] 9. 위 내용을 실제 테이블 생성 및 join 된 sql 처리하세요
SELECT * 
FROM librarybook l,MEMBERinfo m, bookrent b
WHERE l.isbn = b.isbn
AND m.id = b.id;
