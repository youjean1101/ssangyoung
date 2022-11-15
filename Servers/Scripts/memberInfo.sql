CREATE TABLE MembersInfo(
	userno varchar2(10) PRIMARY key,
	div varchar2(20) CONSTRAINT User_auth_ck check(div IN('manager','user')),
	uname varchar2(20) not null,
	rrn char(14) not NULL CONSTRAINT User_rrn_uq UNIQUE,	
	address varchar2(100),
	phone_Number char(13),
	id varchar2(20) CONSTRAINT User_id_uq UNIQUE,
	password varchar2(20) not null
);

SELECT * FROM MembersInfo;

INSERT INTO MembersInfo values(1,'manager','홍길동','990101-1000000','인천광역시 부평구 삼산동','010-000-0000','himan','1234');
INSERT INTO MembersInfo values(2,'manager','test','990102-1000000','인천광역시 부평구 삼산동','010-000-0000','test','5678');
INSERT INTO MembersInfo values(3,'user','김길동','951231-2000000','서울 신림','010-123-0000','goodgirl','9999');
INSERT INTO MembersInfo values(4,'user','이길동','961021-2000000','부산 마린시티','010-456-0000','higirl','8888');
INSERT INTO MembersInfo values(5,'user','마길동','970703-1000000','제주도 서귀포시','010-789-0000','goodman','5555');
