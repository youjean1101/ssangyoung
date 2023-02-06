CREATE TABLE user1(
	id varchar2(30) PRIMARY key,
	pass varchar2(30) NOT NULL,
	rentpass char(4),
	auth varchar2(20) NOT null,
	name varchar2(20) NOT NULL,
	phonenumber varchar2(20) NOT NULL,
	email varchar2(100) NOT NULL,
	weight NUMBER NOT NULL,
	totaldistance NUMBER,
	getcardno varchar2(20),
	foreign KEY(getcardno) REFERENCES getPay(getPayno) ON DELETE cascade
);
DROP TABLE user1;

SELECT * FROM USER1;

INSERT INTO user1 values('dnjswn1','dnjswn123!','','일반회원','홍설','0102353776','dnjswn@gmail.com',65,'','');
INSERT INTO user1 values('dnjswn123','dnjswn123!','','일반회원','홍길동','01023321476','d25swn@naver.com',88,'','');
INSERT INTO user1 values('himan','1234','','일반회원','홍길동','01023321476','d25swn@naver.com',88,'','');

SELECT COUNT(*) FROM user1 WHERE id='dnjsw'; 
delete from user1 where id='dnjswn1';


ALTER TABLE user1
ADD CONSTRAINT fk_user1
FOREIGN KEY (getcardno)
REFERENCES getcard(getcardno) on delete cascade;
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME ='user1';




--렌탈 정보 등록
INSERT INTO rentalInfo values(rental_seq.nextval,'회원','','','bike21','test222','홍대입구역 8번출구 앞 (신)',TO_date('2023-02-01','yyyy-mm-dd'),'홍대입구역 8번출구 앞 (신)',TO_date('2023-02-01','yyyy-mm-dd'),500,'','');

INSERT INTO bike values('bike'||bike_seq.nextval,sysdate,1,'배치중','홍대입구역 8번출구 앞 (신)');
INSERT INTO bike values('bike'||bike_seq.nextval,sysdate,12,'배치중','홍대입구역 8번출구 앞 (신)');
INSERT INTO bike values('bike'||bike_seq.nextval,sysdate,9,'대여중','홍대입구역 8번출구 앞 (신)');


INSERT INTO rentaloffice values('홍대입구역 8번출구 앞 (신)','서울 마포구 동교동','홍대입구역 8번출구','02-000-0000',30);

SELECT id, sum(usedistance) AS sui from rentalInfo where to_char(returnTime,'ww')=to_char(sysdate,'ww') group by id ORDER BY sui DESC;
SELECT id, sum(usedistance) AS sui from rentalInfo where to_char(returnTime,'mm')=to_char(sysdate,'mm') group by id ORDER BY sui DESC;
SELECT sum(usedistance) from rentalInfo where to_char(returnTime,'ww')=to_char(sysdate,'ww') AND id='dnjswn123';
SELECT TO_char(returntime,'ww')  FROM rentalInfo
;
