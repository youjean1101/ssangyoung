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
