DROP TABLE FLEAMARKETMEMBER;
CREATE TABLE fleamarketmember(
	email varchar2(50) NOT NULL,
	password varchar2(100),
	nickname varchar2(100),
	personalnumber varchar2(100),
	phonenumber varchar2(100),
	address varchar2(300),
	authority varchar2(100),
	businessnumber varchar2(20),
	kakaoemail varchar2(100),
	naveremail varchar2(100),
	-- 셀러들이 주로 판매하는 상품주제
	category varchar2(100),
	name varchar2(100),
	PRIMARY KEY (email)
);


DROP SEQUENCE FLEAMARKETMEMBER_seq;
CREATE SEQUENCE FLEAMARKETMEMBER_seq 
      increment by 1
      start with 1
      nocache
      MINVALUE 0
      MAXVALUE 1000;

SELECT * FROM FLEAMARKETMEMBER;
SELECT count(*) FROM FLEAMARKETMEMBER WHERE email = 'aoddl56@nate.com';
SELECT * FROM FLEAMARKETMEMBER WHERE name = '이지은' and personalnumber = '940909-2222222';
SELECT * FROM FLEAMARKETMEMBER WHERE (KAKAOEMAIL || NAVEREMAIL) LIKE '%'||#{snsemail}||'%';
SELECT EMAIL,KAKAOEMAIL,NAVEREMAIL FROM FLEAMARKETMEMBER 
    		WHERE (KAKAOEMAIL || NAVEREMAIL) LIKE '%'||''||'%';
   
    	
DELETE  FLEAMARKETMEMBER;
DELETE PROFILE;
    	
SELECT f.*,p.PROFILEIMG as profileimgname FROM FLEAMARKETMEMBER f,PROFILE p
WHERE f.EMAIL = p.EMAIL;
 and f.KAKAOEMAIL='';
    	
SELECT f.*,p.PROFILEIMG as profileimgname FROM FLEAMARKETMEMBER f,PROFILE p
			WHERE f.EMAIL(+) = p.EMAIL
			AND f.NAVEREMAIL = '28888wjdaud@naver.com';
    	
SELECT * FROM FLEAMARKETMEMBER 		
WHERE (EMAIL||kakaoemail) like '%'||'aoddl56@nate.com'||'%'


--아디찾기
SELECT g FROM FLEAMARKETMEMBER
WHERE name='이정명'
AND PERSONALNUMBER = '950828-1111111';
--비번찾기
--비번 초기화 후에,알려주기


INSERT INTO FLEAMARKETMEMBER values(
'이메일',
'admin',
'관리자',
'111111-1111111',
'010-5293-0247',
'쌍용교육센터',
'관리자',
NULL,
NULL,
NULL,
NULL,
'콘티고'
);
--윤아 연습용 관리자
INSERT INTO FLEAMARKETMEMBER values(
'admin@contigo.com',
'admin',
'관리자',
'000000-0000000',
'010-0000-0000',
'서울시 마포구 서교동',
'관리자',
NULL,
NULL,
NULL,
NULL,
'관리자'
);
UPDATE FLEAMARKETMEMBER 
SET CATEGORY ='여성의류'
WHERE EMAIL ='admin@contigo.com';

UPDATE FLEAMARKETMEMBER 
SET AUTHORITY  = '관리자'
WHERE EMAIL ='admin@contigo.com';



SELECT count(*) FROM FLEAMARKETMEMBER f
WHERE (name || email || nickname) like '%'||'28888'||'%'
AND authority = '사업자';

SELECT a.* FROM (select rownum cnt,f.*
from FLEAMARKETMEMBER f
where (name || email || nickname) like '%'||'28888'||'%'
and authority = '사업자') a
WHERE cnt BETWEEN 1 AND 3;


ALTER TABLE FLEAMARKETMEMBER MODIFY password varchar2(300);
----------------------------------------------------------------------------------
DROP TABLE profile;
CREATE TABLE Profile
(
email varchar2(50) NOT NULL,
profileImg varchar2(200)
	
);


SELECT * FROM PROFILE;
WHERE EMAIL = 'admin@contigo.com';
DELETE profile WHERE EMAIL ='28888wjdaud@naver.com';
INSERT INTO PROFILE VALUES('admin@contigo.com','defaultprofile.png');

UPDATE PROFILE 
SET EMAIL ='aoddl56@nate.com'
WHERE EMAIL ='28888wjdaud@naver.com';

