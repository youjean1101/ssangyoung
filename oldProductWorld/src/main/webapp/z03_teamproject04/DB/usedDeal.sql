-------------------------------사용자정보 sql--------------------------------------------
CREATE TABLE olddealuser(
	id varchar2(20) PRIMARY key, -- 아이디
	password varchar2(20) NOT null,	--패스워드
	userdiv varchar2(20) CONSTRAINT olddealuser_auth_ck check(userdiv IN('관리자','회원')),	-- 권한구분
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
INSERT INTO olddealuser values('test2','0000','회원','테스트2','테스트no.2','980110-2030002','01000011000','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test2@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test3','0000','회원','테스트3','테스트no.3','980110-2030003','01000011011','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test3@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test4','0000','회원','테스트4','테스트no.4','980110-2030004','01000011002','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test4@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test5','0000','회원','테스트5','테스트no.5','980110-2030005','01000011003','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test5@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test6','0000','회원','테스트6','테스트no.6','980110-2030006','01000011004','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test6@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test7','0000','회원','테스트7','테스트no.7','980110-2030007','01000011005','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test7@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test8','0000','회원','테스트8','테스트no.8','980110-2030008','01000011006','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test8@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test9','0000','회원','테스트9','테스트no.9','980110-2030009','01000011007','04023','서울특별시 마포구 월드컵북로','21 2층 풍성빌딩','test9@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test10','0000','회원','테스트10','테스트no.10','980110-2030010','01000011008','04023','인천광역시 강화군 길상리','초지리','test10@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test11','0000','회원','테스트11','테스트no.11','980110-2030011','01000011009','04023','인천광역시 강화군 길상리','초지리','test11@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test12','0000','회원','테스트12','테스트no.12','980110-2030012','01000011010','04023','인천광역시 강화군 길상리','초지리','test12@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test13','0000','회원','테스트13','테스트no.13','980110-2030013','01000011011','04023','인천광역시 강화군 길상리','초지리','test13@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test14','0000','회원','테스트14','테스트no.14','980110-2030014','01000011012','04023','인천광역시 강화군 길상리','초지리','test14@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test15','0000','회원','테스트15','테스트no.15','980110-2030015','01000011013','04023','인천광역시 강화군 길상리','초지리','test15@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test16','0000','회원','테스트16','테스트no.16','980110-2030016','01000011014','04023','인천광역시 강화군 길상리','초지리','test16@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test17','0000','회원','테스트17','테스트no.17','980110-2030017','01000011015','04023','인천광역시 강화군 길상리','초지리','test17@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test18','0000','회원','테스트18','테스트no.18','980110-2030018','01000011016','04023','인천광역시 강화군 길상리','초지리','test18@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test19','0000','회원','테스트19','테스트no.19','980110-2030019','01000011017','04023','인천광역시 강화군 길상리','초지리','test19@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('test20','0000','회원','테스트20','테스트no.20','980110-2030020','01000011018','04023','인천광역시 강화군 길상리','초지리','test20@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('yuna','0000','회원','윤아','윤아님','970527-2030001','01010000000','12345','서울특별시 중구 ','세종대로 125','yuna@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('miri','0000','회원','미리','미리님','961203-2030001','01020011000','67891','서울특별시 은평구','은평로 157','miri@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('dongeun','0000','회원','동은','동은님','970923-1030001','01030011000','01112','서울특별시 영등포구','여의나루로 7','dongeun@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('jeongmueong','0000','회원','정명','정명님','950912-1030001','01040011000','13141','서울특별시 서초구','반포대로23길','jeongmueong@usedDeal.com',0,0,0,0);
INSERT INTO olddealuser values('jongeun','0000','회원','종은','종은님','950627-1030001','01050011000','51617','서울특별시 강남구','압구정동 456','jongeun@usedDeal.com',0,0,0,0);

UPDATE olddealuser 
SET declarationcount='2',buycount='5',salecount=3 WHERE id='yujin';
UPDATE olddealuser 
SET point=300 WHERE id='yujin';

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
DELETE FROM olderproduct;
DELETE FROM olderproduct WHERE productno=10;

UPDATE olderproduct SET dealstat='예약중' WHERE productno=18;
SELECT* FROM olderproduct ORDER BY productno;
WHERE writerid='test';
SELECT * FROM olderproduct WHERE productno=0;
SELECT * FROM olderproduct p, reserve r
WHERE p.productno = r.productno
AND r.id='yujin'
AND p.dealstat='거래완료';
SELECT productno,productname,price,dealstat,writerid FROM olderproduct
WHERE writerid='test3'
AND dealstat='거래완료';
AND productno=9 OR productno=10 OR productno=23;
AND (dealstat='판매중' OR dealstat='예약중');
SELECT * FROM olderproduct;

INSERT INTO olderproduct values(productno_seq.nextval,'아기신발','신발','현금결제',30000,'X','X',
'아기가 금방 자라서 얼마신지 못 했네요.. 깨끗합니다.','20221222','판매중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','miri');

INSERT INTO olderproduct values(productno_seq.nextval,'LP턴테이블','전자기기','현금결제',120000,'X','X',
'이사가게되서 올립니다. 산지얼마안되서 상태 양호합니다.','20221224','예약중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test2');

INSERT INTO olderproduct values(productno_seq.nextval,'개발하기좋은 키보드','컴퓨터','현금결제',20000,'X','X',
'키보드 꾸미는거 좋아해서 부업으로 판매중 입니다. ','20221222','예약중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','jeongmueong');

INSERT INTO olderproduct values(productno_seq.nextval,'애플마우스','컴퓨터','현금결제',50000,'X','X',
'더 좋은 마우스가 생겨서 미개봉마우스 올립니다.','20221222','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test4');

INSERT INTO olderproduct values(productno_seq.nextval,'루피 마우스패드','컴퓨터','현금결제',5000,'X','X',
'김용명 닮은 루피 마우스패드 판매합니다. 새거에요~^^','20221208','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','yuna');

INSERT INTO olderproduct values(productno_seq.nextval,'몬스터보조배터리','배터리','현금결제',50000,'X','X',
'몬스터 배터리 300000mAh 팔아요','20221008','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','dongeun');

INSERT INTO olderproduct values(productno_seq.nextval,'보조배터리','배터리','현금결제',20000,'X','X',
'좋아요사세요','20220103','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test9');

INSERT INTO olderproduct values(productno_seq.nextval,'씨게이트 외장하드','컴퓨터','현금결제',80000,'X','X',
'고장안나요 쓴지 1년도 안됏어요 거의새거입니다.','20220103','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','jongeun');

INSERT INTO olderproduct values(productno_seq.nextval,'아이패드','전자기기','현금결제',300000,'X','X',
'새거생겨서 올립니다. ','20220223','거래완료','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','test9');

INSERT INTO olderproduct values(productno_seq.nextval,'단축키 마우스패드','컴퓨터','현금결제',2000,'X','X',
'새거에효.','20221103','예약중','서울특별시','마포구','월드컵북로','21 풍성빌딩2층','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'짱구마우스','컴퓨터','현금결제',30000,'X','X',
'더 귀여운 마우스가 생겨서 미개봉마우스 올립니다.','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이패드에어5','전자기기','현금결제',400000,'X','X',
'얼마안썼어요 배터리성능 90%에요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이패드프로3세대','전자기기','현금결제',800000,'X','X',
'쪼아요완전쪼아요 사세요 배터리성능 거의 100%이에요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이폰6세대','전자기기','현금결제',200000,'X','X',
'옛날 아이폰 감성 느끼고 싶은 분 사세요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이폰6세대+에어팟2세대 교환','전자기기','현금결제',0,'X','X',
'제목 그대로 아이폰 6세대랑 에어팟 2세대 교환하실 분 예약 걸어주세요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이폰se1','전자기기','현금결제',150000,'X','X',
'거의새겁니다.','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'에어팟1세대','전자기기','현금결제',80000,'X','X',
'노이즈캔슬링이 필요해서 팝니다.','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'에어팟1세대2','전자기기','현금결제',100000,'X','X',
'소독다하고 팝니다.아직 잘들려요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'에어팟프로','전자기기','현금결제',180000,'X','X',
'귀에 습기차서 올려요. 산 지 얼마안됏어요.사세요.','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'이쁜 키보드','전자기기','현금결제',30000,'X','X',
'생긴것도 귀엽고,타자감도 좋아요.일석이조템 가져가세요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'카시오계산기','전자기기','현금결제',15000,'X','X',
'전공바껴서 쓸일이 없네요..1년도 안썻어요. 상태 깨끗합니다.','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'패티김의 크리스마스앨범','전자기기','현금결제',12000,'X','X',
'옛날감성 LP사고싶은분 사세요','20230101','판매중','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'포켓몬 띠부실','전자기기','현금결제',10000,'X','X',
'아끼던건데 엄마한테 혼나서 올려요..ㅠㅠ 제 분신같은거니까 잘 보관해주실분이 사가면 좋겠습니다.','20230101','숨김','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'포켓몬 띠부실2','전자기기','현금결제',8000,'X','X',
'아끼던건데 엄마한테 혼나서 올려요..ㅠㅠ 제 분신같은거니까 잘 보관해주실분이 사가면 좋겠습니다.','20230101','숨김','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'포켓몬 띠부실3','전자기기','현금결제',12000,'X','X',
'아끼던건데 엄마한테 혼나서 올려요..ㅠㅠ 제 분신같은거니까 잘 보관해주실분이 사가면 좋겠습니다.','20230101','숨김','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'포켓몬빵','전자기기','현금결제',7000,'X','X',
'아끼던건데 엄마한테 혼나서 올려요..ㅠㅠ 거의 기운이 들어가서 희긔띠부띠부실이 나올겁니다!','20230101','숨김','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'포켓몬빵2','전자기기','현금결제',5000,'X','X',
'아끼던건데 엄마한테 혼나서 올려요..ㅠㅠ 거의 기운이 들어가서 희긔띠부띠부실이 나올겁니다!','20230101','숨김','인천광역시','계양구','작전동','현대아파트','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'아이폰se1(골드)','컴퓨터','현금결제',100000,'X','X',
'아직 쓸만해요. 세컨폰 필요하신분 사가세요','20221231','거래완료','경상남도','함양읍','지곡','123','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'애플워치3세대','컴퓨터','현금결제',150000,'X','X',
'가성비최곱니다. 거의새거에요','20221231','거래완료','경상남도','함양읍','지곡','123','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'애플워치 클래식 버클 38mm','컴퓨터','현금결제',22000,'X','X',
'제 손목에 안맞아서 팔아요~ 비싸게산거에요 ','20221231','거래완료','경상남도','함양읍','지곡','123','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'띵크패드','컴퓨터','현금결제',1200000,'X','X',
'회사에서 노트북 지원이 나와서 필요없을거 같아서 올립니다. 거의 안썻고, 사양 좋습니다. #스펙 ','20221209','거래완료','경상남도','함양읍','지곡','123','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'맥북','컴퓨터','현금결제',1000000,'X','X',
'아직쓸만함','20221220','숨김','경상남도','함양읍','지곡','123','yujin');

INSERT INTO olderproduct values(productno_seq.nextval,'씨게이트 외장하드','외장하드','현금결제',70000,'X','X',
'2TB입니다.최근꺼에요','20221213','거래완료','경상남도','함양읍','지곡','123','yujin');

UPDATE olderproduct SET dealstat='예약중' WHERE productno=16;
UPDATE olderproduct SET dealstat='거래완료' WHERE productno=0;

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
	resdate varchar(40),	-- 예약날짜
	sugprice NUMBER,	-- 제안가격
	reservation char(1) CONSTRAINT reserve_salewhether_ck check(reservation IN('O','X')),	-- 판매여부
	id varchar2(20) CONSTRAINT reserve_id_fk REFERENCES olddealuser(id),	-- 아이디
	productno NUMBER CONSTRAINT reserve_productno_fk REFERENCES olderproduct(productno)	-- 상품번호
);
DROP TABLE reserve;

CREATE SEQUENCE reserve_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE reserve_seq;
SELECT * FROM olderproduct;
SELECT*FROM reserve;

SELECT rno, r.id,r.productno,productname,price,dealstat,writerid FROM reserve r,olderproduct p 
WHERE r.productno=p.productno
AND r.id='yujin';
AND dealstat ='예약중'; -- 구매내역검색
SELECT*FROM reserve r,olderproduct p 
WHERE r.productno=p.productno
AND p.writerid='yujin'
AND dealstat ='예약중'; -- 판매내역검색
SELECT * FROM reserve r,olderproduct p 
WHERE r.productno=p.productno
AND p.productno='yujin'
AND dealstat ='예약중'; -- 판매내역검색
INSERT INTO reserve values('buy'||reserve_seq.nextval,sysdate,15000,'O','test',0);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-28 16:01',15000,'O','yujin',0);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-28 16:01',15000,'O','yujin',1);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-31 17:00',15000,'O','yujin',2);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-31 17:00',15000,'O','yujin',3);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-31 17:00',15000,'O','yujin',7);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-31 17:00',15000,'O','yujin',6);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2023-01-01 13:00',15000,'O','yujin',4);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2023-01-01 13:00',15000,'O','yujin',8);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-01 13:00',15000,'O','test2',10);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-03 13:00',15000,'O','test3',11);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-11 13:00',15000,'O','test4',12);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-13 13:00',15000,'O','test5',13);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-12 13:00',15000,'O','test6',14);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-15 13:00',15000,'O','test7',15);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-21 13:00',15000,'O','test8',16);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-26 13:00',15000,'O','test9',17);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-23 13:00',15000,'O','test10',18);
INSERT INTO reserve values('buy'||reserve_seq.nextval,'2022-12-30 13:00',15000,'O','test11',19);
DELETE FROM reserve WHERE rno='buy20';
SELECT * FROM reserve ORDER BY productno;
SELECT * FROM reserve WHERE id='yujin';
SELECT * FROM reserve WHERE id='test';
DELETE FROM reserve WHERE productno=10;

