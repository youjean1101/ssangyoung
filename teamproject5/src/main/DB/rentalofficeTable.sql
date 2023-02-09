CREATE TABLE rentaloffice(
	placename varchar(500) PRIMARY key,
	loc varchar(1000),
	locdetail varchar(2000),
	phonenumber varchar(13),
	maxstorcnt NUMBER
);

DROP TABLE rentaloffice;

SELECT * FROM rentaloffice;

INSERT INTO rentaloffice values('홍대입구역 8번출구 앞 (신)','서울 마포구 동교동','홍대입구역 8번출구','02-000-0000',30);
INSERT INTO rentaloffice values('홍대입구역 2번출구 앞 (신)','서울 마포구 동교동','홍대입구역 2번출구','02-0000-0000',40);
INSERT INTO rentaloffice values('홍대입구역 3번출구 (신)','서울 마포구 동교동','홍대입구역 3번출구','02-0000-0000',50);

UPDATE rentaloffice SET phonenumber='02-666-6666' WHERE placename='홍대입구역 8번출구 앞 (신)';
DELETE FROM rentaloffice WHERE placename='홍대입구역 8번출구 앞 (신)';

SELECT * FROM rentaloffice o,bike b
WHERE o.PLACENAME =b.PLACENAME;

SELECT * FROM rentaloffice;

