DROP TABLE board;
SELECT * FROM board;
create table board(
	no number primary key,
	refno number,
	subject varchar2(200),
	content varchar2(2000),
	writer varchar2(100),
	readcnt number,
	regdte date,
	uptdte date
);
DROP sequence board_seq;
create sequence board_seq
start with 1
minvalue 1
maxvalue 999999
increment by 1;

--sample 데이터 등록
insert into board values(
board_seq.nextval,0,'첫번째글','내용','홍길동',0, sysdate, sysdate);  
  
select * 
from board 
WHERE 1=1
AND subject LIKE '%'||''||'%'
AND writer LIKE '%'||''||'%'
order by regdte desc;

create table boardfile(
							no number,
							fname varchar2(500),
							etc varchar2(500),
							regdte date,
							uptdate date
						);

insert into boardfile values(1,'a01.txt', '파일등록', sysdate, sysdate);
/*
insert into boardfile(board_seq.currval, #{fname}, #{etc}, sysdate, sysdate);
select fname 
from boardfile
where no = #{no}
*/
SELECT * FROM boardfile f, board b
WHERE f.NO=b.no;
SELECT * FROM boardfile f;
select * FROM board;

select fname 
from boardfile
where no = 1;