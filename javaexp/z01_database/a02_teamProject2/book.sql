SELECT * FROM movie;SELECT * FROM movie;SELECT * FROM movie;SELECT * FROM movie;SELECT * FROM movie;SELECT * FROM movie;CREATE TABLE bookUser(
	userno varchar2(10) PRIMARY key,
	div varchar2(20) CONSTRAINT bookUser_auth_ck check(div IN('manager','user')),
	uname varchar2(20) not null,
	rrn char(14) not NULL CONSTRAINT bookUser_rrn_uq UNIQUE,	
	address varchar2(100),
	phone_Number char(13),
	id varchar2(20) CONSTRAINT bookUser_id_uq UNIQUE,
	password varchar2(20) not null,
	rentalcnt NUMBER,
	overduecnt NUMBER
);
SELECT * FROM bookuser WHERE rrn = '990101-1000000';

SELECT * FROM bookuser;
WHERE uname = '김길동'
AND phone_number = '010-123-0000';

SELECT * FROM (
SELECT * FROM bookuser
WHERE overduecnt < 1
AND div = 'user'
ORDER BY rentalcnt DESC)
WHERE rownum<=3;

DROP TABLE bookUser;

CREATE SEQUENCE userno_seq
		increment by 1
		start with 1000
		MINVALUE 1000
		MAXVALUE 100000;
	
DROP SEQUENCE classno_seq;

SELECT div,userno FROM bookuser
WHERE id = 'himan'
AND password ='1234';

DELETE FROM bookUser WHERE userno='1003';

INSERT INTO bookUser values(userno_seq.nextval,'manager','홍길동','990101-1000000','인천광역시 부평구 삼산동','010-000-0000','himan','1234',0,0);
INSERT INTO bookUser values(userno_seq.nextval,'manager','test','990102-1000000','인천광역시 부평구 삼산동','010-000-0000','test','5678',0,0);
INSERT INTO bookUser values(userno_seq.nextval,'user','김길동','951231-2000000','서울 신림','010-123-0000','goodgirl','9999',8,3);
INSERT INTO bookUser values(userno_seq.nextval,'user','이길동','961021-2000000','부산 마린시티','010-456-0000','higirl','8888',9,1);
INSERT INTO bookUser values(userno_seq.nextval,'user','마길동','970703-1000000','제주도 서귀포시','010-789-0000','goodman','5555',3,0);
DELETE FROM bookUser;

UPDATE BOOKUSER 
SET rentalcnt = 87,
overduecnt = 2
WHERE USERNO ='1029'
AND div = 'user';
SELECT * FROM bookuser;

SELECT * FROM bookUser WHERE div = 'manager';
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

SELECT * FROM bookUser;
WHERE id = '';

SELECT * FROM bookUser
WHERE userno = '9995';

--------------------------------------------------------------------------------------------------
CREATE TABLE call(
	callno varchar2(8) PRIMARY key,
	userno varchar2(10) CONSTRAINT call_userno_fk REFERENCES bookUser(userno),
	callcontents varchar2(4000),
	managerno varchar2(10)CONSTRAINT call_managerno_fk REFERENCES bookUser(userno),
	callanswer varchar2(4000)
);

select * FROM CALL WHERE callno = '';
select callno,callcontents,callanswer FROM CALL WHERE userno = '9997';
select count(*) cnt FROM CALL;

DROP TABLE call;
/*
 private int iCallno;
 private int iUserno;
 private String sCallcontents;
 private int iManagerno;
 private String sCallanswer;
 */

CREATE SEQUENCE call_seq
		increment by 1
		start with 10000
		MINVALUE 10000
		MAXVALUE 100000;
	
DROP SEQUENCE classno_seq;

SELECT * FROM CALL;
SELECT * FROM bookuser;
SELECT callno,userno,callcontents FROM CALL WHERE MANAGERNO is null;
INSERT INTO CALL VALUES('A'||call_seq.nextval,'1024','사이트가 왜이렇게 어려워요?',null,null);
INSERT INTO CALL VALUES('A100004','9995','오메',null,null);
SELECT count(*) cnt FROM CALL WHERE CALLNO = '12ㄷ';

DELETE FROM CALL WHERE callno = 'A100003';
UPDATE CALL 
SET managerno = 9999,
callanswer = '개발이 어려워서 그래요'
WHERE callno = 'A100003';

