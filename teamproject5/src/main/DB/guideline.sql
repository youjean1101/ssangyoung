CREATE TABLE guideline(
	guideno varchar(20) PRIMARY KEY,
	thmemdiv varchar(20),
	photopath varchar(500),
	title varchar(500),
	content varchar(4000)
);
DROP TABLE guideline;

SELECT * FROM guideline;

CREATE SEQUENCE guide_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE guide_seq;

INSERT INTO guideline values('g'||guide_seq.nextval,'','','','');