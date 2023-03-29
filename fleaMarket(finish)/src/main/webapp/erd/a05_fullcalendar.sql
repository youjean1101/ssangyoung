 
DROP TABLE calendar01 CASCADE CONSTRAINTS;	
		create table calendar01(
			title varchar2(100),
			start01 varchar2(50),
			end01 varchar2(50),
			backgroundColor varchar2(20), 
			textColor  varchar2(20)
		);				
--
	INSERT INTO calendar01 values('1째 일정 등록',
			'2023-03-16T09:00:00','2023-03-16T23:00:00', 
			'#0404B4','#FFFF00');
	INSERT INTO calendar01 values('2째 일정 등록',
			'2023-03-17T09:00:00','2023-03-20T23:00:00', 
			'#0404B4','#FFFF00');

		SELECT * FROM calendar01;	
	
DROP SEQUENCE cal01_seq;	
		create sequence cal01_seq
			start with 1
			minvalue 1;
		--#FFFF00   #0404B4
			
		INSERT INTO calendar01 values(cal01_seq.nextval, '첫번째 일정 등록',
			'2023-02-16T09:00:00','2023-02-16T23:00:00', '홍길동','내용',
			'#0404B4','#FFFF00',1,'https://fullcalendar.io/docs/event-display');
		SELECT * FROM calendar01;
	

delete from calendar01;		
	
UPDATE calendar01 
SET TITLE='홍대 플리마켓'
WHERE START01  ='2023-03-24';
     