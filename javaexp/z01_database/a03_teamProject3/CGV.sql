-----------------------------CGV 리뷰 테이블------------------------------------
CREATE TABLE review(
	reviewCode varchar2(15) PRIMARY key,
	userCode varchar2(15) CONSTRAINT review_userCode_fk REFERENCES cgvUser(userCode),
	content varchar2(1000),
	starRating varchar2(30),
	div char(4) CONSTRAINT review_div_ck check(div IN('good','bad')),
	movieCode varchar2(20) CONSTRAINT review_movieCode_fk REFERENCES movie(movieCode)
);

SELECT * FROM review;
DROP TABLE review;

CREATE SEQUENCE reviewCode_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
	
DROP SEQUENCE reviewCode_seq;
SELECT * FROM cgvuser;
SELECT * FROM review;
INSERT INTO review VALUES('review'||reviewCode_seq.nextval,'user5', '강추합니다!!', '★★★', 'good', 'movie5');
INSERT INTO review VALUES('review'||reviewCode_seq.nextval,'user3', '나만 당할수 없다..니가가라 하와이', '★', 'bad', 'movie5');
INSERT INTO review VALUES('review'||reviewCode_seq.nextval,'user4', '와 또보고싶어요','★★★★★', 'good', 'movie3');

SELECT * FROM review
WHERE div='good';

SELECT * FROM review
WHERE div='bad';

UPDATE review
SET content = '재밌다완전재밌다'
where usercode = 'user4'
AND moviecode='movie3';

SELECT * FROM review;
SELECT * FROM cgvuser;
select * FROM movie;

DELETE FROM review
WHERE usercode='user4';

/*
 private String sReviewCode;
 private String sUserCode;
 private String sStarratting;
 private String sGoodandBadDiv;
 provate String sMovieCode;
 */

---------------------------CGV 영화정보 테이블------------------------------------
CREATE TABLE movie(
	movieCode varchar2(100) PRIMARY key,
	title varchar2(300) NOT NULL,
	director varchar2(300),
	actor varchar2(300),
	genre varchar2(100),
	startDate DATE,
	endDate DATE,
	state varchar2(20) CONSTRAINT movie_status_ck check(state IN(NULL,'개봉예정','상영중','상영종료')),
	reserCnt NUMBER
	);

SELECT * FROM movie;
DROP TABLE movie;

SELECT * FROM movie;
SELECT * FROM review;
SELECT * FROM cgvUSER;

SELECT substr(u.id,1,4)||'****' id, m.title, r.content, r.starrating, r.div
FROM movie m,review r, cgvuser u
WHERE m.moviecode = r.moviecode
AND r.usercode= u.usercode
AND r.div='good';

SELECT u.id, m.title, r.content, r.starrating, r.div
FROM movie m,review r, cgvuser u
WHERE m.moviecode = r.moviecode
AND r.usercode= u.usercode
AND r.div='good';

SELECT substr(u.id,1,4)||'****' id, m.title, r.content, r.starrating, r.div
FROM movie m,review r, cgvuser u
WHERE m.moviecode = r.moviecode
AND r.usercode= u.usercode
AND m.title LIKE '%'||'압꾸정'||'%';

SELECT u.id, m.title, r.content, r.starrating, r.div
FROM movie m,review r, cgvuser u
WHERE m.moviecode = r.moviecode
AND r.usercode= u.usercode
AND m.title LIKE '%'||'압꾸정'||'%';

SELECT u.id, m.title, r.content, r.starrating, r.div
FROM movie m,review r, cgvuser u
WHERE m.moviecode = r.moviecode
AND r.usercode= u.usercode;
AND id = 'yujin';

CREATE SEQUENCE movieCode_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 10000;
	
DROP SEQUENCE movieCode_seq;

INSERT INTO movie VALUES('movie'||movieCode_seq.nextval,'블랙 팬서: 와칸다 포에버', '라이언 쿠글러', '레티티아라이트, 다나리구리라, 루피타뇽, 테노치 우에르타', '액션', '2022-11-09', '2023-01-10','상영중', 0);
INSERT INTO movie VALUES('movie'||movieCode_seq.nextval,'자백', '윤종석', '소지섭, 김윤진', '범죄', '2022-10-26', '2022-12-30','상영중', 0);
INSERT INTO movie VALUES('movie'||movieCode_seq.nextval,'리멤버', '이일형', '이성민, 남주혁', '드라마', '2022-10-26', '2022-12-31','상영중', 0);
INSERT INTO movie VALUES('movie'||movieCode_seq.nextval,'극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교', '타카하시와타루', '짱구, 흰둥이, 철수, 짱아, 맹구', '액션', '2022-09-28', '2022-11-30','상영중', 0);
INSERT INTO movie VALUES('movie'||movieCode_seq.nextval,'압꾸정', '임진순', '마동석, 정경호, 오나라, 최병모', '코미디', '2022-11-30', '2023-02-28','개봉예정', 0);
delete from movie where moviecode='movie14';
--영화코드검색
SELECT * FROM movie ORDER BY moviecode;
SELECT * FROM movie
WHERE moviecode='movie0';

