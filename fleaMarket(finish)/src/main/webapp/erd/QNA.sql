DROP TABLE FLEAMARKETQNA;
DROP TABLE qnafile;
CREATE TABLE FLEAMARKETQNA(
	qnaNo varchar2(100) NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	regDate  varchar2(100),
	uptDate varchar2(100),
	email varchar2(50) NOT NULL,
	method char,
	category varchar2(100),
	status varchar2(100),
	refno varchar2(100),
	secretwhether char,
	PRIMARY KEY (qnaNo));

DROP SEQUENCE FLEAMARKETQNA_seq;
CREATE SEQUENCE FLEAMARKETQNA_seq 
      increment by 1
      start with 1
      nocache
      MINVALUE 0
      MAXVALUE 100000;

INSERT INTO FLEAMARKETQNA values(
FLEAMARKETQNA_seq.nextval,
#{title},#{content},
to_CHAR(sysdate,'YYYY-MM-DD'),
to_CHAR(sysdate,'YYYY-MM-DD'),
#{email},#{method},
#{category});

INSERT INTO FLEAMARKETQNA values(
0,
'0','0',
to_CHAR(sysdate,'YYYY-MM-DD'),
to_CHAR(sysdate,'YYYY-MM-DD'),
'이메일','j',
'j','-',null,'j');

DELETE fleamarketqna;

SELECT * FROM FLEAMARKETQNA f ;

ALTER TABLE FLEAMARKETQNA MODIFY status varchar2(100);

SELECT * FROM FLEAMARKETQNA;
SELECT * FROM FLEAMARKETMEMBER;
SELECT * FROM PROFILE p ;
SELECT * FROM FLEAMARKETQNA WHERE QNANO = FLEAMARKETQNA_seq.currval;

UPDATE FLEAMARKETQNA SET QNANO =0 WHERE EMAIL ='admin@contigo.com';

UPDATE FLEAMARKETQNA SET REFNO  =0 WHERE qnano=160;
ALTER TABLE FLEAMARKETQNA ADD Secretwhther char;
------------------------------------------------------------------
CREATE TABLE QNAFile
(
	FileName varchar2(100),
	filePath varchar2(200),
	qnaNo varchar2(100) NOT NULL,
	filename2 varchar2(100)
);
SELECT * FROM qnafile;
INSERT INTO qnafile values(FLEAMARKETQNA_seq.currval,'file/qna/','20');
DELETE FLEAMARKETQNA WHERE qnano=54;




SELECT qna.* FROM
(SELECT rownum cnt,f.* FROM fleamarketqna f
WHERE f.METHOD != 'n'
and (title || email) LIKE '%'||''||'%'
ORDER BY cnt ASC) qna WHERE cnt BETWEEN 2 AND 4;

--공지사항
SELECT * FROM FLEAMARKETQNA
WHERE METHOD = 'n';
-- 전체글 갯수
SELECT count(*) FROM FLEAMARKETQNA
WHERE METHOD != 'n'
AND (title || EMAIL) LIKE '%'||''||'%';
--삭제
DELETE ;

SELECT * FROM FLEAMARKETQNA
WHERE METHOD = 'n'
ORDER BY qnano DESC;


SELECT qna.* FROM
(SELECT rownum cnt,level,f.* FROM fleamarketqna f
WHERE 1=1
AND f.METHOD != 'n'
and (title || email) LIKE '%'||''||'%'
START with refno=0
CONNECT BY PRIOR qnano=refno
ORDER siblings BY qnano DESC) qna
WHERE cnt BETWEEN 1 AND 3;

INSERT INTO FLEAMARKETQNA VALUES(FLEAMARKETQNA_seq.nextval,'RE:실험테스트','답변드립니다. 꺼지세요','2023-03-07','2023-03-07','관리자','a','유저신고','-','31');

SELECT rownum cnt,level,f.* FROM fleamarketqna f
WHERE 1=1
AND f.METHOD != 'n'
and (title || email) LIKE '%'||''||'%'
START with refno=0
CONNECT BY PRIOR qnano=refno
ORDER siblings BY cnt ASC


select *
from(
select rownum cnt, level, b.*
from board b
where 1=1
and subject like '%'||#{subject}||'%'
 and writer like '%'||#{writer}||'%'   
START with refno=0
 CONNECT BY PRIOR NO=refno
ORDER siblings BY NO desc)
where cnt between #{start} and #{end}

DELETE FLEAMARKETQNA WHERE qnano='41';


SELECT count(*) FROM QNAFILE q;




SELECT qna.*,qf.qfilecnt FROM
(SELECT rownum cnt,level,f.* FROM fleamarketqna f
WHERE 1=1
AND f.METHOD != 'n'
and (title || email) LIKE '%'||''||'%'
START with refno=0
CONNECT BY PRIOR qnano=refno
ORDER siblings BY qnano DESC) qna,
(SELECT qnano,count(*) qfilecnt FROM qnafile GROUP BY QNANO) qf
WHERE qna.qnano = qf.qnano(+)
and cnt BETWEEN #{START} AND #{END}
ORDER BY cnt;

 ;