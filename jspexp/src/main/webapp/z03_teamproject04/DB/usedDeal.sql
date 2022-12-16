-------------------------------사용자정보 sql--------------------------------------------
CREATE TABLE olddealuser(
	id varchar2(20) PRIMARY key, -- 아이디
	password varchar2(20) NOT null,	--패스워드
	div varchar2(20) CONSTRAINT olddealuser_auth_ck check(div IN('관리자','회원')),	-- 권한구분
	username varchar2(20),	-- 이름
	rrn varchar2(14) not NULL CONSTRAINT olddealuser_rrn_uq UNIQUE,	-- 주민번호
	address varchar2(100),	-- 주소
	detailaddress varchar2(100),	-- 상세주소
	phonenumber varchar2(13),	-- 전화번호
	email varchar2(50), -- 이메일
	point number,	-- 포인트
	salecount number,	-- 판매횟수
	buycount number,	-- 구매횟수
	declarationcount number	-- 신고횟수
);
DROP TABLE olddealuser;

SELECT * FROM olddealuser;
INSERT INTO olddealuser values();
-------------------------------상품정보 sql--------------------------------------------
CREATE TABLE olderproduct(
	productno NUMBER PRIMARY key, -- 상품번호
	kind varchar2(20),	-- 분류(카테고리)
	productname varchar2(100),	-- 상품이름
	price NUMBER, -- 상품가격
	information varchar2(2000),	-- 상품설명
	registdate date,	-- 상품등록일자
	dealmethod varchar(40) CONSTRAINT olderproduct_dealmethod_ck check(dealmethod IN('카드결제','현금')),	-- 거래방식(현금/결제하기)-- 추가적으로 등록 예정
	dealstat varchar(20) CONSTRAINT olderproduct_dealstat_ck check(dealstat IN('판매중','거래완료','예약중','숨김')),	-- 거래상태
	sharewhether char(1) CONSTRAINT olderproduct_sharewhether_ck check(sharewhether IN('O','X')),	-- 나눔
	priceoffer char(1) CONSTRAINT olderproduct_priceoffer_ck check(priceoffer IN('O','X')), 	-- 가격제안
	id varchar2(20)	CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id)-- 아이디
);
DROP TABLE olderproduct;

CREATE SEQUENCE productno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE productno_seq;

SELECT * FROM olderproduct;
INSERT INTO olddealuser values();
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
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id), --아이디(본인)
	typediv char(1),	-- 모아/차단 구분
	id varchar2(20) CONSTRAINT olddealotheruser_id_fk REFERENCES olddealuser(id)	--아이디(타 회원)
);
DROP TABLE appointed;

CREATE SEQUENCE appointed_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE appointed_seq;

SELECT*FROM appointed;
