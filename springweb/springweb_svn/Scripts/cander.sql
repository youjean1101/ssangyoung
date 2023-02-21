create table calendar01(
	id number primary key,
	title varchar2(100),
	start01 varchar2(50),
	end01 varchar2(50),
	writer varchar2(50),
	content varchar2(500),
	backgroundColor varchar2(20), --#343243
	textColor varchar2(20),
	allDay number(1),
	url varchar2(500)
);
create sequence cal01_seq
	start with 1
	minvalue 1;
DROP SEQUENCE cal_seq;
	--#FFFF00 #0404B4
INSERT INTO calendar01 values(cal01_seq.nextval, '첫번째 일정 등록',
'2023-02-16T09:00:00','2023-02-16T23:00:00', '홍길동','내용','#0404B4','#FFFF00',
1,'https://fullcalendar.io/docs/event-object');
INSERT INTO calendar01 values(cal01_seq.nextval, '세번째 일정 등록',
'2023-02-18T09:00:00','2023-02-19T11:00:00', '김길동','내용2','#0404B4','#FFFF00',
1,'https://fullcalendar.io/docs/event-object');
INSERT INTO calendar01 values(cal01_seq.nextval, '네번째 일정 등록',
'2023-02-20T09:00:00','2023-02-22T11:00:00', '김길동','내용2','#0404B4','#FFFF00',
0,'https://fullcalendar.io/docs/event-object');

SELECT * FROM calendar01;
-- 과제
create table calen2(
	id number primary key,
	title varchar2(100),
	start01 varchar2(50)
);
create sequence calen2_seq
	start with 1
	minvalue 1;
DROP SEQUENCE cal_seq;
	--#FFFF00 #0404B4
INSERT INTO calen2 values(calen2_seq.nextval, '첫번째 일정 등록',
'2023-02-16T09:00:00');

SELECT * FROM calen2;
SELECT * FROM calendar01;

update calendar01
			set title = '일정변경',
				start01 = '2023-02-20T09:00:00',
				end01 = '2023-02-20T15:00:00',
				writer = '변길동',
				content = '내용변경',
				textcolor = '#0099cc',
				backgroundcolor = '#ccffff',
				allday = '0',
				url = 'https://www.naver.com'
			where id = 16;