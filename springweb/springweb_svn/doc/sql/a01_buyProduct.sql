SELECT * FROM product111;
SELECT * FROM member111;
SELECT * FROM buyinfo111;
CREATE TABLE product111(
	pid varchar2(100) PRIMARY key,
	name varchar2(100),
	price NUMBER,
	rcnt number
);
insert into product111 values(1000,'사과',2000,100);

CREATE TABLE member111(
	mid varchar2(100) PRIMARY KEY,
	pass varchar2(100),
	name varchar2(100),
	auth varchar2(100)
);
CREATE TABLE buyinfo111(
	pid varchar2(100),
	mid varchar2(100),
	bcnt NUMBER,
	buydate date
);
insert into product111 values('1000','사과',2000,100);
insert into product111 values('1001','바나나',4000,200);
insert into member111 values('himan','7777','홍길동','관리자');
insert into member111 values('higirl','8888','홍현아','관리자');
insert into buyinfo111 values('1000','himan',5,sysdate);
SELECT p.*, m.*
FROM product111 p, member111 m, buyinfo111 b
WHERE p.pid = b.pid and m.mid=b.mid;

SELECT p.name pname, price,  m.name, auth, b.bcnt
FROM product111 p, member111 m, buyinfo111 b
WHERE p.pid = b.pid and m.mid=b.mid;



