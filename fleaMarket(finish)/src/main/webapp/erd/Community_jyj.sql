--유저
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

DROP TABLE fleamarketmember;
SELECT * FROM fleamarketmember;
DELETE FROM fleamarketmember WHERE email='admin';
INSERT INTO fleamarketmember values('admin@mail.com','admin','관리자','900101-000000','010-0000-0000','인천','관리자', NULL, NULL, NULL, '기타','관리자');
INSERT INTO fleamarketmember values('yujin@mail.com','')

-- 유저프로필이미지
CREATE TABLE Profile(
email varchar2(50) NOT NULL,
profileImg varchar2(200)
);
DROP TABLE Profile;
SELECT * FROM Profile;
INSERT INTO Profile values('admin@mail.com','defaultprofile.png');

CREATE TABLE FLEAMARKETQNA(
   qnaNo varchar2(100) NOT NULL,
   title varchar2(100),
   content varchar2(2000),
   regDate  varchar2(100),
   uptDate varchar2(100),
   email varchar2(50) NOT NULL,
   method char,
   category varchar2(100),
   status varchar2(10),
   refno varchar2(100),
   secretwhether char,
   PRIMARY KEY (qnaNo));
SELECT * FROM FLEAMARKETQNA;

CREATE TABLE QNAFile
(
   FileName varchar2(100),
   filePath varchar2(200),
   qnaNo varchar2(100) NOT NULL,
   filename2 varchar2(100)
);
SELECT * FROM QNAFile;

-- 커뮤니티 게시글
CREATE TABLE capplicaion
(
	communityNumber number NOT NULL, -- 커뮤니티번호
	title varchar2(100), -- 제목
	content varchar2(2000), -- 커뮤니티 내용
	registDate date, -- 등록날짜
	updateDate date, -- 수정날짜 
	category varchar2(50), -- 카테고리
	email varchar2(50) NOT NULL, -- 이메일(FK)
	-- 구분자 #
	hashtag varchar2(600), -- 해시태그
	viewCnt number, -- 조회수
	PRIMARY KEY (communityNumber)
);

-- 커뮤니티 게시글
CREATE TABLE capplicaion
(
   communityNumber number NOT NULL, -- 커뮤니티번호
   title varchar2(100), -- 제목
   content varchar2(2000), -- 커뮤니티 내용
   registDate date, -- 등록날짜
   updateDate date, -- 수정날짜 
   category varchar2(50), -- 카테고리
   email varchar2(50) NOT NULL, -- 이메일(FK)
   -- 구분자 #
   hashtag varchar2(1000), -- 해시태그
   viewCnt number, -- 조회수
   PRIMARY KEY (communityNumber)
);

CREATE SEQUENCE communityNumber_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE communityNumber_seq;

SELECT communityNumber_seq.nextval FROM dual;
SELECT communityNumber_seq.currval FROM dual;
	
DROP TABLE capplicaion CASCADE CONSTRAINTS;
SELECT * FROM capplicaion;
SELECT * FROM FLEAMARKETMEMBER f ;
DELETE FROM capplicaion;

UPDATE capplicaion 
SET updatedate=null
WHERE communityNumber=21;

UPDATE capplicaion 
SET hashtag='#3대학원,#나를 이기자'
WHERE communityNumber=21;

UPDATE capplicaion 
SET title='',
	content='',
	hashtag='#3대학원,#나를 이기자',
	updatedate=sysdate
