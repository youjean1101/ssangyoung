CREATE TABLE guidline(
	guideno varchar(20) PRIMARY KEY,
	thmemdiv varchar(20),
	photopath varchar(500),
	title varchar(500),
	content varchar(4000)
);
DROP TABLE guidline;

SELECT * FROM guidline;

CREATE SEQUENCE guide_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE guide_seq;

INSERT INTO guidline values('g'||guide_seq.nextval,'','','','');