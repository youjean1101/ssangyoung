create sequence rental_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 99999
    nocycle;
SELECT rental_seq.nextval
FROM dual;
SELECT rental_seq.currval
FROM dual;
DROP SEQUENCE rental_seq;

create table rentalInfo(
    rentalNo number primary key, --대여번호
    memberdiv varchar2(30), -- 회원/비회원 구분
    nonMemberName varchar2(30), -- 비회원이름
    nonMemberPhoneNum varchar2(30), --비회원 폰번호
    bikeNo varchar2(20) CONSTRAINT rentalInfo_bikeNo_FK REFERENCES bike(bikeNo), -- 자전거번호
    id varchar2(30) constraint rentalInfo_id_FK REFERENCES USER1(id), -- 아이디
    startPlaceName varchar2(500) constraint rentalInfo_startPlaceName_Fk references rentaloffice(placename), -- 대여장소
    rentalTime date, --대여시간
    endPlaceName varchar2(500) constraint rentalInfo_endPlaceName_Fk references rentaloffice(placename), --반납장소
    returnTime date, --반납시간
    useDistance number, -- 사용거리
    unpaidCharge number, -- 미납금액
    payNo varchar2(20) constraint rentalInfo_payNo_fk references pay(payno) --결제번호
);
SELECT * FROM rentalInfo
ORDER BY rentalno;

DROP TABLE rentalInfo;
DELETE FROM rentalInfo;

INSERT INTO rentalInfo values(rental_seq.nextval,
'비회원','홍길동','010-1234-1234','0',NULL,'홍대입구역 8번출구 앞 (신)',sysdate,NULL,NULL,NULL,0,rental_seq.currval);
INSERT INTO rentalInfo values(rental_seq.nextval,
'회원',null,null,'0','himan','홍대입구역 8번출구 앞 (신)',sysdate,NULL,NULL,NULL,0,'0');
INSERT INTO rentalInfo values(rental_seq.nextval,
'회원',null,null,'0','himan','홍대입구역 8번출구 앞 (신)',sysdate,'홍대입구역 8번출구 앞 (신)',sysdate,NULL,0,'2');
INSERT INTO rentalInfo values(rental_seq.nextval,
'회원',null,null,'0','himan','홍대입구역 8번출구 앞 (신)',sysdate,'홍대입구역 8번출구 앞 (신)',sysdate,NULL,5000,'3');
--결제내역
SELECT ticketKind,payMoney,payMethod,rentalTime,payMoney
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND r.id = 'himan'
AND rentalTime between '20230130' AND '20230210'
AND paymethod LIKE '%'||'card'||'%';

--환불신청내역
SELECT ticketKind, payMoney,returnTime
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND rentaltime = returntime
AND returntime between '2022-11-07' AND '20230210'
AND id='himan';

-- 미납금액
SELECT rentalTime,ticketKind,payMoney
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND r.unpaidCharge BETWEEN 1 AND 100000
AND id='himan';
-- 비회원 대여조회
SELECT ticketKind, payMoney, payMethod,rentalTime,useTime,PHONENUMBER 
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND memberdiv='비회원';
AND nonMemberPhoneNum = '010-6666-6666';
--비회원 미납금액 조회
SELECT ticketKind,payMoney,payMethod,rentalTime,returnTime,useTime,unpaidCharge,unpaidCharge
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND memberdiv='비회원'
AND nonMemberPhoneNum = '010-5555-5555'
and unpaidcharge>0;

SELECT * FROM rentalInfo ORDER BY rentalno;
UPDATE rentalInfo SET unpaidcharge='2000' WHERE rentalno=7;
UPDATE rentalInfo SET ENDPLACENAME ='홍대입구역 8번출구 앞 (신)' WHERE rentalno=7;
UPDATE rentalInfo
SET rentaltime = TO_DATE('2023-02-09 08:30:00', 'YYYY-MM-DD HH:MI:SS'),
	returntime = TO_DATE('2023-02-09 11:30:00', 'YYYY-MM-DD HH:MI:SS'),
	USEDISTANCE = 15
WHERE rentalno=7;

UPDATE pay
SET usetime=3
WHERE payno=7;

SELECT p.payno, TICKETKIND , usetime,paymoney, PHONENUMBER ,RRNFRONT7,memberdiv, rentalno, id, bikeno, rentaltime
FROM pay p,rentalInfo r
WHERE r.payno = p.payno
ORDER BY rentaltime desc;
and p.payno=5;