DROP TABLE FFile CASCADE CONSTRAINTS;
DROP TABLE FleaMarket CASCADE CONSTRAINTS;


--플리마켓 db
CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,--게시글 번호: 시퀀스
	title varchar2(100),
	registDate date, 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL, -- 회원 테이블
	approvalMaxCnt number,
	recruitmentStartDate date,
	recruitmentEndDate date,
	openDate date,
	closeDate date,
	-- N,P,C check 제약조건 넣기
	checkForm varchar2(10),
	viewCnt number,
	address varchar2(200),
	PRIMARY KEY (postingNumber)
);


SELECT * FROM FleaMarket;


--파일 시퀀스 번호
   create sequence flea01_seq
        start with 1
        minvalue 1
        nocache;
        
       
--플리마켓 파일
CREATE TABLE FFile
(
	filename varchar2(100),
	filePath varchar2(100),
	postingNumber varchar2(100) NOT NULL
);
SELECT * FROM ffile;       