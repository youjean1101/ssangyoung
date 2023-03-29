------------------------------------------------------ 회원
SELECT * FROM fleamarketmember;

CREATE TABLE fleamarketmember(
   email varchar2(50) NOT NULL,
   password varchar2(100),
   nickname varchar2(100),
   personalnumber varchar2(100),
   phonenumber varchar2(100),
   address varchar2(300),
   authority varchar2(20),
   businessnumber varchar2(20),
   kakaoemail varchar2(100),
   naveremail varchar2(100),
   -- 셀러들이 주로 판매하는 상품주제
   category varchar2(100),
   name varchar2(100),
   PRIMARY KEY (email)
);


------------------------------------------------------ 유저프로필이미지
SELECT * FROM Profile;

CREATE TABLE Profile(
email varchar2(50) NOT NULL,
profileImg varchar2(200)
);

------------------------------------------------------ 플리마켓
SELECT * FROM fleamarket;
SELECT * FROM ffile;
INSERT INTO ffile VALUES ('플리마켓 신청 양식.docx','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',1);
INSERT INTO ffile VALUES ('양식 작성 방법.txt','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',1);
INSERT INTO ffile VALUES ('m02.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',1);
INSERT INTO ffile VALUES ('market.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',1);
INSERT INTO ffile VALUES ('fleaMarket.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',2);
DELETE FROM ffile WHERE filename = '6 최종 프로젝트 공지.txt';

CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,
	title varchar2(100),
	registDate varchar2(100), 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL,
	approvalMaxCnt number,
	recruitmentStartDate varchar2(100),
	recruitmentEndDate varchar2(100),
	openDate varchar2(100),
	closeDate varchar2(100),
	-- N,P,C 
	checkForm varchar2(10),
	viewCnt number,
	address varchar2(200),
	PRIMARY KEY (postingNumber)
);

CREATE SEQUENCE fleaMarket_seq
      INCREMENT BY 1
      START WITH 1
      MINVALUE 0
      MAXVALUE 100000;
     
DROP SEQUENCE fleaMarket_seq;

INSERT INTO fleaMarket VALUES (fleaMarket_seq.nextval,'댕댕이마켓',to_CHAR(sysdate,'YYYY-MM-DD'),'이 세상 모든 댕댕이들을 위한 플리마켓에 참여해주세요!<br>강아지용품이라면 어떤 분이든 환영합니다 ^-^','3762801384','ehddms2909@naver.com',30,'2023-03-01','2023-03-31','2023-07-01','2023-07-07','P',0,'서울 강남구 삼성동 135-4');
INSERT INTO fleaMarket VALUES (fleaMarket_seq.nextval,'미래마켓',to_CHAR(sysdate,'YYYY-MM-DD'),'주최 : 중소벤처기업부, 소상공인연합회<br>지역별 우수 소상공인 상품의 전시와 판매를 중심으로 플리마켓, 푸드트럭, 체험존 운영 예정<br>소상공인 업체의 지역 제품 판매','3762801384','miri7575@naver.com',30,'2023-03-13','2023-03-20','2023-04-01','2023-04-07','N',NULL,NULL);


CREATE TABLE FFile
(
	filename varchar2(100),
	filePath varchar2(100),
	postingNumber varchar2(100) NOT NULL
);
------------------------------------------------------ 신청
CREATE TABLE FApplication
(
	postingNumber varchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	applicationNo number NOT NULL,
	applicationDate DATE,
	approvalWhether char,
	PRIMARY KEY (applicationNo),
	CONSTRAINT FApplication_email_fk FOREIGN KEY (email) REFERENCES fleamarketmember(email) ON DELETE CASCADE
);


CREATE SEQUENCE FApplication_seq
	INCREMENT BY 1
    START WITH 1
    MINVALUE 0
    MAXVALUE 100000
	nocache;
     
DROP SEQUENCE FApplication_seq;

