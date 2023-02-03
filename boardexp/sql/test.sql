create table boardexp(
	bno number primary key,
	title varchar2(200),
	writer varchar2(100),
	rcnt number,
	credte date
);
DROP TABLE boardexp;
SELECT * FROM boardexp;
DROP sequence boardexp_seq;
create sequence boardexp_seq
start with 1
minvalue 1
maxvalue 999999
increment by 1;

insert into boardexp values(
boardexp_seq.nextval,'첫번째글','홍길동',0, sysdate);  
  
select * 
from boardexp 
WHERE 1=1
AND bno LIKE '%'||''||'%'
order by credte desc;