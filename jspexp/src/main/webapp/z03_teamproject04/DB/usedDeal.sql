-------------------------------사용자정보 sql--------------------------------------------
CREATE TABLE olddealuser(
	id varchar2(20) PRIMARY key, -- 아이디
	password varchar2(20) NOT null,	--패스워드
	div varchar2(20) CONSTRAINT olddealuser_auth_ck check(div IN('관리자','회원')),	-- 권한구분
	profileimg varchar(4000),
	username varchar2(20),	-- 이름
	/*rrn varchar2(14) not NULL CONSTRAINT olddealuser_rrn_uq UNIQUE,	-- 주민번호*/
	birthday varchar2(8),
	gender varchar2(6) CONSTRAINT olddealuser_gender_ck check(gender IN('남성','여성')),
	phonenumber varchar2(13),	-- 전화번호
	address varchar2(100),	-- 주소
	detailaddress varchar2(100),	-- 상세주소
	email varchar2(50), -- 이메일
	point number,	-- 포인트
	salecount number,	-- 판매횟수
	buycount number,	-- 구매횟수
	declarationcount number	-- 신고횟수
);
DROP TABLE olddealuser;

SELECT id,username,point,declarationcount,salecount,buycount FROM olddealuser WHERE id='yujin' ;
SELECT * FROM olddealuser WHERE id='?';
SELECT * FROM olddealuser WHERE id='test' AND password='0000';
SELECT * FROM olddealuser;
INSERT INTO olddealuser values('mgryujin','1234','관리자','프로필사진','관유진','19951101','여성','01012345678','서울특별시 마포구 서교동','447-5','mgryujin@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('yujin','1234','회원','프로필사진','정유진','19981221','여성','01000011234','서울특별시 강남구 역삼동','735 8층 쌍용교육센터','yujin@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test','0000','회원','프로필사진','테스트용','19981221','남성','01000011234','서울특별시 마포구 월드컵북로',' 21 2층 풍성빌딩','test@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test2','0000','회원','프로필사진','테스트2','19990521','남성','01000011000','인천광역시 강화군 길상리','초지리','test2@usedDeal.com',0,0,0,0);

UPDATE olddealuser 
SET declarationcount='2',buycount='5',salecount=3 WHERE id='yujin';
UPDATE olddealuser 
SET point=30 WHERE id='yujin';

UPDATE olddealuser 
SET password='1234', profileimg='',birthday='19901221', gender='남자',phonenumber='010-4568-9874',address='인천',detailaddress='몰라두됩니다',email='himan@naver.com' WHERE id='test2';


DELETE FROM olddealuser WHERE id='test' AND password='0000';

SELECT *
FROM olderproduct p, olddealuser u
WHERE p.writerid=u.id
AND p.productno=0;

-------------------------------상품정보 sql--------------------------------------------
CREATE TABLE olderproduct(
	productno NUMBER PRIMARY key, -- 상품번호
	kind varchar2(20),	-- 분류(카테고리)
	productname varchar2(100),	-- 상품이름
	price NUMBER, -- 상품가격
	information varchar2(2000),	-- 상품설명
	registdate date,	-- 상품등록일자
	dealmethod varchar(40) CONSTRAINT olderproduct_dealmethod_ck check(dealmethod IN('카드결제','현금결제')),	-- 거래방식(현금/결제하기)-- 추가적으로 등록 예정
	dealstat varchar(20) CONSTRAINT olderproduct_dealstat_ck check(dealstat IN('판매중','거래완료','예약중','숨김')),	-- 거래상태
	sharewhether char(1) CONSTRAINT olderproduct_sharewhether_ck check(sharewhether IN('O','X')),	-- 나눔
	priceoffer char(1) CONSTRAINT olderproduct_priceoffer_ck check(priceoffer IN('O','X')), 	-- 가격제안
	writerid varchar2(20)	CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id)-- 아이디
);
DROP TABLE olderproduct;

CREATE SEQUENCE productno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE productno_seq;
DELETE FROM olderproduct WHERE productno=22;

