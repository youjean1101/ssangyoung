CREATE TABLE members(
	memno varchar2(20) PRIMARY key,
	mname varchar2(20),
	address varchar2(100),
	Phone_Number varchar2(13),
	id varchar2(20),
	password varchar2(20),
	COL NUMBER,
	COL2 varchar2(20)
);
SELECT * FROM members;
DROP TABLE members;

INSERT INTO members values('1000','홍길동','인천광역시 부평구 삼산동','010-000-0000','himan','1234',10,'manager');
INSERT INTO members values('1001','김길동','서울 신림','010-123-4567','goodman','5678',0,'user');
INSERT INTO members values('1002','이길동','부산 마린시티','010-111-0000','higirl','4567',3,'user');
INSERT INTO members values('1003','마길동','제주도 서귀포시','010-222-0000','goodgirl','7777',1,'user');
DELETE FROM members WHERE mname = '홍길동';

CREATE TABLE rentla(
	rentalno NUMBER,
	memno varchar2,
	bookno NUMBER,
	COL varchar2(20),
	