WHERE communityNumber='comBoard23';
--mm IN (SELECT TO_CHAR(REGISTDATE, 'yyyy-mm-dd')
SELECT *
FROM BoardImg i,capplicaion c
WHERE i.communitynumber=c.communitynumber
AND c.COMMUNITYNUMBER=21;
and email = 'yujin@gmail.com';
AND category LIKE '%'||''||'%'
AND  TO_CHAR(REGISTDATE, 'mm') LIKE '%'||'05'||'%';
--registdate IN (SELECT registdate * FROM capplicaion WHERE TO_CHAR(registdate,'mm')='03')

SELECT * 
FROM capplicaion c, reply r
WHERE c.COMMUNITYNUMBER = r.COMMUNITYNUMBER
AND c.email=#{email}
--AND r.email=#{email}
ORDER BY repdate DESC;


SELECT * FROM capplicaion;
WHERE email = 'yujin@gmail.com';
AND category LIKE '%'||'홍보글'||'%';
AND  ;
WHERE communityNumber='comBoard23';
INSERT INTO capplicaion values(communityNumber_seq.nextval, '제목','내용',sysdate,NULL,'사는이야기','test@gmail.com','#태그1,#태그2',0);
INSERT INTO capplicaion values(communityNumber_seq.nextval, '제목','내용',sysdate,NULL,'사는이야기','dbwls8382@gmail.com','#태그1 #태그2',0);
-- 커뮤니티 게시글 해시태그
CREATE TABLE HashTag
(
	hashtag varchar2(1000)
);
SELECT * FROM 

-- 커뮤니티 게시글 이미지
CREATE TABLE BoardImg
(
	imgName varchar2(1000), -- 파일명
	imgPath varchar2(1000), -- 파일경로
	communityNumber number NOT NULL -- 커뮤니티 번호(FK)
);
DROP TABLE BoardImg CASCADE CONSTRAINTS;

INSERT INTO BoardImg values('파일명','파일경로',communityNumber_seq.currval);

SELECT * FROM BoardImg;

UPDATE BoardImg
SET imgname=''
WHERE communitynumber ='69';

SELECT DISTINCT *
FROM BoardImg i
ORDER BY COMMUNITYNUMBER;

SELECT DISTINCT *
FROM capplicaion c
ORDER BY COMMUNITYNUMBER;

SELECT DISTINCT *
FROM BoardImg i,capplicaion c
WHERE i.communitynumber=c.communitynumber
AND c.email='yujin@mail.com'
ORDER BY registdate desc;

SELECT *
FROM BoardImg i,capplicaion c;
WHERE i.communitynumber=c.communitynumber;
AND c.communitynumber ='1';

AND c.email='yujin@gmail.com'
ORDER BY registdate;

SELECT DISTINCT c.communitynumber, imgpath, title, content, registdate, updatedate, category, email, hashtag, viewcnt
FROM BoardImg i,capplicaion c
WHERE i.communityNumber=c.communityNumber
AND c.email='yujin@mail.com';

-- 커뮤니티 게시글 좋아요
CREATE TABLE communityHeart(
   communityNumber number CONSTRAINT Heart_cnum_fk REFERENCES capplicaion(communityNumber) ON DELETE CASCADE,
   email varchar2(50) CONSTRAINT Heart_email_fk REFERENCES fleamarketmember(email) ON DELETE CASCADE
);

DROP TABLE communityHeart;
INSERT INTO communityHeart values(0,'yujin@mail.com');
INSERT INTO communityHeart values(0,'test2@naver.com');
INSERT INTO communityHeart values(1,'test@gmail.com');
INSERT INTO communityHeart values(1,'test2@naver.com');
INSERT INTO communityHeart values(1,'yujin@mail.com');

select * FROM FLEAMARKETMEMBER;
SELECT* FROM communityHeart;
SELECT* FROM capplicaion;

SELECT * 
FROM communityHeart l, capplicaion c
WHERE l.COMMUNITYNUMBER = c.COMMUNITYNUMBER
AND c.email = 'yujin@mail.com';


-- 채팅
CREATE TABLE chat
(
	room_id number NOT NULL,
	message varchar2(2000),
	sendTime varchar2(500),
	senderemail varchar2(50) NOT NULL,
	PRIMARY KEY (room_id)
);
DROP TABLE chat CASCADE CONSTRAINTS;
SELECT * FROM chat;
-- 채팅파일
CREATE TABLE chattingFile
(
	fileName varchar2(200),
	filePath varchar2(200),
	room_id number NOT NULL
);
DROP TABLE chattingFile CASCADE CONSTRAINTS;

-- 댓글
CREATE TABLE REPLY (
  replyNo NUMBER, -- 댓글번호 
  communityNumber NUMBER, -- 게시물 번호 fk 
  email varchar2(50), -- 이메일 fk    
  repcontent varchar2(1000), -- 작성 내용
  repclass NUMBER, -- 댓글 부모 0 자식 1 
  groupOrderid NUMBER, -- 순서 NUMBER
  groupid NUMBER, --  그룹 나누기.(모 댓글과 대댓글은 같은값)
  repDate DATE,
  repupdatedate DATE, 
  isdeleted NUMBER,
  PRIMARY KEY(replyNo)
);
DROP TABLE REPLY;

CREATE SEQUENCE rep_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE rep_seq;

SELECT * FROM REPLY;
DELETE FROM reply;
SELECT * FROM CAPPLICAION c ;
INSERT INTO reply values(reply_seq.nextval,0,'dbwls8382@naver.com','멍청해요',0,0,1, sysdate,NULL,1);
INSERT INTO reply values(reply_seq.nextval,13,'dbwls8382@naver.com',rep_seq.nextval,0,0,1, sysdate,NULL,1);
INSERT INTO reply values(reply_seq.nextval,0,'dbwls8382@naver.com','멍청해요',0,0,1, sysdate,NULL,1);
INSERT INTO reply values(reply_seq.nextval,0,'dbwls8382@naver.com','멍청해요',0,0,1, sysdate,NULL,1);
INSERT INTO reply values(reply_seq.nextval,1,'test2@gmail.com','멍청해요',0,0,0, sysdate);
INSERT INTO reply values(reply_seq.nextval,0,'yujin@mail.com','멍청해요',0,0,0, sysdate);
INSERT INTO reply values(reply_seq.nextval,'ㅇㅇ너도', sysdate,'comBoard1','ehddms2909@naver.com',0);
select * FROM FLEAMARKETMEMBER;
select * FROM REPLY;


ALTER TABLE REPLY
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber)
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email)
;

