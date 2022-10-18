SELECT * FROM dept100;

DROP TABLE dept100;

CREATE TABLE DEPT100
AS SELECT * FROM dept;

ALTER TABLE dept100
MODIFY (dname varchar2(50), loc varchar2(50));

SELECT * FROM dept100
WHERE dname LIKE '%'|| 'O' ||'%'
AND loc LIKE '%'|| 'N' ||'%';

/*
SELECT * FROM dept100
WHERE dname LIKE '%'|| ? ||'%'
AND loc LIKE '%'|| ? ||'%';
*/
INSERT INTO dept100 values(11,'회계','서울'); 
DELETE FROM dept100 WHERE dname ='마케팅팀';