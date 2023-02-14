SELECT * FROM emp;
--mgr = null 최상위 계층조건
SELECT LEVEL, mgr, e.*
FROM emp e
START WITH mgr=7839
CONNECT BY PRIOR empno=mgr;

select * from member200;

--rownum : 데이터를 1부터 리스트 처리,
-- level : 계층형 sql 레벨 처리(답글레벨)
select b.*
from board b
where 1=1;
-- 계층적 sql은 통해서 답글이 원래글 밑에
/* 계층적 sql
 	START WITH refno=0 : 계층 트리의 최상위 부분 설정
	CONNECT BY PRIOR NO=refno : 계층 트리를 처리하는 조건
 */
select rownum cnt, LEVEL, b.*
from board b
where 1=1
START WITH refno=0
CONNECT BY PRIOR NO=refno;

select rownum cnt, LEVEL, b.*
from board b
where 1=1
START WITH refno=0
CONNECT BY PRIOR NO=refno
ORDER siblings BY NO desc; -- 역순위 처리
-- level : 계층형 sql을 사용하는 것으로 공백 간격을 계층 레벨에 따라 처리하기 위한 내용이다.
-- 최상위 글 desc 포함된 하위글을 바로 나오게 하면서 desc

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

merge into boardfile  a
	     using (SELECT '${fname}' fname, ${no} NO, '${etc}' subject  FROM dual) b
	        on (a.no = b.no)
	      when matched then    
		update set fname = b.fname,
				uptdte = sysdate
		  when not matched then
			insert values(b.no, 
					b.fname,b.subject,sysdate,sysdate);
/*
# 동적 query와 preparedstatment 처리 mapping 데이터
1. 동적 query
	sql을 임의로 만들 때, 사용한다.
	mybatis에서는 ${동적데이터}
	sql "%"+검색데이터+"%"
		select ename "+alias+"
		where 1=1 "
		if(ename!=null)
		sql += "ename='홍길동'"
		
		
2. preparedstatment 처리 mapping 데이터
	컬럼명을 지정한 입력데이터일 때, 사용된다.
	#{매핑할 데이터}
	sql where ename = ?
	 
-- #{컬럼}*/
SELECT '파일명' fname, 25 NO, '내용' subject  FROM dual;
merge into boardfile  a
	     using (SELECT '${fname}' fname, ${no} NO, '${etc}' subject 
	     		FROM dual) b
	        on (a.no = b.no);
-- dao의 매개변수를 통해 넘겨온 데이터와 boardfile 테이블의 내용을 비교해서
-- 해당 no번호가 있으면 update 처리가 없으면 insert 처리
/*
 	uploadFile(upt.getReport());
	BoardFile f = new BoardFile();
	f.setNo(upt.getNo());
	f.setFname(fname);
	f.setEtc(upt.getSubject());
	dao.uptBoardFile(f);
 */