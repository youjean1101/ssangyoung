/*
# SEQUENCE 
1. 유일한 식별자 데이터를 만들기 위한 객체
2. 기본키 값을 자동으로 생성하기 위하여 일련번호를 생성한다.
	ex) 웹 게시판에 KEY 글 번호를 순서대로 등록할 때, sequence를 활용하면 편리하다.
3. 여러 테이블에서 공유 가능
4. 기본형식
	CREATE SEQUENCE 시퀀스명
		increment by 증가단위
		start with 시작번호
		maxvalue 최대값|nomaxvalue
		minvalue 최소값|noinvalue
		cycle|nocycle - 반복여부 설정
		cache n |nocache -- 속도 개선을 위해 메모리 캐시 시퀀스 수
5. 삭제
	drop sequence 시퀀스명
6. 선언된 sequence 사용
	1) 시퀀스명.nextval : 현재 시퀀스번호 출력 다음 시퀀스 넘버링
	2) 시퀀스명.currval : 현재 시퀀스번호 출력
	
7. Sequence의 목적
 1. 테이블에 고정형 데이터형식의 primary key를 사용할 때, 가장 많이 활용된다.
	ex) 게시판1(남자게시판), 게시판2(여자게시판)
		1				2	3	4
		5 6 7			8	9	10
		board01			board02
	위 내용에 sequence를 만들고
	create sequence seq_01
		insert into board01 value(seq_01.nextval, '내용'...);
		insert into board02 value(seq_01.nextval, '내용'...);
		insert into board01 value(seq_01.nextval, '내용'...);
		insert into board01 value(seq_01.nextval, '내용'...);
 2. 사원번호등 합성적인 코드에 sequence를 만들 때
	단과코드+입학년도+학과코드+일련번호
	H01P040	1000~~
		stud_seq
	insert into student('H01P040'||stud_seq.nextval, 
 3. create sequence 시퀀스명
	increment by 증감
	start with n
	minvalue n
	maxvalue n
	cycle
	cache 2~
	시퀀스명.nextval
	시퀀스명.currval
 4. drop sequence 시퀀스명;
 5. alter sequence 시퀀스명
 	 start with n외에 수정이 가능. - start with를 바꿀려면 drop시키고 다시 생성하여 start with를 지정 처리..
 	 
*/
DROP SEQUENCE seq_01;
CREATE SEQUENCE seq_01
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 20
	CYCLE 
	cache 10; -- cycle엔 캐시메모리가 필요해서 사용해줘야함.

SELECT seq_01.nextval 현재번호, seq_01.currval FROM dual;
--ex1) 시작번호가 1001이고 마지막번호가 9999인 시퀀스
DROP SEQUENCE seq_02;
CREATE SEQUENCE seq_02
	INCREMENT BY 1
	MINVALUE 1001
	MAXVALUE 9999;

SELECT seq_02.nextval 현재번호, seq_02.currval FROM dual;
--ex1) 시작번호가 8888이고 마지막번호가 1000인 시퀀스
DROP SEQUENCE seq_03;
CREATE SEQUENCE seq_03
	INCREMENT BY -1
	START WITH 8888
	MINVALUE 1000
	MAXVALUE 8888;
SELECT seq_03.nextval 현재번호, seq_03.currval FROM dual;
--ex1) 시작번호가 1이고 마지막번호가 50인 5씩 증가되면서 반복처리되는 시퀀스
-- 위 시퀀스 생성 후 seq_01.nextval로 확인 처리
DROP SEQUENCE seq_01;
CREATE SEQUENCE seq_04
	INCREMENT BY 5
	START WITH 1
	MINVALUE 1
	MAXVALUE 50
	CYCLE
	cache 2;
SELECT seq_04.nextval 현재번호, seq_04.currval FROM dual;
-- 위 시퀀스 생성 후 seq_01.nextval로 확인 처리
SELECT * FROM emp;
INSERT INTO emp(empno) values(seq_02.nextval);

