-------------------------------사용자정보 sql--------------------------------------------
CREATE TABLE olddealuser(
	id varchar2(20) PRIMARY key, -- 아이디
	password varchar2(20) NOT null,	--패스워드
	userdiv varchar2(20) CONSTRAINT olddealuser_auth_ck check(div IN('관리자','회원')),	-- 권한구분
	username varchar2(20),	-- 이름
	nickname varchar2(20) CONSTRAINT olddealuser_nickname_uq UNIQUE,--닉네임
	rrn varchar2(14) not NULL CONSTRAINT olddealuser_rrn_uq UNIQUE,	-- 주민번호
	phonenumber varchar2(13),	-- 전화번호
	zipcode char(5),	-- 우편번호
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
INSERT INTO olddealuser values('mgryujin','1234','관리자','관유진','관리자님스','951101-2000000','01012345678','04001','서울특별시 마포구 서교동','447-5','mgryujin@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('yujin','1234','회원','정유진','찐주인','951101-2000001','01012349999','04021','서울특별시 강남구 역삼동','735 8층 쌍용교육센터','yujin@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test','0000','회원','테스트','테스트no.1','901221-1000201','01000011234','04024','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test2','0000','회원','테스트2','테스트no.2','980110-2030001','01000011000','04023','인천광역시 강화군 길상리','초지리','test@usedDeal.com',0,0,0,0);

UPDATE olddealuser 
SET declarationcount='2',buycount='5',salecount=3 WHERE id='yujin';
UPDATE olddealuser 
SET point=30 WHERE id='yujin';

UPDATE olddealuser 
SET password='1234' ,nickname='어서오쇼',phonenumber='010-4568-9874',zipcode='40000',address='인천',detailaddress='몰라두됩니다',email='himan@naver.com' WHERE id='test2';


DELETE FROM olddealuser WHERE id='test' AND password='0000';

SELECT *
FROM olderproduct p, olddealuser u
WHERE p.writerid=u.id
AND p.productno=0;

-------------------------------상품정보 sql--------------------------------------------
CREATE TABLE olderproduct(
	productno NUMBER PRIMARY key, -- 상품번호
	productname varchar2(100),	-- 상품이름
	kind varchar2(20),	-- 분류(카테고리)
	dealmethod varchar(40) CONSTRAINT olderproduct_dealmethod_ck check(dealmethod IN('카드결제','현금결제')),	-- 거래방식(현금/결제하기)-- 추가적으로 등록 예정
	price NUMBER, -- 상품가격
	sharewhether char(1) CONSTRAINT olderproduct_sharewhether_ck check(sharewhether IN('O','X')),	-- 나눔
	priceoffer char(1) CONSTRAINT olderproduct_priceoffer_ck check(priceoffer IN('O','X')), 	-- 가격제안
	information varchar2(2000),	-- 상품설명
	registdate date,	-- 상품등록일자
	dealstat varchar(20) CONSTRAINT olderproduct_dealstat_ck check(dealstat IN('판매중','거래완료','예약중','숨김')),	-- 거래상태
	faddressval varchar(20), -- 거래위치(대분류)
	saddressval varchar(20), -- 거래위치(중분류)
	caddressval varchar(20), -- 거래위치(소분류)
	daddressval varchar(300), -- 상세 거래위치
	writerid varchar2(20) CONSTRAINT olderproduct_writerid_fk REFERENCES olddealuser(id)-- 판매자 아이디
);
DROP TABLE olderproduct;

CREATE SEQUENCE productno_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE productno_seq;
DELETE FROM olderproduct WHERE productno=0;

SELECT* FROM olderproduct;
SELECT * FROM olderproduct WHERE productno=0;
INSERT INTO olderproduct values(productno_seq.nextval,'아기신발','신발','현금결제',30000,'X','X',
'아기가 금방 자라서 얼마신지 못 했네요.. 깨끗합니다.','20221222','판매중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test');
INSERT INTO olderproduct values(productno_seq.nextval,'애플마우스','마우스','현금결제',50000,'X','X',
'더 좋은 마우스가 생겨서 미개봉마우스 올립니다.','20221222','판매중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test');
UPDATE olderproduct SET writerid='test2' WHERE productno=2;
-------------------------------상품이미지 sql--------------------------------------------
CREATE TABLE productimg(
	imageno varchar2(20) PRIMARY KEY,	-- 이미지구분번호
	productno NUMBER CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno),	-- 상품번호
	imgname varchar2(4000)	-- 파일이름
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
CREATE TABLE reserve(
	rno varchar2(20) PRIMARY key, -- 구매번호
	resdate DATE,	-- 예약날짜
	sugprice NUMBER,	-- 제안가격
	reservation char(1) CONSTRAINT buyInfo_salewhether_ck check(salewhether IN('O','X')),	-- 판매여부
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
	qno varchar2(20) PRIMARY key,	-- 문의번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id),	-- 아이디
	title varchar2(200),	-- 문의내용
	cont varchar2(2000),
	ano varchar2(20)	CONSTRAINT qna_ano_fk REFERENCES qna(qno)--답변번호
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
	noticeno varchar2(20) PRIMARY key, -- 공지번호
	noticetitle varchar2(200),
	noticecontent varchar2(2000) -- 공지내용
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
	productno number CONSTRAINT olderproduct_productno_fk REFERENCES olderproduct(productno), --상품번호
	id varchar2(20) CONSTRAINT cartlist_id_fk REFERENCES olddealuser(id)--아이디
);
DROP TABLE cartlist;

SELECT*FROM cartlist;
SELECT * FROM cartlist WHERE productno='1' AND id='yujin'; 
INSERT INTO cartlist values(1,'yujin');
INSERT INTO cartlist values(2,'yujin');
DELETE FROM cartlist WHERE productno=2; 

SELECT count(productno) FROM cartlist WHERE productno=1;
SELECT * FROM olderproduct p,cartlist c
WHERE c.productno = p.productno
and id='yujin'; 
-------------------------------알람 sql--------------------------------------------
CREATE TABLE alert(
	alertno varchar2(20) PRIMARY key, -- 알람번호
	id varchar2(20) CONSTRAINT olddealuser_id_fk REFERENCES olddealuser(id),	--아이디
	alertcontent varchar2(20),	-- 알람내용
	alerttime DATE,	--알람일시
	moveurl varchar2(300), -- url
	qno varchar2(20) CONSTRAINT qna_callno_fk REFERENCES qna(callno),	-- 문의번호
	productno varchar2(20) CONSTRAINT alert_productno_fk REFERENCES olderproduct(productno)	-- 상품번호
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
CREATE TABLE social(
	id varchar2(20) CONSTRAINT social_id_fk REFERENCES olddealuser(id), --아이디(본인)
	typediv char(6) CONSTRAINT social_typediv_ck check(typediv IN('모아','차단')),	-- 모아/차단 구분
	otherid varchar2(20) CONSTRAINT social_otherid_fk REFERENCES olddealuser(id)	--아이디(타 회원)
);
DROP TABLE social;

DELETE FROM social;
SELECT*FROM social s, olddealuser u
WHERE s.otherid = u.id
AND s.id='yujin' 
AND s.typediv='모아';
SELECT * FROM social;
SELECT * FROM social WHERE id='yujin' AND typediv='모아' AND otherid='test';

SELECT*FROM social WHERE typediv='모아' AND id='yujin';
INSERT INTO social values('yujin','모아','test');
INSERT INTO social values('yujin','모아','test2');
INSERT INTO social values('test','모아','test2');
INSERT INTO social values('yujin','차단','test2');
INSERT INTO social values('yujin','차단','test');

DELETE FROM social 
WHERE id='yujin' 
AND typediv='모아'
AND otherid='test';
