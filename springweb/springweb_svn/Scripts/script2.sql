create table filerep(
	no number,
	title varchar2(100),
	path varchar2(500),
	tempfile varchar2(100),
	fname varchar2(100),
	etc varchar2(200),
	regdte date,
	uptdate date
);
create sequence file_seq
	start with 1000
	minvalue 1000;
insert into filerep values(file_seq.nextval,'첨부파일', '경로..',
							'file'||file_seq.currval
							,'a01.txt','',sysdate,sysdate);
select * from filerep
where title like '%'||''||'%';

select * from filerep;

insert into filerep values(file_seq.nextval,'첨부파일', '경로..',
							'file'||file_seq.currval
							,#{fname},#{content},sysdate,sysdate);
select * from filerep
