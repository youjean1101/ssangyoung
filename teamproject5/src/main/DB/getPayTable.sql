CREATE TABLE getPay(
	getPayno varchar(20) PRIMARY key, --등록수단번호
	cardno char(19),	--카드번호
	validity char(5),	-- 유효기간
	cardkind varchar(20),	--카드종류
	email varchar2(100), --이메일
	birthday date,	--생일
	phonenumber varchar(13),	--휴대폰번호
	rrn char(14)	--주민번호 앞자리
);
DROP TABLE getPay;
SELECT getPay_seq.currval
FROM dual;

CREATE SEQUENCE getPay_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE getPay_seq;

SELECT getpayno,phonenumber,rrn,cardno FROM getPay WHERE getpayno=33;

--INSERT INTO getPay values(getPay_seq.nextval,#{cardNo},#{validity},#{cardKind},#{email},#{birthDay},#{phoneNumber},#{rrn});
INSERT INTO getPay values(getPay_seq.nextval,'0000-0000-0000-0000','01/24','신한카드','himan@gmail.com','19951101',null,null);
INSERT INTO getPay values(getPay_seq.nextval,'1111-1111-1111-1111','06/23','쌍용카드','higirl@gmail.com','19970708',null,null);
INSERT INTO getPay values(getPay_seq.nextval,'2222-2222-2222-2222','07/25','하나카드','goodman@gmail.com','19911231',null,null);
INSERT INTO getPay values(getPay_seq.nextval,'3333-3333-3333-3333','02/24','NH카드','goodgirl@gmail.com','19900807',null,null);
INSERT INTO getPay values(getPay_seq.nextval,null,null,null,null,null,null,null);

UPDATE getPay SET cardno='4444-4444-4444-4444' WHERE getcardno='getcard1';
DELETE FROM getPay WHERE getcardno='getcard1';



SELECT * FROM getPay ORDER by getPayno desc;
SELECT id, getcardno FROM user1 WHERE id='himan';
--WHERE getcardno=35;