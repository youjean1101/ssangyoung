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

SELECT * FROM board;
insert into board values(
board_seq.nextval,0,'두번째글','내용','마길동',0, sysdate, sysdate); 
/*insert into board values(
board_seq.nextval,#{refno},#{subject},#{content},#{writer},0, sysdate, sysdate); */

SELECT * FROM board WHERE NO=1;
UPDATE board 
	SET readcnt = readcnt+1
WHERE NO =1;
/*
 SELECT * FROM board WHERE NO=${no};
UPDATE board 
	SET readcnt = readcnt+1
WHERE NO =${no} 
 */
