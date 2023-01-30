CREATE TABLE user1(
	id varchar2(30) PRIMARY key,
	pass varchar2(30) NOT NULL,
	rentpass char(4),
	auth varchar2(20) NOT null,
	name varchar2(20) NOT NULL,
	phonenumber varchar2(20) NOT NULL,
	email varchar2(100) NOT NULL,
	weight NUMBER NOT NULL,
	totaldistance NUMBER,
	getcardno varchar2(20),
	foreign KEY(getcardno) REFERENCES getcard(getcardno)
	/* 회원탈퇴 시, 모든회원 삭제 방법
	CONSTRAINT TEST2_FK_PK_COLUMN1 FOREIGN KEY(PK_COLUMN1) REFERENCES TEST1(PK_COLUMN1)
    ON DELETE CASCADE*/
);
DROP TABLE user1; 

SELECT * FROM USER1;

INSERT INTO user1 values('dnjswn1','dnjswn123','','사용자','홍길동','0102353776','dnjswn@gmail.com',65,'','');