UPDATE CALL 
SET managerno = '9999',
callanswer = '왜케어려움'
WHERE callno = 'A10001';

UPDATE CALL 
SET callcontents = '회원 상담수정'
WHERE callno = 'A100003'
AND userno = '9997';

INSERT INTO call VALUES('A100000','1027','재밌는책추천해주세요.','1025','채쌤의 자바책');
INSERT INTO call VALUES('A100002','1027','공부하기 좋은 책 추천해주세요.','1025','오라클');
INSERT INTO call VALUES('A100005','1029','테스트1.',null,null);
INSERT INTO call VALUES('A100006','1028','테스트2.',null,null);
DELETE FROM call WHERE callno = 'A100003';

--------------------------------------------------------------------------------------------------
CREATE TABLE program(
	pno NUMBER PRIMARY key,
	pname varchar2(100),
	ptime date,
	noticedate date,
	managerno varchar2(10) CONSTRAINT program_managerno_fk REFERENCES bookUser(userno)
);
DROP TABLE program;

CREATE SEQUENCE pno_seq
		increment by 1
		start with 1
		MINVALUE 1
		MAXVALUE 9999;
	
DROP SEQUENCE pno_seq;

SELECT pno_seq.currval pno, 
		pname,ptime,noticedate, managerno 
FROM PROGRAM;

SELECT * FROM program
WHERE noticedate = to_char(sysdate,'YYYY-MM-DD');

/*
 private String pname; // 프로그램명
 private String ptime; // 프로그램시간
 private String noticedate; // 비고(공지날짜)
 private String managerno; // 관리자번호
 */
SELECT * FROM program 
WHERE pname LIKE '%'||'북토크'||'%';

select * FROM program ;
SELECT * FROM program WHERE pno = 1;
DELETE FROM program;
INSERT INTO program values(pno_seq.nextval,'북토크',sysdate,'20221030','1031');
INSERT INTO program values(pno_seq.nextval,'중고책바자회',sysdate,'20221231','1031');
INSERT INTO program values(pno_seq.nextval,'쌍용학원 팀프로젝트2(도서관리)','20221028','20221028','1031');
SELECT * FROM bookuser;
DELETE FROM program;
SELECT * FROM BOOKUSER b ;
--// 삭제하면 currval로 추가 되야함. -> 어쩔수 없음 구멍난채로 해야함
--INSERT INTO program values(pno_seq.currval,'베스트셀러 작가 강연','20221101','20221101','1000');
INSERT INTO program values(pno_seq.nextval,'테스트','20221001','20221022','1025');
INSERT INTO program values(pno_seq.nextval,'테스트2','20221001','20221023','1025');
INSERT INTO program values(pno_seq.nextval,'테스트3','20221001','20221023','1025');
INSERT INTO program values(pno_seq.nextval,'테스트4','20221001','20221023','1025');
INSERT INTO program values(pno_seq.nextval,'테스트4','20221001','20221027','1025');

DELETE FROM program;
DELETE FROM program WHERE pno ='1';
DELETE FROM program WHERE noticedate ='2022-10-22';
SELECT * FROM program WHERE noticedate ='2022-11-01';

UPDATE program
SET pname = 'book토크'
WHERE pno =1;

SELECT * FROM program
ORDER BY ptime;


---------------------------------------------------------------------------------------------------
CREATE TABLE classification(
	classno number PRIMARY key,
	cname varchar2(50)
);
select * FROM classification WHERE classno = '100';
DROP TABLE classification;

CREATE SEQUENCE classno_seq
		increment by 100
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
	
DROP SEQUENCE classno_seq;
	
INSERT INTO classification VALUES(classno_seq.nextval,'총류');
INSERT INTO classification VALUES(classno_seq.nextval,'철학');
INSERT INTO classification VALUES(classno_seq.nextval,'종교');
INSERT INTO classification VALUES(classno_seq.nextval,'사회과학');
INSERT INTO classification VALUES(classno_seq.nextval,'순수과학');
INSERT INTO classification VALUES(classno_seq.nextval,'기술과학');
INSERT INTO classification VALUES(classno_seq.nextval,'예술');
INSERT INTO classification VALUES(classno_seq.nextval,'언어');
INSERT INTO classification VALUES(classno_seq.nextval,'문학');
INSERT INTO classification VALUES(classno_seq.nextval,'역사');

