--영화리뷰(사용자)--
--삭세
DROP TABLE review;
--table 생성
CREATE TABLE review(
    rcode NUMBER(5) PRIMARY key,
    userno NUMBER, --CONSTRAINT review_userno_fk REFERENCES user0(userno),-- 참조
    rcontent varchar2(500),--500자까지
    separator varchar2(4) CONSTRAINT review_separator_ck CHECK(separator IN('good','bad')),
    movieCode varchar2(100), --CONSTRAINT review_mcode_fk REFERENCES movie(mcode)--참조
    --CONSTRAINT review_pk PRIMARY key(review_rcode) 
    rdate varchar2(20)
);
--squence
CREATE SEQUENCE review_seq 
START WITH 20001
INCREMENT BY 1
MAXVALUE 30000
NOCYCLE 
NOCACHE;

-- squence 데이터 등록
INSERT INTO review(rcode) values(review_seq.nextval);
--삭제 
DELETE FROM review
WHERE rcode=20009;

--확인
SELECT *FROM review;

--sql
/*
 insert into review values(); 
*/

--vo
/*
private int rcode;
private int userno;
private String content;
private String separator;
private int mcode;
*/
----------------------------------------------------------------------------------------
--<관리자>1
--리뷰 코드 갯수 전체 리뷰 횟수 나타냄
SELECT count(rcode)
FROM review;

----------------------------------------------------------------------------------------
--<관리자>2
SELECT mcode,userno, rdate, rcontent
FROM review;

SELECT COUNT(mcode)
FROM review;
----------------------------------------------------------------------------------------









