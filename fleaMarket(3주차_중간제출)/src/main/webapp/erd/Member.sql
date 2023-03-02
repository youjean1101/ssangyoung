DROP TABLE FLEAMARKETMEMBER;
CREATE TABLE fleamarketmember(
	email varchar2(50) NOT NULL,
	password varchar2(50),
	nickname varchar2(100),
	personalnumber varchar2(100),
	phonenumber varchar2(100),
	address varchar2(300),
	authority char,
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
      MAXVALUE 100000;

SELECT * FROM FLEAMARKETMEMBER;
SELECT count(*) FROM FLEAMARKETMEMBER WHERE email = 'aoddl56@nate.com';
SELECT * FROM FLEAMARKETMEMBER WHERE name = '이지은' and personalnumber = '940909-2222222';
SELECT * FROM FLEAMARKETMEMBER WHERE (KAKAOEMAIL || NAVEREMAIL) LIKE '%'||#{snsemail}||'%';
SELECT EMAIL,KAKAOEMAIL,NAVEREMAIL FROM FLEAMARKETMEMBER 
    		WHERE (KAKAOEMAIL || NAVEREMAIL) LIKE '%'||''||'%';
    	
SELECT f.*,p.PROFILEIMG as profileimgname FROM FLEAMARKETMEMBER f,PROFILE p
			WHERE f.EMAIL(+) = p.EMAIL
			AND f.email = '288888wjdaud@gmail.com';




--아디찾기
SELECT g FROM FLEAMARKETMEMBER
WHERE name='이정명'
AND PERSONALNUMBER = '950828-1111111';
--비번찾기
--비번 초기화 후에,알려주기

DELETE FLEAMARKETMEMBER WHERE email ='aoddl56@nate.com';
INSERT INTO FLEAMARKETMEMBER values(
'aoddl56@nate.com',
'!dnfwlq12',
'맹이',
'950828-1111111',
'010-5293-0247',
'창원시 성산구 사파동',
'm',
NULL,
NULL,
NULL,
NULL,
'이정명'
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
SET ADDRESS  = '07932&서울 양천구 목동중앙남로16나길 38-10& (목동, 월드메르디앙)&201호' 
WHERE EMAIL ='28888wjdaud@naver.com'
AND NAME  = ''
AND PERSONALNUMBER  =''; 

ALTER TABLE FLEAMARKETMEMBER MODIFY password varchar2(300);
----------------------------------------------------------------------------------
DROP TABLE profile;
CREATE TABLE Profile
(
email varchar2(50) NOT NULL,
profileImg varchar2(200)
	
);

DELETE profile
WHERE email

SELECT * FROM PROFILE;
DELETE profile WHERE EMAIL ='28888wjdaud@naver.com';
INSERT INTO PROFILE VALUES('aoddl56@nate.com','defaultprofile.png');

UPDATE PROFILE 
SET PROFILEIMG ='고릴라.jpg'
WHERE EMAIL ='dbwls8382@naver.com';