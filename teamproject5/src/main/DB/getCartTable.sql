CREATE TABLE getcard(
	getcardno varchar(20) PRIMARY key,
	cardno char(19),
	validity char(5),
	cardkind varchar(20),
	birthday date,
	id varchar(30) /*ONSTRAINT getcard_id_fk REFERENCES user(id)*/
);
DROP TABLE getcard;

CREATE SEQUENCE getcard_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE getcard_seq;

SELECT * FROM getcard;

INSERT INTO getcard values('getcard'||getcard_seq.nextval,'0000-0000-0000-0000','01/24','신한카드','19951101','himan');
INSERT INTO getcard values('getcard'||getcard_seq.nextval,'1111-1111-1111-1111','06/23','쌍용카드','19970708','higirl');
INSERT INTO getcard values('getcard'||getcard_seq.nextval,'2222-2222-2222-2222','07/25','하나카드','19911231','goodman');
INSERT INTO getcard values('getcard'||getcard_seq.nextval,'3333-3333-3333-3333','02/24','NH카드','19900807','goodgirl');

UPDATE getcard SET cardno='4444-4444-4444-4444' WHERE getcardno='getcard1';
DELETE FROM getcard WHERE getcardno='getcard1';