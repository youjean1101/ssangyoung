CREATE TABLE oftenqna(
	oftenqno varchar(20) PRIMARY KEY,
	div varchar(20),
	question varchar(4000),
	answer varchar(4000)
);
DROP TABLE oftenqna;

SELECT * FROM oftenqna;

CREATE SEQUENCE oqa_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE guide_seq;

INSERT INTO guidline values('oqa'||oqa_seq.nextval,'','','');