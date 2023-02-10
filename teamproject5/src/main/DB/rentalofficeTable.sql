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
INSERT INTO rentaloffice values('스타벅스(동교동) 앞 (신)','동교동 159-1 ','상진빌딩 앞','02-0000-0000',20);
INSERT INTO rentaloffice values('아만티호텔 앞 (신)','서울 마포구 월드컵북로','31','02-0000-0000',60);
INSERT INTO rentaloffice values('신한은행 서교동지점 (신)','서울 마포구 양화로','111','02-0000-0000',30);
INSERT INTO rentaloffice values('서교동사거리(신) (신) ','서울 마포구 서교동','사거리','02-0000-0000',15);

UPDATE rentaloffice SET phonenumber='02-666-6666' WHERE placename='홍대입구역 8번출구 앞 (신)';
DELETE FROM rentaloffice WHERE placename='홍대입구역 8번출구 앞 (신)';

SELECT * FROM rentaloffice o,bike b
WHERE o.PLACENAME =b.PLACENAME;

SELECT * FROM rentaloffice;

