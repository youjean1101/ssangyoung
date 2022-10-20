CREATE TABLE bookUser(
	userno varchar2(10) PRIMARY key,
	div varchar2(20) CONSTRAINT bookUser_auth_ck check(div IN('manager','user')),
	uname varchar2(20) not null,
	rrn char(14) not NULL CONSTRAINT bookUser_rrn_uq UNIQUE,	
	address varchar2(100),
	phone_Number char(13),
	id varchar2(20) CONSTRAINT bookUser_id_uq UNIQUE,
	password varchar2(20) not null,
	rentalcnt NUMBER
);

SELECT * FROM bookUser;
DROP TABLE bookUser;

INSERT INTO bookUser values('9999','manager','홍길동','990101-1000000','인천광역시 부평구 삼산동','010-000-0000','himan','1234',10);
INSERT INTO bookUser values('9998','manager','test','990102-1000000','인천광역시 부평구 삼산동','010-000-0000','test','5678',null);
INSERT INTO bookUser values('9997','user','김길동','951231-2000000','서울 신림','010-123-0000','goodgirl','9999',2);
INSERT INTO bookUser values('9996','user','이길동','961021-2000000','부산 마린시티','010-456-0000','higirl','8888',1);
INSERT INTO bookUser values('9995','user','마길동','970703-1000000','제주도 서귀포시','010-789-0000','goodman','5555',0);
DELETE FROM bookUser;
/*
 private int userno;
 private String div;
 private String uname;
 private String rrn;
 private String address;
 private String phone_Number;
 private String id;
 ptivate String password;
 private int rentalcnt;
 
 */
SELECT * FROM bookUser
WHERE id = ''
AND password = '';

SELECT * FROM bookUser
WHERE id = '';

--------------------------------------------------------------------------------------------------
CREATE TABLE call(
	callno varchar2(8) PRIMARY key,
	userno varchar2(10) CONSTRAINT call_userno_fk REFERENCES bookUser(userno),
	callcontents varchar2(4000),
	managerno varchar2(10)CONSTRAINT call_managerno_fk REFERENCES bookUser(userno),
	callanswer varchar2(4000)
);

select * FROM call;
DROP TABLE call;

INSERT INTO call VALUES('A100000','1001','재밌는책추천해주세요.','1000','채쌤의 자바책');
INSERT INTO call VALUES('A100002','1003','공부하기 좋은 책 추천해주세요.','1000','오라클');
DELETE FROM call WHERE;

--------------------------------------------------------------------------------------------------
CREATE TABLE program(
	pno NUMBER,
	pname varchar2(100),
	ptime date,
	noticedate varchar2(20),
	managerno varchar2(10) CONSTRAINT program_managerno_fk REFERENCES bookUser(userno)
);
/*
 private String pname; // 프로그램명
 private String ptime; // 프로그램시간
 private String noticedate; // 비고(공지날짜)
 private String managerno; // 관리자번호
 */
SELECT * FROM program 
WHERE pname LIKE '%'||'북토크'||'%';

select * FROM program
ORDER by pno;

DROP TABLE program;

INSERT INTO program VALUES(1,'북토크',sysdate,'공지날짜','1000');
DELETE FROM program WHERE pno =;

UPDATE program
	SET pname =
	SET ptime =
	SET	noticedate = 
	SET managerno = 
	WHERE pno = 11;


---------------------------------------------------------------------------------------------------
CREATE TABLE classification(
	classno number(3) PRIMARY key,
	cname varchar2(50)
);
select * FROM classification;
DROP TABLE classification;

INSERT INTO classification VALUES(100,'철학');
INSERT INTO classification VALUES(200,'종교');
INSERT INTO classification VALUES(300,'사회과학');
INSERT INTO classification VALUES(400,'순수과학');
INSERT INTO classification VALUES(500,'기술과학');
INSERT INTO classification VALUES(600,'예술');
INSERT INTO classification VALUES(700,'언어');
INSERT INTO classification VALUES(800,'문학');
INSERT INTO classification VALUES(900,'역사');
DELETE FROM classification WHERE;
----------------------------------------------------------------------------------------------------
CREATE TABLE books(
	isbn number(13) PRIMARY key,
	bname varchar2(500),
	publisher varchar2(40),
	writer varchar2(50),
	genre varchar2(30),
	price number,
	registdate date,
	rentalwhether varchar(20) CONSTRAINT books_rentalwhether_ck check(rentalwhether IN('O','X')),
	classno number(3) CONSTRAINT books_classno_fk REFERENCES classification(classno)
);

select * FROM books;
DROP TABLE books;

UPDATE books
	SET ISBN  = ,
		BNAME  = '',
		PUBLISHER = '',
		WRITER = '',
		GENRE = '',
		PRICE = ,
		REGISTDATE = '',
		RENTALWHETHER ='',
		CLASSNO =
	WHERE isbn = 11;