SELECT * FROM (
SELECT * FROM movie
ORDER BY resercnt DESC)
WHERE rownum<=5;

SELECT * FROM (
SELECT * FROM bookuser
WHERE overduecnt < 1
AND div = 'user'
ORDER BY rentalcnt DESC)
WHERE rownum<=3;

UPDATE movie 
SET resercnt = '13'
WHERE moviecode='movie5'; -- 예매갯수

UPDATE movie 
SET state = '상영중'
WHERE startdate<=sysdate AND 
enddate>sysdate; --상영중

SELECT * FROM movie ORDER BY moviecode;
UPDATE movie 
SET state = '개봉예정'
WHERE startdate>sysdate AND 
enddate>sysdate; --개봉예정
DELETE FROM movie WHERE moviecode ='movie8';

UPDATE movie 
SET state = '상영종료'
WHERE startdate<sysdate AND 
enddate<sysdate; -- 상영종료

SELECT * FROM movie
WHERE startdate>sysdate AND 
enddate>sysdate; --개봉예정


SELECT * FROM movie
WHERE startdate<=sysdate AND 
enddate>sysdate; -- 상영중

SELECT * FROM movie
WHERE startdate>sysdate AND 
enddate>sysdate; --개봉예정

SELECT * FROM movie
WHERE startdate<sysdate AND 
enddate<sysdate; -- 상영종료

SELECT * FROM movie
WHERE title='자백';
--영화제목검색
SELECT * FROM movie
WHERE title LIKE '%'||'짱구'||'%';
--영화감독검색
SELECT * FROM movie 
WHERE director LIKE '%'||'임진순'||'%';
--영화배우검색
SELECT * FROM movie 
WHERE actor LIKE '%'||'짱구'||'%';
--장르검색
SELECT * FROM movie 
WHERE genre LIKE '%'||'액션'||'%'
ORDER BY moviecode;
--상영중인 영화검색
SELECT * FROM movie;
WHERE status='상영종료';

--영화수정(제목)
UPDATE movie 
SET title = ''
WHERE moviecode = 'movie15';

--영화수정(감독)
UPDATE movie 
SET director = ''
WHERE moviecode = 'movie15';

--영화수정(배우)
UPDATE movie 
SET actor = ''
WHERE moviecode = 'movie15';

--영화수정(장르)
UPDATE movie 
SET genre = ''
WHERE moviecode = 'movie15';

--영화수정(상영시작날짜)
UPDATE movie 
SET startdate= '20221120'
WHERE moviecode = 'movie15';

--영화수정(상영종료날짜)
UPDATE movie 
SET enddate = ''
WHERE moviecode = 'movie15';

---------------------------CGV 사용자정보 테이블----------------------------------
CREATE TABLE cgvUser(
	userCode varchar2(15) PRIMARY key, -- 관리자/사용자에따라 USER/manager붙여도 될듯.
	div varchar2(15) NOT NULL CONSTRAINT cgvUser_div_ck check(div IN('관리자','사용자')),
	name varchar2(30),
	id varchar2(15) NOT NULL CONSTRAINT cgvUser_id_uq UNIQUE,
	password varchar2(15) NOT NULL,
	phoneNum varchar2(30),
	gender char(6) CONSTRAINT cgvUser_gender_ck check(gender IN('남','여')),
	age NUMBER,
	point number
);

SELECT * FROM cgvUser;
DROP TABLE cgvUser;

CREATE SEQUENCE userCode_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
	
DROP SEQUENCE userCode_seq;
SELECT * FROM cgvUser;
DELETE FROM cgvUser WHERE id='goodman' AND password='7777';
INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, '관리자', '홍길동', 'himan', '1234', '010-0000-0000', '남', 24,0);
INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, '사용자', '김길동', 'goodman', '7777', '010-0000-0001', '남', 26,0);
INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, '사용자', '이길동', 'higirl', '1111', '010-0000-0002', '여', 25,0);
INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, '사용자', '신길동', 'goodgirl', '2222', '010-0000-0003', '여', 28,0);

INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, '사용자', '신길동', 'goodgirl', '2222', '010-0000-0003', '여', 28,0);

SELECT * FROM cgvUser WHERE id ='himan' 
AND password ='';

/*
private String usercode;
private String div;
private String name;
private String id;
private String password;
private String phonenum;
private String gender;
private int age;
private double point;
 */

