--[1단계:코드] *1. 직책별 최저급여의 사원정보(사원명, 직책명, 급여)를 inline view를 통해서 출력하세요. 

SELECT ename, job, j.msal
FROM emp e, (SELECT min(sal) msal
			FROM emp
			GROUP BY job) j
WHERE e.sal = j.msal;
-- 정답
-- 직책별 최저급여
SELECT job, min(sal) msal
FROM emp10
GROUP BY job;

SELECT *
FROM emp e, (	SELECT job, min(sal) msal
				FROM emp10
				GROUP BY job
			) me
WHERE e.job = me.job
AND e.sal = me.msal;
--inline view : 테이블선언 대신에 sql을 통해서 가상의 테이블을 만들어서
--				기존 테이블 또는 다른 inline view를 만들어서 조인을 하여
--				데이터를 처리하는 목적으로 사용된다.


--[1단계:개념] *2. 수정의 기본형식과 SUBQUERY(단일열/다중열) 형식을 예제를 통하여 기술하세요.



--[1단계:코드] 3. EMP10의 3/4분기 최고급여를 7521 사원의 급여로 수정하세요.
SELECT max(sal)
FROM emp10
WHERE to_char(hiredate,'Q')=3;

UPDATE emp10 
	SET sal = (
		SELECT max(sal)
		FROM emp10
		WHERE to_char(hiredate,'Q')=3
		)
WHERE empno = 7521;

SELECT * FROM emp10;

--[1단계:코드] 4. emp10 부서별 최저 급여자를 삭제 처리하세요.
DELETE FROM emp10
WHERE sal in(
		select min(sal)
		FROM emp10
		GROUP BY deptno);
SELECT * FROM emp10;
	
select deptno,min(sal)
	FROM emp10
	GROUP BY deptno;

--[1단계:개념] 5. DB 서버 접속을 위한 프로젝트(자바프로그램단위) 설정할 내용에 대하여 기술하세요.
--			1) jdbc드라미버 다운로드
--			2) 메모리 로딩을 위한 build path설정 : classpath

--[1단계:개념] 6. jdbc는 어떤 역할을 하는지 기술하세요. 
--			각 벤더사(소프트웨어 회사)에서 DB서버를 위해 만들어진 공통 프로그램을 컴파일된 class만 패키지별로 압축해서
--			 지원하는 프로그램을 말한다. java database connection
--			DB 연결시 프로그래밍이나 툴에서 사용한다.
--			@@.jar은 jre 환경이 설정된 곳에서 여러 프로그램을 실행할 수 있다.
--			윈도우 프로그램의 vc++의 exe, bat파일과 유사하다.	

--[1단계:실습] *9. javaexp2프로젝트를 만들어, javaexp2.a01_database 패키지와 
-- A01_Dao.java를 만들어 연결처리하세요.  
--처리한 내용캡쳐하시고, java 소스 코드를 text를 붙여주세요.

