create sequence rental_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 99999
    nocycle;
SELECT *FROM rental_seq;
DROP SEQUENCE rental_seq;

create table rentalInfo(
    rentalNo number primary key,
    memberdiv varchar2(30),
    nonMemberName varchar2(30),
    nonMemberPhoneNum varchar2(30),
    bikeNo varchar2(20) CONSTRAINT rentalInfo_bikeNo_FK REFERENCES bike(bikeNo),
    id varchar2(30) constraint rentalInfo_id_FK REFERENCES USER1(id),
    startPlaceName varchar2(500) constraint rentalInfo_startPlaceName_Fk references rentaloffice(placename),
    rentalTime date,
    endPlaceName varchar2(500) constraint rentalInfo_endPlaceName_Fk references rentaloffice(placename),
    returnTime date,
    useDistance number,
    unpaidCharge number,
    payNo varchar2(20) constraint rentalInfo_payNo_fk references pay(payno)
);
SELECT * FROM rentalInfo
ORDER BY rentalno;

DROP TABLE rentalInfo;

INSERT INTO rentalInfo values(rental_seq.nextval,
'비회원','홍길동','010-1234-1234','0',NULL,'홍대입구역 8번출구 앞 (신)',sysdate,NULL,NULL,NULL,0,'1');
INSERT INTO rentalInfo values(rental_seq.nextval,
'회원',null,null,'0','himan','홍대입구역 8번출구 앞 (신)',sysdate,NULL,NULL,NULL,0,'20');
INSERT INTO rentalInfo values(rental_seq.nextval,
'회원',null,null,'0','himan','홍대입구역 8번출구 앞 (신)',sysdate,'홍대입구역 8번출구 앞 (신)',sysdate,NULL,0,'20');

SELECT * FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND r.id = 'himan'
AND rentalTime between '20230130' AND '20230208'
AND paymethod LIKE '%'||''||'%';

SELECT * FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND rentaltime = returntime
AND returntime between '20230130' AND '20230208'
AND id='himan';

SELECT * FROM pay p,rentalInfo r
WHERE r.payno = p.payno
AND r.unpaidCharge BETWEEN 1 AND 100000
AND id='himan';
