CREATE TABLE noticeBoardUser(
	id varchar(30) PRIMARY key,
	password varchar(30) NOT null,
	name varchar(30),
	email varchar(50),
	phoneNumber char(13)
);
DROP TABLE noticeBoardUser;

SELECT * FROM noticeBoardUser;

INSERT INTO noticeboarduser values('himan','1234','홍길동','gildong@naver.com','010-1234-5678');

CREATE TABLE noticeBoard(
	id varchar(30) CONSTRAINT noticeBoardUser_id_fk REFERENCES noticeBoardUser(id),
	div varchar(50) NOT null,
	title varchar(50),
	content varchar2(4000),
	fileadd varchar2(4000)
);
DROP TABLE noticeBoard;

SELECT * FROM noticeBoard;

INSERT INTO noticeboard values('himan','JAVA','for','반복문이다.','사진.jpg');