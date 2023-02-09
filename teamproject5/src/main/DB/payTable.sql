CREATE TABLE pay(
	payno varchar(20) PRIMARY KEY,
	ticketkind varchar(50),
	usetime NUMBER,
	paymoney NUMBER,
	paymethod varchar(20) CONSTRAINT pay_paymethod_ck check(paymethod IN('card','phone')),
	telecom varchar(20),
	phonenumber varchar(13),
	rrnfront7 varchar(8),
	cardno char(19),
	validity varchar(10),
	cardkind varchar(50),
	email varchar(50)
);
DROP TABLE pay;

CREATE SEQUENCE pay_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE pay_seq;



DELETE FROM pay;

INSERT INTO pay values(0,'정기권(1시간)',1,1000,'phone','SKT','010--','-',NULL,NULL,NULL,NULL);
INSERT INTO pay values(pay_seq.nextval,'정기권(1시간)',1,1000,'phone','SKT','010-0000-0000','951101-2',NULL,NULL,NULL,NULL);
INSERT INTO pay values(pay_seq.nextval,'정기권(1시간)',1,1000,'card',null,null,null,'0000-0000-0000-0000','01/24','신한카드','test@ssangyoung.com');
INSERT INTO pay values(pay_seq.nextval,'정기권(2시간)',1,1000,'card',null,null,null,'0000-0000-0000-0000','01/24','신한카드','test@ssangyoung.com');
--INSERT INTO rentalInfo values(rental_seq.nextval,'비회원',#{nonMemberName},#{nonMemberPhoneNum},#{bikeNo},NULL,#{startPlaceName},sysdate,NULL,NULL,NULL,0,#{PayNo});

UPDATE pay SET usetime='2' WHERE payno='pay1';
DELETE FROM pay WHERE payno='pay1';

SELECT * FROM pay ORDER BY payno;
SELECT * FROM rentalInfo ORDER BY rentalno;

UPDATE rentalInfo
SET returntime = TO_DATE( '2023-01-30 03:30:00', 'YYYY/MM/DD HH:MI:SS PM'), 
	USEDISTANCE = 20,
	rentaltime = TO_DATE( '2023-01-30 03:30:00', 'YYYY/MM/DD HH:MI:SS PM')
WHERE rentalno=2;
UPDATE rentalInfo
SET returntime = TO_DATE( '2023-02-03 04:30:00', 'YYYY/MM/DD HH:MI:SS PM'), 
	USEDISTANCE = 20,
	rentaltime = TO_DATE( '2023-02-03 03:20:00', 'YYYY/MM/DD HH:MI:SS PM')
WHERE rentalno=3;

SELECT bikeno, RETALSTATE  FROM bike WHERE bikeno=7;
