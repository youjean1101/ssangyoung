--FLEAMARKETMEMBER 회원
--PROFILE 회원이미지
--FLEAMARKETQNA 문의/공지글
--QNAFILE 문의공지 파일

--FLEAMARKET 플마홍보글
--FFILE 홍보글파일
--FAPPLICATION 신청글
--APPLICATIONFILE 신청글파일

--capplicaion 커뮤니티게시글
--BoardImg 커뮤니티게시글파일

SELECT * FROM FLEAMARKETMEMBER;
--커뮤니티=============================================================================================
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

CREATE TABLE BoardImg
(
	imgName varchar2(1000), -- 파일명
	imgPath varchar2(1000), -- 파일경로
	communityNumber number NOT NULL -- 커뮤니티 번호(FK)
);
--커뮤니티 시퀀스 
CREATE SEQUENCE communityNumber_seq
increment by 1
start with 1
MINVALUE 0
MAXVALUE 100000;


--커뮤니티(동은)=============================================================================================

--플리마켓 홍보글 테이블
DROP TABLE FleaMarket CASCADE CONSTRAINTS;
SELECT * FROM PROFILE p ;
CREATE TABLE FleaMarket(
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

--커뮤니티(미리)=============================================================================================
-- 신청
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
     
SELECT * FROM FApplication;
DROP TABLE FApplication;
DROP SEQUENCE FApplication_seq;


-- 신청 파일
CREATE TABLE ApplicationFile
(
   filename varchar2(100),
   applicationNo number NOT NULL,
   CONSTRAINT AppFile_applicationNo_fk FOREIGN KEY (applicationNo) REFERENCES FApplication(applicationNo) ON DELETE CASCADE
);

SELECT * FROM ApplicationFile;
DROP TABLE ApplicationFile;



---------------------------------------------------------------------------------
SELECT * FROM FLEAMARKETQNA ;
SELECT PROFILEIMG  FROM PROFILE WHERE EMAIL = 'kim_se_0@naver.com' AND PROFILEIMG != 'defaultprofile.png';
SELECT * FROM FLEAMARKET;
SELECT * FROM PROFILE;

--filename, filePath
SELECT f2.FILENAME ,f2.FILEPATH  
FROM FLEAMARKET f, FFILE f2 , FLEAMARKETMEMBER fm
WHERE f.EMAIL=fm.EMAIL AND 
f.POSTINGNUMBER =f2.POSTINGNUMBER AND 
fm.EMAIL LIKE '%'||'ehddms2909@gmail.com'||'%';

DELETE fleamarketqna;

UPDATE FLEAMARKETQNA SET TITLE ='0',EMAIL='zzzzz',METHOD='g',CATEGORY='x',SECRETWHETHER='j'

--------------------------------------------------------------------------


--** 같은 테이블의 pk를 fk로 쓰기 ㅋㅋ!!!
ALTER TABLE FLEAMARKETQNA DROP CONSTRAINT FOREIGN KEY cascade;


SELECT * FROM FLEAMARKETqna;
SELECT * FROM FLEAMARKETMEMBER;


-- 1.
 
SELECT profileimg FROM profile WHERE email='28888wjdaud@naver.com';
SELECT * FROM QNAFILE
WHERE qnano in (SELECT qnano FROM FLEAMARKETQNA WHERE email = '28888wjdaud@naver.com');



--qna파일리스트
SELECT * FROM FLEAMARKETQNA;
SELECT CONCAT(FILEPATH,filename) FROM QNAFILE q
WHERE QNANO IN (
SELECT QNANO  FROM FLEAMARKETQNA f 
WHERE email = 'wjuuuuu@gmail.com'
OR refno IN (
SELECT QNANO  FROM FLEAMARKETQNA f 
WHERE email = 'wjuuuuu@gmail.com'
))
and filename IS NOT NULL;






-- 커뮤니티 파일 뽑기

  
SELECT IMGNAME FROM BOARDIMG b WHERE b.COMMUNITYNUMBER in(
SELECT c.COMMUNITYNUMBER  FROM CAPPLICAION c, FLEAMARKETMEMBER f 
WHERE c.EMAIL = f.EMAIL AND f.EMAIL = '28888wjdaud@naver.com')
and IMGNAME IS NOT NULL;

  
--미리파트 파일뽑기
  -- email로 신청 파일명 추출
SELECT FILENAME
FROM APPLICATIONFILE f, FAPPLICATION a
WHERE f.APPLICATIONNO = a.APPLICATIONNO
AND email = '%'||''||'%'
AND filename IS NOT null;


--동은파트 파일뽑기
SELECT CONCAT(SUBSTR(f2.FILEPATH,INSTR(f2.FILEPATH, '/',-1,3)+1,100),f2.FILENAME) AS filename
FROM FLEAMARKET f, FFILE f2 , FLEAMARKETMEMBER fm
WHERE f.EMAIL=fm.EMAIL
AND f.POSTINGNUMBER =f2.POSTINGNUMBER
AND fm.EMAIL LIKE '%'||''||'%'
AND f2.FILENAME Is NOT null;

SELECT * FROM ffile;

SELECT CONCAT(f2.FILEPATH,f2.FILENAME) AS filename
FROM FLEAMARKET f, FFILE f2 , FLEAMARKETMEMBER fm
WHERE f.EMAIL=fm.EMAIL
AND f.POSTINGNUMBER =f2.POSTINGNUMBER
AND fm.EMAIL LIKE '%'||''||'%'
AND f2.FILENAME Is NOT null;

SELECT SUBSTR(f2.FILEPATH,INSTR(f2.FILEPATH, '/',-1,3)+1,100) AS FILEPATH  FROM ffile f2;










SELECT qna.* FROM
			(SELECT rownum cnt,level,f.* FROM fleamarketqna f
			WHERE 1=1
			AND f.METHOD != 'n'
			and (title || email) LIKE '%'||#{title}||'%'
			START with refno=0
			CONNECT BY PRIOR qnano=refno
			ORDER siblings BY qnano DESC) qna
			WHERE cnt BETWEEN #{start} AND #{end};

UPDATE  FLEAMARKETQNA  SET refno=0;
			
