
/* Drop Tables */

DROP TABLE alert CASCADE CONSTRAINTS;
DROP TABLE ApplicationFile CASCADE CONSTRAINTS;
DROP TABLE BoardImg CASCADE CONSTRAINTS;
DROP TABLE chattingFile CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE reLike CASCADE CONSTRAINTS;
DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE capplicaion CASCADE CONSTRAINTS;
DROP TABLE FApplication CASCADE CONSTRAINTS;
DROP TABLE FFile CASCADE CONSTRAINTS;
DROP TABLE FleaMarket CASCADE CONSTRAINTS;
DROP TABLE friend CASCADE CONSTRAINTS;
DROP TABLE MemberFile CASCADE CONSTRAINTS;
DROP TABLE Profile CASCADE CONSTRAINTS;
DROP TABLE QNAFile CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE rereLike CASCADE CONSTRAINTS;
DROP TABLE rereply CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE alert
(
	sender varchar2(10),
	alertno varchar2(100) NOT NULL,
	receiver varchar2(10),
	sendDate date,
	content varchar2(1000),
	-- y,n으로 구분 
	readstate char DEFAULT 'n',
	email varchar2(50) NOT NULL
);


CREATE TABLE ApplicationFile
(
	filename varchar2(100),
	applicationNo number NOT NULL
);


CREATE TABLE BoardImg
(
	imgName varchar2(100),
	imgPath varchar2(100),
	communityNumber varchar2(100) NOT NULL
);


CREATE TABLE capplicaion
(
	communityNumber varchar2(100) NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	registDate date,
	updateDate date,
	category varchar2(50),
	email varchar2(50) NOT NULL,
	-- 구분자 #
	hashtag varchar2(100),
	viewCnt number,
	PRIMARY KEY (communityNumber)
);


CREATE TABLE chat
(
	room_id number NOT NULL,
	message varchar2(2000),
	sendTime varchar2(500),
	senderemail varchar2(50) NOT NULL,
	communityNumber varchar2(100) NOT NULL,
	PRIMARY KEY (room_id)
);


CREATE TABLE chattingFile
(
	fileName varchar2(200),
	filePath varchar2(200),
	room_id number NOT NULL
);


CREATE TABLE FApplication
(
	postingNumber varchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	applicationNo number NOT NULL,
	applicationDate DATE,
	approvalWhether char,
	PRIMARY KEY (applicationNo)
);


CREATE TABLE FFile
(
	filename varchar2(100),
	filePath varchar2(100),
	postingNumber varchar2(100) NOT NULL
);


CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,
	title varchar2(100),
	registDate date, 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL,
	approvalMaxCnt number,
	recruitmentStartDate date,
	recruitmentEndDate date,
	openDate date,
	closeDate date,
	-- N,P,C 
	checkForm varchar2(10),
	viewCnt number,
	address varchar2(200),
	PRIMARY KEY (postingNumber)
);


CREATE TABLE friend
(
	follower varchar2(50) NOT NULL,
	following varchar2(50) NOT NULL
);


CREATE TABLE fleamarketmember
(
	email varchar2(50) NOT NULL,
	password varchar2(50),
	nickname varchar2(100),
	personalNumber varchar2(100),
	phoneNumber varchar2(100),
	address varchar2(300),
	authority char,
	businessNumber varchar2(20),
	kakaoemail varchar2(100),
	naveremail varchar2(100),
	-- 셀러들이 주로 판매하는 상품주제
	category varchar2(100),
	PRIMARY KEY (email)
);


CREATE TABLE MemberFile
(
	businessLicense varchar2(200),
	email varchar2(50) NOT NULL
);


CREATE TABLE Reply
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


CREATE TABLE Profile
(
	profileImg varchar2(200),
	--filePath varchar2(200),
	email varchar2(50) NOT NULL
);


CREATE TABLE QNA
(
	qnaNo varchar2(100) NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	regDate  date,
	uptDate date,
	email varchar2(50) NOT NULL,
	-- 문의글이면 q , 공지사항 n 
	-- 
	-- 
	method char,
	answer varchar2(2000),
	PRIMARY KEY (qnaNo)
);


CREATE TABLE QNAFile
(
	FileName varchar2(100),
	filePath varchar2(200),
	qnaNo varchar2(100) NOT NULL
);


CREATE TABLE reLike
(
	repNo number NOT NULL,
	email varchar2(50) NOT NULL
);


CREATE TABLE rereLike
(
	rereplyNo number NOT NULL,
	email varchar2(50) NOT NULL
);


CREATE TABLE rereply
(
	rereplyNo number NOT NULL,
	rereplyContent varchar2(1000),
	rereplyDate date,
	email varchar2(50) NOT NULL,
	rereReportcnt number,
	PRIMARY KEY (rereplyNo)
);



/* Create Foreign Keys */

ALTER TABLE BoardImg
	ADD FOREIGN KEY (communityNumber)
	REFERENCES capplicaion (communityNumber)
;


ALTER TABLE chat
	ADD FOREIGN KEY (communityNumber)
	REFERENCES capplicaion (communityNumber)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (communityNumber)
	REFERENCES capplicaion (communityNumber)
;


ALTER TABLE chattingFile
	ADD FOREIGN KEY (room_id)
	REFERENCES chat (room_id)
;


ALTER TABLE ApplicationFile
	ADD FOREIGN KEY (applicationNo)
	REFERENCES FApplication (applicationNo)
;


ALTER TABLE FApplication
	ADD FOREIGN KEY (postingNumber)
	REFERENCES FleaMarket (postingNumber)
;


ALTER TABLE FFile
	ADD FOREIGN KEY (postingNumber)
	REFERENCES FleaMarket (postingNumber)
;

ALTER TABLE FFile
ADD FOREIGN KEY (postingNumber)
REFERENCES FleaMarket (postingNumber)
ON DELETE CASCADE;

ALTER TABLE FleaMarket
ADD FOREIGN KEY (email)
REFERENCES FLEAMARKETMEMBER (email)
ON DELETE CASCADE;





ALTER TABLE alert
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE capplicaion
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE chat
	ADD FOREIGN KEY (senderemail)
	REFERENCES Member (email)
;


ALTER TABLE FApplication
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE FleaMarket
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE friend
	ADD FOREIGN KEY (following)
	REFERENCES Member (email)
;


ALTER TABLE friend
	ADD FOREIGN KEY (follower)
	REFERENCES Member (email)
;


ALTER TABLE MemberFile
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE Profile
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE reLike
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE rereLike
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE rereply
	ADD FOREIGN KEY (email)
	REFERENCES Member (email)
;


ALTER TABLE reLike
	ADD FOREIGN KEY (repNo)
	REFERENCES NEW_TABLE (repNo)
;


ALTER TABLE QNAFile
	ADD FOREIGN KEY (qnaNo)
	REFERENCES QNA (qnaNo)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (rereplyNo)
	REFERENCES rereply (rereplyNo)
;


ALTER TABLE rereLike
	ADD FOREIGN KEY (rereplyNo)
	REFERENCES rereply (rereplyNo)
;



/* Comments */

COMMENT ON COLUMN alert.readstate IS 'y,n으로 구분 ';
COMMENT ON COLUMN capplicaion.hashtag IS '구분자 #';
COMMENT ON COLUMN FleaMarket.checkForm IS 'N,P,C ';
COMMENT ON COLUMN FApplication.approvalWhether IS '승인 a, 거부 r';
COMMENT ON COLUMN Member.category IS '셀러들이 주로 판매하는 상품주제';
COMMENT ON COLUMN QNA.method IS '문의글이면 q , 공지사항 n 

';



