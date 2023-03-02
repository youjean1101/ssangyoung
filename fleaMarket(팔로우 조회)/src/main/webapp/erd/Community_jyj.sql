-- 커뮤니티 게시글
CREATE TABLE capplicaion
(
	communityNumber varchar2(100) NOT NULL, -- 커뮤니티번호
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

UPDATE capplicaion 
SET title='',
	content='',
	hashtag='#태그할수 있을까?',
	updatedate=sysdate
WHERE communityNumber='comBoard23';
SELECT * FROM capplicaion
WHERE communityNumber='comBoard23';

INSERT INTO capplicaion values('comBoard'||communityNumber_seq.nextval, '제목','내용',sysdate,NULL,'사는이야기','dbwls8392@gmail.com','#태그1 #태그2',0);
-- 커뮤니티 게시글 이미지
CREATE TABLE BoardImg
(
	imgName varchar2(100), -- 파일명
	imgPath varchar2(500), -- 파일경로
	communityNumber varchar2(100) NOT NULL -- 커뮤니티 번호(FK)
);
DROP TABLE BoardImg CASCADE CONSTRAINTS;

INSERT INTO BoardImg values('파일명','파일경로','comBoard0');

SELECT * FROM BoardImg;

SELECT * FROM BoardImg i,capplicaion c
WHERE i.communityNumber=c.communityNumber;
-- 채팅
CREATE TABLE chat
(
	room_id number NOT NULL,
	message varchar2(2000),
	sendTime varchar2(500),
	senderemail varchar2(50) NOT NULL,
	communityNumber varchar2(100) NOT NULL,
	PRIMARY KEY (room_id)
);
DROP TABLE chat CASCADE CONSTRAINTS;

-- 채팅파일
CREATE TABLE chattingFile
(
	fileName varchar2(200),
	filePath varchar2(200),
	room_id number NOT NULL
);
DROP TABLE chattingFile CASCADE CONSTRAINTS;

-- 댓글
CREATE TABLE reply
(
	repContent varchar2(10000),
	repNo number NOT NULL,
	repDate date,
	communityNumber varchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	rereplyNo number NOT NULL,
	reReport number,
	PRIMARY KEY (repNo)
);
DROP TABLE reply CASCADE CONSTRAINTS;

-- 대댓글
CREATE TABLE rereply
(
	rereplyNo number NOT NULL,
	rereplyContent varchar2(1000),
	rereplyDate date,
	email varchar2(50) NOT NULL,
	rereReportcnt number,
	PRIMARY KEY (rereplyNo)
);
DROP TABLE rereply CASCADE CONSTRAINTS;

--  댓글 좋아요
CREATE TABLE reLike
(
	repNo number NOT NULL,
	email varchar2(50) NOT NULL
);
DROP TABLE reLike CASCADE CONSTRAINTS;

-- 대댓글 좋아요
CREATE TABLE rereLike
(
	rereplyNo number NOT NULL,
	email varchar2(50) NOT NULL
);
DROP TABLE rereLike CASCADE CONSTRAINTS;

--팔로우/팔로잉
CREATE TABLE friend
(
	myemail varchar2(50) NOT NULL, -- 회원 이메일(FK 처리) 세션값
	following varchar2(50) NOT NULL -- 내가 팔로우 한사람
);
DROP TABLE friend CASCADE CONSTRAINTS;

INSERT INTO friend VALUES('dbwls8382@naver.com','222@naver.com');

SELECT * FROM friend;
select * FROM FLEAMARKETMEMBER;
SELECT * FROM profile;

select *
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='dbwls8382@naver.com';

select *
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='dbwls8382@naver.com'
AND (m.email LIKE '%'||''||'%'
OR m.nickname LIKE '%'||''||'%');

DELETE FROM friend
WHERE myemail='dbwls8382@naver.com'
AND FOLLOWING='222@naver.com';