DELETE FROM classification WHERE CLASSNO =1100;
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
SELECT * FROM books 
WHERE rentalwhether = 'X';
SELECT * FROM books;
DELETE FROM books;
SELECT * 
FROM books
WHERE isbn = '9788966263301'
AND rentalwhether = 'X';

SELECT * FROM books 
WHERE publisher = '';
SELECT * FROM books 
WHERE writer = '';
SELECT * FROM books 
WHERE classno = '';
SELECT * FROM books 
WHERE registdate LIKE '18/03%';

UPDATE books
SET rentalwhether = 'X';

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

SELECT * FROM books WHERE isbn=9791186710777;

INSERT INTO books values('9791186710777','채쌤의 자바 프로그래밍 핵심','썜즈','채규태','컴퓨터이론','27000',sysdate,'X','100' );
INSERT INTO books values('9791156645023','데이터베이스 개론과 실습','한빛아카데미','박우창','컴퓨터이론','29000',sysdate,'X','100');
INSERT INTO books values('9788968481475','이것이 자바다','한빛미디어','신용권','컴퓨터이론','30000',sysdate,'X','100' );
INSERT INTO books values('9788966263301','1일 1로그 100일완성 IT지식','인사이트','브라이언 W.커니핸','컴퓨터이론','20000',sysdate,'X','100' );
INSERT INTO books values('9791163033486','자료구조와 함게 배우는 알고리즘 입문(자바편)','이지스 퍼블리싱','BohYoh Shibata','컴퓨터이론','22000',sysdate,'X','100' );
INSERT INTO books values('100000000000','테스트','쌍용','유자','컴퓨터','2000','20180320','X','100');

DELETE FROM books WHERE isbn = '100000000000';
-- o/O를 입력해서 O문자가 포함된 사원명을 검색하고자 할때.
select * FROM books;
UPDATE BOOKS 
 SET rentalwhether = 'O'
 WHERE isbn = '9791186710777';

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
	isbn NUMBER(13) CONSTRAINT rental_isbn_fk REFERENCES books(isbn),
	rentaldate DATE,
	rentalshipwhether varchar2(20) CONSTRAINT rental_rentalshipwhether_ck check(rentalshipwhether IN('O','X')),
	returndate DATE,
	returnwhether VARCHAR2(20) CONSTRAINT rental_returnwhether_ck check(returnwhether IN('O','X')),
	returnshipwhether VARCHAR2(20) CONSTRAINT rental_returnshipwhether_ck check(returnshipwhether IN('O','X'))
);
DROP TABLE rental;

CREATE SEQUENCE rentalno_seq
		increment by 1
		start with 1000
		MINVALUE 1000
		MAXVALUE 100000;
	
DROP SEQUENCE rentalno_seq;

SELECT * FROM rental;
WHERE isbn=9791186710777;

SELECT * FROM rental
WHERE userno ='1001'
AND returnwhether = 'X';
/*
private String rentalno;
private String userno;
private long isbn;
private String shipwhether;
private String renturndate;
private String returnwhether;
 */
select * FROM rental;

SELECT isbn FROM rental
WHERE rentalno = ''; 


SELECT rentalno,userno,r.isbn,b.bname,shipwhether,returndate,returnwhether
FROM rental r, books b
where r.isbn=b.isbn
AND userno = '9997';

SELECT * FROM rental 
WHERE rentaldate = '20221024';

SELECT * FROM rental 
WHERE returndate = '20221024';

SELECT isbn FROM rental
where returnwhether = 'X';

UPDATE rental
SET returnwhether = 'O',
 	returndate ='20221025',
 	returnshipwhether ='O'
WHERE rentalno= 'AA1016'
AND returndate is NULL
AND returnwhether='X';

SELECT * FROM books
WHERE isbn = '9788966263301';

INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1027','9791186710777','20221012','X',sysdate+14,'X');

INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1028','9791156645023','20221010','X',null,'X','X');
INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1029','9788968481475','20221014','X',null,'X','X');
INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1027','9788966263301','20221020','X',null,'X','X');
INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1029','9791163033486','20221001','X','20221024','O','O');
INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'1028','100000000000','20210909','X',null,'X','X');
SELECT * FROM bookuser;
SELECT * FROM books;
SELECT * FROM rental;


SELECT count(*) rentalcnt FROM rental
WHERE userno = '1020';

SELECT count(*) overduecnt FROM rental 
WHERE (sysdate-rentaldate) >= 14
AND (rentaldate-returndate) IS NULL
OR (returndate-rentaldate) >= 14;

SELECT userno 
FROM rental 
WHERE userno IN(
	SELECT userno
	from rental
	WHERE userno ='1010');

SELECT count(*) overduecnt FROM rental 
WHERE userno = '1010'
AND (((sysdate-rentaldate) >= 14
AND (rentaldate-returndate) IS NULL)
OR (returndate-rentaldate) >= 14);

SELECT userno FROM rental
WHERE (sysdate-rentaldate) >= 14
AND (rentaldate-returndate) IS NULL
OR (returndate-rentaldate) >= 14;


SELECT * FROM rental 
WHERE RETURNWHETHER ='O' AND RETURNDATE IS not NULL
AND USERNO ='9997';

DELETE FROM rental WHERE rentalno = 'AA1000';
// sysdate로 입력받으면 삭제가 안됌

INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,'9997','9788968481475','20221020','X','20221023','O');
DELETE FROM rental 
 WHERE returndate='20221023'
	AND returnwhether ='O';


select * FROM rental
WHERE RETURNWHETHER = 'O'
AND returndate IS not null;

SELECT rentalno FROM rental 
WHERE userno ='1003'
AND rentalshipwhether = 'O';

SELECT * FROM rental 
WHERE userno ='1003'
AND returnshipwhether = 'O';

UPDATE rental 
SET rentalshipwhether = 'O'
WHERE userno = '1003';

DELETE FROM rental;
DELETE FROM ship;
UPDATE books
SET rentalwhether = 'X';

UPDATE rental
SET returnwhether ='O',
 returndate = sysdate 
WHERE rentalno= 'AA1007'
AND returndate is NULL 
AND returnwhether='X';

-------------------------------------------------------------------------------------------------------
CREATE TABLE ship(
	shipno varchar2(20) PRIMARY key,
	rentalshipdate DATE,
	returnshipdate DATE,
	rentalno varchar2(20) CONSTRAINT ship_rentalno_fk REFERENCES rental(rentalno),
	userno varchar2(10) CONSTRAINT ship_userno_fk REFERENCES bookuser(userno)
);


/*
private String shipno
private String rentalshipdate
private String returnshipdate
private String rentalno
private String userno
 */

select s.*,r.*
FROM ship s,rental r
WHERE s.RENTALNO = r.RENTALNO
AND s.userno = '1001';

SELECT * FROM rental;
SELECT * FROM ship;

INSERT INTO ship values('ABC'||shipno_seq.nextval,NULL,sysdate+2,'AA1000','1029');

UPDATE SHIP
SET returnshipdate = sysdate+2
WHERE rentalno = 'AA1001';

				

DROP TABLE ship;
DELETE FROM ship;
CREATE SEQUENCE shipno_seq
		increment by 1
		start with 1000
		MINVALUE 1000
		MAXVALUE 100000;
	
DROP SEQUENCE shipno_seq;
SELECT * FROM rental;
SELECT * FROM ship;

UPDATE SHIP 
SET returnshipdate ='20221110'
WHERE rentalno = 'AA1000';
SELECT * FROM BOOKUSEr;
INSERT INTO ship values('ABC'||shipno_seq.nextval,sysdate+2,NULL,'AA1044','1029');

INSERT INTO ship values('ABC'||shipno_seq.nextval,sysdate+2,NULL,'AA100003','1000');
DELETE FROM ship WHERE shipno = 'ABC1021';

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
UPDATE books SET RENTALWHETHER ='X';
select * FROM rental;

DROP TABLE bookuser;
DROP TABLE CALL;
DROP TABLE program;
DROP TABLE rental;
DROP TABLE ship;

DELETE FROM rental;
select * FROM ship;
select * FROM library;

select * FROM program;
SELECT * FROM bookuser ORDER BY rentalcnt desc;

