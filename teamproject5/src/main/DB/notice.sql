CREATE TABLE notice(
	noticeno varchar2(20) PRIMARY KEY,
	mgrid varchar2(30) CONSTRAINT notice_mgrid_fk REFERENCES user1(id),
	writedate DATE,
	title varchar2(300) NOT NULL,
	content varchar2(4000) NOT NULL,
	imgfile varchar2(4000)
);
DROP TABLE notice;

CREATE SEQUENCE notice_seq
		INCREMENT BY 1
		START WITH 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE notice_seq;

INSERT INTO notice values('notice'||notice_seq.nextval,'',sysdate,'','',NULL);
UPDATE notice SET title='', content='', imgfile='' WHERE noticeno='';
DELETE FROM notice WHERE noticeno='';

SELECT*FROM notice;