SELECT* FROM olderproduct;
SELECT * FROM olderproduct WHERE productno=0;
INSERT INTO olderproduct values(productno_seq.nextval,'신발','아기신발',30000,
'아기가 금방 자라서 얼마신지 못 했네요.. 깨끗합니다.','20221222','현금결제','판매중','X','X','test');
INSERT INTO olderproduct values(productno_seq.nextval,'마우스','애플마우스',50000,
'더 좋은 마우스가 생겨서 미개봉마우스 올립니다.','20221222','현금결제','판매중','X','X','yujin');
-------------------------------상품이미지 sql--------------------------------------------
CREATE TABLE productimg(
	imageno varchar2(4000) PRIMARY KEY,	-- 이미지구분번호
	productno NUMBER CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno),	-- 상품번호
	filepath varchar2(4000),	-- 파일경로
	filename varchar2(4000)	-- 파일이름
);
DROP TABLE productimg;

CREATE SEQUENCE imageno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE imageno_seq;

SELECT * FROM productimg;
INSERT INTO productimg values();
-------------------------------구매정보 sql--------------------------------------------
CREATE TABLE buyInfo(
	buyno varchar2(20) PRIMARY key, -- 구매번호
	paymentdate DATE,	-- 예약날짜
	offerprice NUMBER,	-- 제안가격
	salewhether char(1) CONSTRAINT buyInfo_salewhether_ck check(salewhether IN('O','X')),	-- 판매여부
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id),	-- 아이디
	productno NUMBER CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno)	-- 상품번호
);
DROP TABLE totalbuy;

CREATE SEQUENCE buyno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE buyno_seq;

SELECT*FROM totalbuy;
INSERT INTO totalbuy values();
-------------------------------문의하기 sql--------------------------------------------
CREATE TABLE qna(
	callno varchar2(20) PRIMARY key,	-- 문의번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id),	-- 아이디
	question varchar2(2000),	-- 문의내용
	answer varchar2(20)	CONSTRAINT qna_callno_fk REFERENCES qna(callno)--답변번호
);
DROP TABLE qna;

CREATE SEQUENCE callno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE callno_seq;

SELECT*FROM qna;
INSERT INTO qna values();
-------------------------------공지사항 sql--------------------------------------------
CREATE TABLE notice(
	callno2 varchar2(20) PRIMARY key, -- 공지번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id), -- 아이디
	title varchar2(200), -- 공지명
	content varchar2(2000) -- 공지내용
);
DROP TABLE notice;

CREATE SEQUENCE callno2_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE callno2_seq;

SELECT*FROM notice;
INSERT INTO notice values();
-------------------------------찜 sql--------------------------------------------
CREATE TABLE cartlist(
	productno varchar2(20) CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno), --상품번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id)--아이디
);
DROP TABLE cartlist;

SELECT*FROM cartlist;
INSERT INTO cartlist values();
-------------------------------알람 sql--------------------------------------------
CREATE TABLE alert(
	alertno varchar2(20) PRIMARY key, -- 알람번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id),	--아이디
	alertcontent varchar2(20),	-- 알람내용
	alerttime DATE,	--알람일시
	url varchar2(300), -- url
	callno varchar2(20) CONSTRAINT qna_callno_fk REFERENCES qna(callno),	-- 문의번호
	productno varchar2(20) CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno)	-- 상품번호
);
DROP TABLE alert;

CREATE SEQUENCE alertno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE alertno_seq;

SELECT*FROM alert;
-------------------------------소셜 sql--------------------------------------------
CREATE TABLE appointed(
	id varchar2(20) CONSTRAINT appointed_id_fk REFERENCES olddealuser(id), --아이디(본인)
	typediv char(6) CONSTRAINT appointed_typediv_ck check(typediv IN('모아','차단')),	-- 모아/차단 구분
	otherid varchar2(20) CONSTRAINT appointed_otherid_fk REFERENCES olddealuser(id)	--아이디(타 회원)
);
DROP TABLE appointed;

DELETE FROM appointed;
SELECT*FROM appointed a, olddealuser u
WHERE a.otherid = u.id
AND a.id='yujin' 
AND a.typediv='모아';
SELECT * FROM appointed;

SELECT*FROM appointed WHERE typediv='모아' AND id='yujin';
INSERT INTO appointed values('yujin','모아','test');
INSERT INTO appointed values('yujin','모아','test2');
INSERT INTO appointed values('yujin','차단','test2');
INSERT INTO appointed values('yujin','차단','test');