INSERT INTO FApplication VALUES (1,'aoddl56@nate.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (2,'aoddl56@nate.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (3,'ehddms2909@naver.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (6,'miri7575@naver.com',FApplication_seq.nextval,sysdate,'r');
INSERT INTO FApplication VALUES (#{postingNumber},#{email},FApplication_seq.nextval,sysdate,null);

UPDATE FApplication
SET approvalWhether = 'r'
WHERE applicationNo = 3;

DROP TABLE FApplication;

---------------- 총 페이지 수
SELECT count(*)
FROM fapplication a, fleaMarket fm
WHERE a.postingNumber = fm.postingNumber(+)
AND fm.title like '%'||''||'%'
AND fm.email = 'test@naver.com';

-- rownum까지 최종 완성본
SELECT *
FROM (
	SELECT rownum cnt,
			a.applicationno,
			fm.title,
			a.applicationdate,
			a.approvalwhether,
			p.profileimg,
			m.nickname,
			f.filename
	FROM fapplication a, applicationfile f, fleaMarket fm, fleamarketmember m, profile p
	WHERE a.applicationno = f.applicationno(+)
	AND a.postingNumber = fm.postingNumber(+)
	AND fm.email = m.email(+) -- 내 신청 조회 시 작성자(글쓴이)	AND fm.email = m.email(+) / 받은 신청 조회 시 신청자	AND a.email = m.email(+)
	AND fm.email = p.email(+) -- 내 신청 조회 시 작성자(글쓴이)	AND fm.email = p.email(+) / 받은 신청 조회 시 신청자	AND a.email = p.email(+)
	AND fm.title LIKE '%'||''||'%'
	AND a.email LIKE '%'||''||'%' -- 내 신청 조회 시 로그인 = 신청자	AND a.email / 받은 신청 조회 시 로그인 = 작성자(글쓴이)	AND fm.email
	ORDER BY a.applicationno DESC)
WHERE cnt BETWEEN 1 AND 50;


DROP TABLE FleaMarket;

------------------------------------------------------ 신청 파일
SELECT *
FROM ApplicationFile
ORDER BY applicationno;

SELECT filename
FROM ApplicationFile
WHERE applicationNo = #{applicationNo}
		
CREATE TABLE ApplicationFile
(
	filename varchar2(100),
	applicationNo number NOT NULL,
	CONSTRAINT AppFile_applicationNo_fk FOREIGN KEY (applicationNo) REFERENCES FApplication(applicationNo) ON DELETE CASCADE
);

DROP TABLE ApplicationFile;

INSERT INTO ApplicationFile VALUES ('양식 작성 방법.txt',2);
INSERT INTO ApplicationFile VALUES (#{filename},FApplication_seq.currval);

UPDATE ApplicationFile
SET applicationDate = '230302'
WHERE applicationNo = 3;

SELECT count(applicationno)
FROM FApplication
WHERE postingNumber = 6
AND email = 'test@naver.com';
----------------------------------------------------------------------------------------------------------------------
SELECT * FROM profile;
SELECT * FROM fleamarketmember;
SELECT * FROM ffile;
SELECT * FROM fleamarket;
SELECT * FROM FApplication;
SELECT * FROM ApplicationFile;

   	
INSERT INTO FApplication VALUES (37,'ehddms2909@naver.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (7,'test@naver.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (1,'miri7575@naver.com',FApplication_seq.nextval,sysdate,'a');
INSERT INTO ffile VALUES ('양식 작성 방법.txt','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/','1');
INSERT INTO ApplicationFile VALUES ('플리마켓 신청 양식.docx',22);
DELETE FROM fleamarket WHERE postingNumber = '33';
DELETE FROM FApplication WHERE applicationno = 52;
DELETE FROM ApplicationFile WHERE applicationno = 50;

ALTER TABLE FApplication
ADD FOREIGN KEY (email)
REFERENCES fleamarketmember (email)
ON DELETE CASCADE;

UPDATE fleamarket
SET checkform = 'P' 
WHERE postingnumber = 37 ;

-- 내 신청
SELECT *
FROM (
	SELECT ROW_NUMBER() over(ORDER BY a.applicationno DESC) cnt,
			a.applicationno,
			fm.title,
			a.applicationdate,
			a.approvalwhether,
			p.profileimg,
			m.nickname,
			f.filename
	FROM fapplication a, applicationfile f, fleaMarket fm, fleamarketmember m, profile p
	WHERE a.applicationno = f.applicationno(+)
	AND a.postingNumber = fm.postingNumber(+)
	AND fm.email = m.email(+)
	AND fm.email = p.email(+)
	AND fm.title LIKE '%'||''||'%'
	AND a.email = 'test@naver.com'
	ORDER BY a.applicationno DESC);
-- 받은 신청			
SELECT *
FROM (
	SELECT ROW_NUMBER() over(ORDER BY a.applicationno DESC) cnt,
			a.applicationno,
			fm.title,
			a.applicationdate,
			a.approvalwhether,
			p.profileimg,
			m.nickname,
			f.filename
	FROM fapplication a, applicationfile f, fleaMarket fm, fleamarketmember m, profile p
	WHERE a.applicationno = f.applicationno(+)
	AND a.postingNumber = fm.postingNumber(+)
	AND a.email = m.email(+)
	AND a.email = p.email(+)
	AND fm.title like '%'||''||'%'
	AND fm.email = 'test@naver.com'
	ORDER BY a.applicationno DESC);

SELECT FILENAME
FROM APPLICATIONFILE f, FAPPLICATION a
WHERE f.APPLICATIONNO = a.APPLICATIONNO
AND email = 'miri7575@naver.com';