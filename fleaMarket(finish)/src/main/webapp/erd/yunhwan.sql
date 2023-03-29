drop table capplication;

CREATE TABLE CommunityHeart
(
    communityNumber NUMBER NOT NULL,
    email varchar2(50) NOT NULL
);
--좋아요 fk 설정 
ALTER TABLE CommunityHeart
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber) on delete cascade
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email)  on delete cascade
;
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
   hashtag varchar2(100), -- 해시태그
   viewCnt number, -- 조회수
   PRIMARY KEY (communityNumber)
);
--게시글 제약 조건 
ALTER TABLE capplication
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email) on delete cascade 
;
--댓글 게시글 
CREATE TABLE REPLY (
  replyNo NUMBER, -- 댓글번호 
  communityNumber NUMBER, -- 게시물 번호 fk 
  email varchar2(50), -- 이메일 번호 fk    
  repcontent varchar2(1000), -- 작성 내용
  repclass NUMBER, -- 댓글 부모 0 자식 1 
  groupOrderid NUMBER, -- 순서 NUMBER
  groupid NUMBER, -- 그룹 나누기.(모 댓글과 대댓글은 같은값)
  repDate DATE,
  PRIMARY KEY(replyNo)
);

ALTER TABLE REPLY
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber) on delete cascade
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email) on delete cascade
;


--게시물 상세 조회 
SELECT c.COMMUNITYNUMBER,c.TITLE,c.CONTENT,c.REGISTDATE,c.UPDATEDATE,f.NICKNAME,p.PROFILEIMG,c.EMAIL FROM CAPPLICAION c ,FLEAMARKETMEMBER f,BOARDIMG b
,PROFILE p
WHERE f.EMAIL = c.EMAIL AND c.COMMUNITYNUMBER = b.COMMUNITYNUMBER AND f.EMAIL = p.EMAIL
AND c.COMMUNITYNUMBER = 'comBoard1';

-- 게시물 사진 조회 
SELECT b.IMGNAME FROM CAPPLICAION c,BOARDIMG b 
WHERE c.COMMUNITYNUMBER = b.COMMUNITYNUMBER 
AND c.COMMUNITYNUMBER = 'comBoard26';

-- 게시물 글쓴이 팔로우 
SELECT count(*) FROM FRIEND f, CAPPLICAION c
WHERE f.FOLLOWING  = c.EMAIL 
AND c.COMMUNITYNUMBER = 'comBoard1'
AND f.MYEMAIL = 'pucoca@naver.com';

SELECT*FROM FRIEND;
-- 게시물 팔로우 처리 
INSERT INTO FRIEND VALUES(,);
-- 게시물 팔로우 삭제 처리 
DELETE FROM FRIEND WHERE MYEMAIL = 'pucoca@naver.com';

--좋아요 count 확인 
SELECT count(*) FROM communityHeart
WHERE communityNumber = 'comboard1';

--좋아요 유무 확인 
SELECT count(*) FROM CAPPLICAION c , COMMUNITYHEART h 
WHERE c.COMMUNITYNUMBER = h.COMMUNITYNUMBER
AND communityNumber = 'comboard1'
AND email = 'pucoca@naver.com';

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


--유저프로필이미지
CREATE TABLE Profile(
email varchar2(50) NOT NULL,
profileImg varchar2(200)
);

--신고 
create table irregularReport(
    irrNo number, --신고번호
    communityNumber number NOT NULL,
    email varchar2(50) NOT NULL,
    irrType number, -- 0: 스팸 1: 음란 2:주제에 맞지 않는 글 3: 욕설 4: 광고 5:정치
    regDate date
);

ALTER TABLE irregularReport
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber)
    ON DELETE CASCADE
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email)
    on delete cascade
;
--게시판 이미지 
CREATE TABLE BoardImg
(
	imgName varchar2(1000), -- 파일명
	imgPath varchar2(1000), -- 파일경로
	communityNumber number NOT NULL -- 커뮤니티 번호(FK)
);

ALTER TABLE BoardImg
	ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber)
    ON DELETE CASCADE
;
-- 친구추가 
CREATE TABLE FRIEND (
   myEmail varchar(50),
   following varchar2(50)
)
ALTER TABLE message
	ADD FOREIGN KEY (myEmail)
	REFERENCES fleaMarketMember(email) 
	ON DELETE cascade
	ADD FOREIGN KEY (following)
	REFERENCES fleaMarketMember(email)
	ON DELETE cascade
;


CREATE SEQUENCE communityNumber_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;

CREATE SEQUENCE replys_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;

CREATE SEQUENCE irr_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;
CREATE TABLE ChatRoom(
   roomId NUMBER PRIMARY KEY,
   useremail varchar2(50) -- fk   
)
ALTER TABLE ChatRoom
	ADD FOREIGN KEY (useremail)
	REFERENCES fleaMarketMember(email)
;

CREATE TABLE message(
      roomId NUMBER, --fk    
      sender varchar2(50), --fk 
      receiver varchar2(50), --fk 
      content varchar2(1000),
      msgisRead NUMBER,
      msgSendTime DATE
     
)

ALTER TABLE message
	ADD FOREIGN KEY (sender)
	REFERENCES fleaMarketMember(email)
	ADD FOREIGN KEY (receiver)
	REFERENCES fleaMarketMember(email)
	ADD FOREIGN KEY (roomId)
	REFERENCES ChatRoom(roomId)
;
SELECT * FROM FRIEND;

CREATE TABLE FRIEND (
   myEmail varchar(50),
   following varchar2(50)
)
ALTER TABLE message
	ADD FOREIGN KEY (myEmail)
	REFERENCES fleaMarketMember(email) 
	ON DELETE cascade
	ADD FOREIGN KEY (following)
	REFERENCES fleaMarketMember(email)
	ON DELETE cascade
;