CREATE SEQUENCE reply_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE reply_seq;

SELECT reply_seq.nextval FROM dual;
SELECT reply_seq.currval FROM dual;

SELECT * FROM reply;
WHERE email='yujin@gmail.com';
SELECT * FROM capplicaion;

SELECT * 
FROM capplicaion c, reply r -- r 이메일이 내가쓴 댓글, c 이메일이 내게시글에 올라온 댓글수
WHERE c.COMMUNITYNUMBER = r.COMMUNITYNUMBER
AND c.email='yujin@gmail.com';
AND r.email='yujin@gmail.com';
ORDER BY repdate desc;

--AND c.email='yujin@gmail.com'

SELECT * FROM capplicaion c
WHERE email='yujin@gmail.com'
AND category='사는이야기';




--  댓글 좋아요
CREATE TABLE reLike
(
	repNo number NOT NULL,	-- 댓글번호
	email varchar2(50) NOT NULL	--이메일
);
DROP TABLE reLike CASCADE CONSTRAINTS;

SELECT * FROM reply;
SELECT * FROM reLike;
select * FROM FLEAMARKETMEMBER;
INSERT INTO reLike values('0','pucoca@naver.com');

-- 대댓글 좋아요
CREATE TABLE rereLike
(
	rereplyNo number NOT NULL,	-- 대댓글번호
	email varchar2(50) NOT NULL	-- 이메일
);
DROP TABLE rereLike CASCADE CONSTRAINTS;

SELECT * FROM rereply;
SELECT * FROM rereLike;
select * FROM FLEAMARKETMEMBER;
INSERT INTO rereLike values('0','28888wjdaud@naver.com');
--팔로우/팔로잉
CREATE TABLE friend
(
	myemail varchar2(50) NOT NULL, -- 회원 이메일(FK 처리) 세션값
	following varchar2(50) NOT NULL -- 내가 팔로우 한사람
);
DROP TABLE friend CASCADE CONSTRAINTS;

INSERT INTO friend VALUES('dbwls8382@naver.com','ehddms2909@naver.com');
INSERT INTO friend VALUES('dbwls8382@naver.com','wjsdbsghks96@naver.com');
INSERT INTO friend VALUES('yujin@mail.com','28888wjdaud@naver.com');
INSERT INTO friend VALUES('yujin@gmail.com','pucoca@naver.com');
INSERT INTO friend VALUES('yujin@gmail.com','aoddl56@nate.com');
INSERT INTO friend VALUES('pucoca@naver.com','yujin@gmail.com');
INSERT INTO friend VALUES('two__yoon@naver.com','yujin@gmail.com');

SELECT * FROM friend;
select * FROM FLEAMARKETMEMBER;
SELECT * FROM profile;
DELETE FROM friend;

SELECT count(*) FROM friend
WHERE myemail='dbwls8382@naver.com'
AND FOLLOWING='yujin@mail.com';

