CREATE TABLE getPay(
	getPayno varchar(20) PRIMARY key,
	cardno char(19),
	validity char(5),
	cardkind varchar(20),
	email varchar2(100),
	birthday date,
	phonenumber varchar(13),
	rrn char(14),
	id varchar(30) /*CONSTRAINT getcard_id_fk REFERENCES user(id)*/
);
DROP TABLE getPay;

CREATE SEQUENCE getPay_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE getPay_seq;

SELECT * FROM getPay;

INSERT INTO getPay values('getPay'||getPay_seq.nextval,'0000-0000-0000-0000','01/24','신한카드','himan@gmail.com','19951101',null,null,'himan');
INSERT INTO getPay values('getPay'||getPay_seq.nextval,'1111-1111-1111-1111','06/23','쌍용카드','higirl@gmail.com','19970708',null,null,'higirl');
INSERT INTO getPay values('getPay'||getPay_seq.nextval,'2222-2222-2222-2222','07/25','하나카드','goodman@gmail.com','19911231',null,null,'goodman');
INSERT INTO getPay values('getPay'||getPay_seq.nextval,'3333-3333-3333-3333','02/24','NH카드','goodgirl@gmail.com','19900807',null,null,'goodgirl');

UPDATE getPay SET cardno='4444-4444-4444-4444' WHERE getcardno='getcard1';
DELETE FROM getPay WHERE getcardno='getcard1';