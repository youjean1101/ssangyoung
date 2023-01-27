CREATE TABLE bike(
	bikeno varchar(20) PRIMARY key,
	startdate date,
	breakdowncnt number,
	retalstate varchar(20) CONSTRAINT bike_retalstate_ck check(retalstate IN('대여중','배치중','수리중')),
	placename varchar(500)
);
DROP TABLE bike;

CREATE SEQUENCE bike_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE bike_seq;

SELECT * FROM bike;

INSERT INTO bike values('bike'||bike_seq.nextval,'20221201',1,'배치중','홍대입구역 8번출구 앞 (신)');
INSERT INTO bike values('bike'||bike_seq.nextval,'20210731',12,'배치중','홍대입구역 8번출구 앞 (신)');
INSERT INTO bike values('bike'||bike_seq.nextval,'20220403',9,'대여중','홍대입구역 8번출구 앞 (신)');
INSERT INTO bike values('bike'||bike_seq.nextval,'20220326',1,'수리중','홍대입구역 8번출구 앞 (신)');

UPDATE bike SET breakdowncnt=3 WHERE bikeno='bike1';
