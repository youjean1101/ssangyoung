CREATE TABLE pay(
	payno varchar(20) PRIMARY KEY,
	ticketkind varchar(20),
	usetime NUMBER,
	paymoney NUMBER,
	paymethod varchar(20) CONSTRAINT pay_paymethod_ck check(paymethod IN('card','phone')),
	telecom varchar(20),
	phonenumber varchar(13),
	rrnfront7 varchar(8),
	cardno char(19),
	validity char(5),
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

SELECT * FROM pay;

INSERT INTO pay values(0,'정기권(1시간)',1,1000,'phone','SKT','010--','-',NULL,NULL,NULL,NULL);
INSERT INTO pay values(pay_seq.nextval,'정기권(1시간)',1,1000,'phone','SKT','010-0000-0000','951101-2',NULL,NULL,NULL,NULL);
INSERT INTO pay values(pay_seq.nextval,'정기권(1시간)',1,1000,'card',null,null,null,'0000-0000-0000-0000','01/24','신한카드','test@ssangyoung.com');
INSERT INTO pay values(pay_seq.nextval,'정기권(2시간)',1,1000,'card',null,null,null,'0000-0000-0000-0000','01/24','신한카드','test@ssangyoung.com');
--INSERT INTO rentalInfo values(rental_seq.nextval,'비회원',#{nonMemberName},#{nonMemberPhoneNum},#{bikeNo},NULL,#{startPlaceName},sysdate,NULL,NULL,NULL,0,#{PayNo});

UPDATE pay SET usetime='2' WHERE payno='pay1';
DELETE FROM pay WHERE payno='pay1';