SELECT * FROM olderproduct
WHERE dealstat='예약중';
AND writerid='yujin';
-------------------------------문의하기 sql--------------------------------------------
CREATE TABLE qna(
	qno varchar2(20) PRIMARY key,	-- 문의번호
	id varchar2(20) CONSTRAINT qna_id_fk REFERENCES olddealuser(id),	-- 아이디
	title varchar2(200),	-- 문의제목
	cont varchar2(2000),	-- 문의내용
	acont varchar2(2000),	-- 답변내용
	status varchar(20)		-- 답변상태
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
SELECT * FROM cartlist;
SELECT * FROM cartlist WHERE id='yujin';
SELECT * FROM cartlist WHERE productno='1' AND id='yujin'; 
INSERT INTO cartlist values(0,'yujin');
INSERT INTO cartlist values(1,'yujin');
INSERT INTO cartlist values(2,'yujin');
INSERT INTO cartlist values(3,'yujin');
INSERT INTO cartlist values(4,'yujin');
INSERT INTO cartlist values(5,'yujin');
INSERT INTO cartlist values(6,'yujin');
INSERT INTO cartlist values(7,'yujin');
INSERT INTO cartlist values(8,'yujin');
INSERT INTO cartlist values(9,'yujin');
INSERT INTO cartlist values(0,'test');
INSERT INTO cartlist values(1,'test3');
INSERT INTO cartlist values(1,'test4');
INSERT INTO cartlist values(1,'test5');
INSERT INTO cartlist values(1,'test6');
INSERT INTO cartlist values(1,'test7');
INSERT INTO cartlist values(1,'test8');
INSERT INTO cartlist values(2,'test1');
INSERT INTO cartlist values(2,'test2');
INSERT INTO cartlist values(2,'test3');
INSERT INTO cartlist values(2,'test4');
INSERT INTO cartlist values(2,'test5');
INSERT INTO cartlist values(2,'test6');
INSERT INTO cartlist values(2,'test7');
INSERT INTO cartlist values(2,'test8');
INSERT INTO cartlist VALUES(3,'test1');
INSERT INTO cartlist VALUES(3,'test2');
INSERT INTO cartlist VALUES(3,'test3');
INSERT INTO cartlist VALUES(3,'test7');
INSERT INTO cartlist VALUES(3,'test5');
INSERT INTO cartlist VALUES(4,'test1');
INSERT INTO cartlist VALUES(4,'test2');
INSERT INTO cartlist VALUES(4,'test3');
INSERT INTO cartlist VALUES(5,'test4');
INSERT INTO cartlist VALUES(5,'test6');
INSERT INTO cartlist VALUES(5,'test7');
INSERT INTO cartlist VALUES(6,'test8');
INSERT INTO cartlist VALUES(6,'test9');
INSERT INTO cartlist VALUES(7,'test10');
INSERT INTO cartlist VALUES(7,'test11');
INSERT INTO cartlist VALUES(8,'test12');
INSERT INTO cartlist VALUES(9,'test13');
INSERT INTO cartlist VALUES(11,'test11');
INSERT INTO cartlist VALUES(11,'test12');
INSERT INTO cartlist VALUES(11,'test13');
INSERT INTO cartlist VALUES(16,'test14');
INSERT INTO cartlist VALUES(16,'test13');
INSERT INTO cartlist VALUES(16,'test12');
INSERT INTO cartlist VALUES(16,'test11');
INSERT INTO cartlist VALUES(16,'test10');
INSERT INTO cartlist VALUES(17,'test15');
INSERT INTO cartlist VALUES(18,'test16');
INSERT INTO cartlist VALUES(18,'test17');
INSERT INTO cartlist VALUES(19,'test19');
INSERT INTO cartlist VALUES(19,'test2');
INSERT INTO cartlist VALUES(20,'test1');
INSERT INTO cartlist VALUES(20,'test2');
INSERT INTO cartlist VALUES(20,'test3');
INSERT INTO cartlist VALUES(20,'test4');
INSERT INTO cartlist VALUES(20,'test5');
INSERT INTO cartlist VALUES(20,'test6');
INSERT INTO cartlist VALUES(20,'test7');
INSERT INTO cartlist VALUES(21,'test11');
INSERT INTO cartlist VALUES(22,'test12');
INSERT INTO cartlist VALUES(22,'test13');

DELETE FROM cartlist WHERE productno=1; 
DELETE FROM cartlist; 
DELETE FROM cartlist WHERE id='yujin' and productno=3; 
SELECT * FROM olderproduct;
SELECT count(productno) FROM cartlist WHERE productno=1;
SELECT * FROM olderproduct p,cartlist c
WHERE c.productno = p.productno
and id='yujin'; 
-------------------------------알람 sql--------------------------------------------
CREATE TABLE alert(
	alertno varchar2(20) PRIMARY key, -- 알람번호
	id varchar2(20) CONSTRAINT alert_id_fk REFERENCES olddealuser(id),	--아이디
	alertcontent varchar2(20),	-- 알람내용
	alertdate DATE,	--알람일시
	moveurl varchar2(300), -- url
	qno varchar2(20) CONSTRAINT alert_qno_fk REFERENCES qna(qno),	-- 문의번호
	productno number CONSTRAINT alert_productno_fk REFERENCES olderproduct(productno)	-- 상품번호
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

DELETE FROM social WHERE otherid='dongeun';
SELECT*FROM social s, olddealuser u
WHERE s.otherid = u.id
AND s.id='yujin' 
AND s.typediv='모아';
SELECT * FROM social WHERE id='yujin' AND typediv='차단';
SELECT * FROM social WHERE id='yujin' AND typediv='모아'; AND otherid='test';

SELECT*FROM social WHERE typediv='모아' AND id='yujin';
INSERT INTO social values('yujin','모아','yuna');
INSERT INTO social values('yujin','모아','miri');
INSERT INTO social values('yujin','모아','dongeun');
INSERT INTO social values('yujin','모아','jeongmueong');
INSERT INTO social values('yujin','모아','jongeun');
INSERT INTO social values('yujin','모아','test18');
INSERT INTO social values('yujin','모아','test19');
INSERT INTO social values('yujin','모아','test20');
INSERT INTO social values('yujin','모아','test');
INSERT INTO social values('test','모아','test2');
INSERT INTO social values('test','모아','test3');
INSERT INTO social values('test','모아','test4');
INSERT INTO social values('test','모아','test5');
INSERT INTO social values('yujin','차단','test3');
INSERT INTO social values('yujin','차단','test4');
INSERT INTO social values('yujin','차단','test5');
INSERT INTO social values('yujin','차단','test6');
INSERT INTO social values('yujin','차단','test7');
INSERT INTO social values('yujin','차단','test8');
INSERT INTO social values('yujin','차단','test9');
INSERT INTO social values('yujin','차단','test10');
INSERT INTO social values('yujin','차단','test11');
INSERT INTO social values('yujin','차단','test12');
INSERT INTO social values('yujin','차단','test13');
INSERT INTO social values('yujin','차단','test14');
INSERT INTO social values('yujin','차단','test15');

DELETE FROM social;
WHERE id='yujin' 
AND typediv='모아'
AND otherid='test';
DELETE FROM cartlist WHERE productno=1;

SELECT * from social;
SELECT * from cartlist;