UPDATE BOOKS 
	SET isbn = 9791186710777
	WHERE isbn = 0;
SELECT * FROM books WHERE isbn=0;

INSERT INTO books values('9791186710777','채쌤의 자바 프로그래밍 핵심','썜즈','채규태','컴퓨터이론','27000',sysdate,'O','500' );
INSERT INTO books values('9791156645023','데이터베이스 개론과 실습','한빛아카데미','박우창','컴퓨터이론','29000',sysdate,'X','500');
INSERT INTO books values('9788968481475','이것이 자바다','한빛미디어','신용권','컴퓨터이론','30000',sysdate,'O','500' );
INSERT INTO books values('9788966263301','1일 1로그 100일완성 IT지식','인사이트','브라이언 W.커니핸','컴퓨터이론','20000',sysdate,'O','500' );
INSERT INTO books values('9791163033486','자료구조와 함게 배우는 알고리즘 입문(자바편)','이지스 퍼블리싱','BohYoh Shibata','컴퓨터이론','22000',sysdate,'X','500' );
DELETE FROM books WHERE isbn = '9791186710777';
-- o/O를 입력해서 O문자가 포함된 사원명을 검색하고자 할때.
SELECT ename, job
FROM emp
WHERE ename LIKE '%'||upper('o')||'%';

SELECT * FROM books 
WHERE bname LIKE '%'||'채쌤'||'%';
/*
private int isbn;
private String bname;
private String publisher;
private String writer;
private String genre;
private int price;
private String registdate;
private String rentalwhether;
private int classno;
 */

--------------------------------------------------------------------------------------------------
CREATE TABLE rental(
	rentalno varchar2(20) PRIMARY key,
	userno varchar2(10) CONSTRAINT rental_userno_fk REFERENCES bookUser(userno),
	isbn NUMBER(13) CONSTRAINT rental_isbn_fk REFERENCES books(isbn) CONSTRAINT rental_isbn_uq UNIQUE,
	shipwhether varchar2(20) CONSTRAINT rental_shipwhether_ck check(shipwhether IN('O','X')),
	returndate DATE,
	returnwhether VARCHAR2(20) CONSTRAINT rental_returnwhether_ck check(returnwhether IN('O','X'))
);

select * FROM rental;
DROP TABLE rental;

INSERT INTO rental VALUES('AA100000','1001','9791186710777','O',sysdate,'X');
INSERT INTO rental VALUES('AA100001','1002','9788968481475','X',sysdate,'X');
INSERT INTO rental VALUES('AA100002','1001','9791156645023','X',sysdate,'O');
INSERT INTO rental VALUES('AA100003','1003','9791163033486','O',sysdate,'X');
DELETE FROM rental WHERE rentalno = 'AA100002';

-------------------------------------------------------------------------------------------------------
CREATE TABLE ship(
	shipno varchar2(20) PRIMARY key,
	shipdate DATE not null,
	rentalno varchar2(20) CONSTRAINT ship_rentalno_fk REFERENCES rental(rentalno),
	managerno varchar2(10) CONSTRAINT ship_managerno_fk REFERENCES bookUser(userno)
);

select * FROM ship;
DROP TABLE ship;

INSERT INTO ship values('ABC1000',sysdate+2,'AA100001','1000');
INSERT INTO ship values('ABC1003',sysdate+2,'AA100003','1000');
DELETE FROM ship WHERE;

---------------------------------------------------------------------------------------------------
CREATE TABLE library(
	local varchar2(20),
	libraryname varchar2(50)
);

select * FROM library;
DROP TABLE library;

INSERT INTO library VALUES('인천','계양도서관');
INSERT INTO library VALUES('서울','국립중앙도서관');
INSERT INTO library VALUES('부산','부산시청열린도서관');
INSERT INTO library VALUES('대구','시립수성도서관');
INSERT INTO library VALUES('광주','광주시립중앙도서관');
INSERT INTO library VALUES('대전','대전학생교육문화원');
INSERT INTO library VALUES('울산','울산도서관');
INSERT INTO library VALUES('세종','국립세종도서관');
INSERT INTO library VALUES('경기','경기도서관');
INSERT INTO library VALUES('강원','미래도서관');
INSERT INTO library VALUES('충북','충북중앙도서관');
INSERT INTO library VALUES('충남','충남도서관');
INSERT INTO library VALUES('전북','전북도청도서관');
INSERT INTO library VALUES('전남','전라남도립도서관');
INSERT INTO library VALUES('경북','경북도서관');
INSERT INTO library VALUES('경남','김해도서관');
INSERT INTO library VALUES('제주','제주도서관');
DELETE FROM library WHERE;

SELECT * FROM library WHERE local = '인천';

/*
private String loc;
private String libraryname;
*/

SELECT * FROM bookUser;
select * FROM call;
select * FROM program;
select * FROM classification;
select * FROM books;
select * FROM rental;
select * FROM ship;
select * FROM library;


