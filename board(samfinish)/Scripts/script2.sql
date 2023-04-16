SELECT * FROM emp;
--mgr = null 최상위 계층조건
SELECT LEVEL, mgr, e.*
FROM emp e
START WITH mgr=7839
CONNECT BY PRIOR empno=mgr;

select * from member200;

--rownum : 데이터를 1부터 리스트 처리,
-- level : 계층형 sql 레벨 처리(답글레벨)
select rownum cnt, LEVEL, b.*
from board b
where 1=1
START WITH refno=0
CONNECT BY PRIOR NO=refno
ORDER siblings BY NO desc; 
-- 최상위 글 desc 포함된 하위글을 바로 나오게 하면서 desc
SELECT * FROM board;

select *
		from (
			select rownum cnt, LEVEL, b.*
			from board b
			where 1=1
			START WITH refno=0
			CONNECT BY PRIOR NO=refno
			ORDER siblings BY NO desc)
		where cnt between 11 and 15;
		
update boardfile
			set fname=#{fname},
				uptdte=sysdate
			where no = #{no};
		
SELECT * FROM boardfile;

SELECT * FROM board;