-- 팔로우한 회원정보
select profileimg,nickname, m.email
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='dbwls8382@naver.com';

SELECT * 
FROM fleamarketmember m, profile p
WHERE m.email=p.email
AND authority!='관리자';
AND m.email!='admin@mail.com';

-- 팔로우가 아닌 회원 추출
select *
FROM FLEAMARKETMEMBER m, profile pro
WHERE m.EMAIL =pro.email
AND m.email!='test@gmail.com'
AND m.email NOT in (SELECT following 
					FROM friend
					WHERE myemail='yujin@mail.com');
SELECT following 
FROM friend
WHERE myemail='yujin@mail.com'

SELECT * FROM friend
WHERE myemail='yujin@gmail.com'
AND FOLLOWING='wjsdbsghks96@naver.com';

select *
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE 1=1
AND (m.email LIKE '%'||''||'%'
OR m.nickname LIKE '%'||''||'%')
--AND f.following=pro.email
--and f.following=m.email
--AND myemail='yujin@gmail.com'
AND f.myemail=pro.email
AND f.myemail = m.email
AND following='yujin@gmail.com';

SELECT m.email,profileimg
FROM FLEAMARKETMEMBER m,profile pro
WHERE m.email=pro.email;


DELETE FROM friend WHERE myemail='e';

select pro.profileimg,m.nickname,m.email
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='yujin@gmail.com'
AND (m.email LIKE '%'||''||'%'
OR m.nickname LIKE '%'||''||'%');

DELETE FROM friend
WHERE myemail='dbwls8382@naver.com'
AND FOLLOWING='222@naver.com';

select*
FROM FLEAMARKETMEMBER m,profile pro
WHERE f.myemail= m.email
AND m.email='dbwls8382@naver.com';

SELECT * FROM capplicaion;
SELECT * FROM BoardImg;
SELECT * FROM profile;
SELECT * FROM FLEAMARKETMEMBER m;

SELECT * 
FROM capplicaion c, BoardImg bi, fleamarketmember m, profile p
WHERE c.email=m.email -- 회원/게시글
AND m.email=p.email -- 회원/프로필
AND c.communitynumber=bi.communitynumber -- 게시글커뮤니티번호/게시글사진카뮤니티번호
and m.email='yujin@gmail.com';

SELECT * 
FROM fleamarketmember m, profile p
WHERE m.email=p.email; -- 회원/프로필
and m.email='yujin@gmail.com';

UPDATE fleamarketmember SET businessnumber='1234567891'
WHERE email='janexagnes@gmail.com';


SELECT LAST.* FROM(
SELECT ROWNUM RNUM,s.*
from (select *
			FROM FLEAMARKETMEMBER m,friend f,profile pro
			WHERE 1=1
			AND (m.email LIKE '%'||''||'%'
			OR m.nickname LIKE '%'||''||'%')
					AND f.following=pro.email
					AND f.following=m.email
					AND myemail='') s ) LAST
WHERE RNUM BETWEEN 10 AND 20;

SELECT LAST.* FROM(
SELECT ROWNUM RNUM,temp.*
FROM (select m.email, m.password, m.nickname, m.personalnumber, m.phonenumber, m.address, m.authority, m.businessnumber, m.kakaoemail, m.naveremail, m.category, m.name, f.myemail, f.FOLLOWING,pro.profileimg
		FROM FLEAMARKETMEMBER m,friend f,profile pro
		WHERE (m.email LIKE '%'||''||'%'
			OR m.nickname LIKE '%'||''||'%')
				AND f.following=pro.email
				AND f.following=m.email
				AND f.myemail='yujin@mail.com') temp) LAST 
WHERE RNUM BETWEEN 0 AND 10;

SELECT f.* FROM FRIEND f;

select m.email, m.password, m.nickname, m.personalnumber, m.phonenumber, m.address, m.authority, m.businessnumber, m.kakaoemail, m.naveremail, m.category, m.name, f.myemail, f.FOLLOWING,pro.profileimg
		FROM FLEAMARKETMEMBER m,friend f,profile pro
		WHERE 1=1
		AND (m.email LIKE '%'||''||'%'
			OR m.nickname LIKE '%'||''||'%')
				AND f.following=pro.email
				AND f.following=m.email
				AND myemail='yujin@mail.com';
SELECT * FROM temp;