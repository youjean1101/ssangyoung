

--플리마켓 홍보글 테이블
DROP TABLE FleaMarket CASCADE CONSTRAINTS;

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

--postingNumber 시퀀스
DROP SEQUENCE fleaMarket_seq;
--파일 시퀀스 번호
CREATE SEQUENCE fleaMarket_seq
      INCREMENT BY 1
      START WITH 1
      MINVALUE 0
      MAXVALUE 100000
      nocache;
     
     
     
--플리마켓 파일
CREATE TABLE FFile
(
	filename varchar2(100),
	filePath varchar2(100),
	postingNumber varchar2(100) NOT NULL
);     


---------------------------------------------------------------------------------
SELECT * FROM FLEAMARKETMEMBER;
SELECT * FROM FLEAMARKET;
SELECT * FROM FFILE;

--filename, filePath
SELECT f2.FILENAME ,f2.FILEPATH  
FROM FLEAMARKET f, FFILE f2 , FLEAMARKETMEMBER fm
WHERE f.EMAIL=fm.EMAIL AND 
f.POSTINGNUMBER =f2.POSTINGNUMBER AND 
fm.EMAIL LIKE '%'||'ehddms2909@gmail.com'||'%';


























