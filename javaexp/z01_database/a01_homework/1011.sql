--[1단계:코드] 1. 직책별 최저급여의 사원정보(사원명, 직책명, 급여)를 inline view를 통해서 출력하세요. 

SELECT ename, job, j.msal
FROM emp e, (SELECT min(sal) msal
			FROM emp
			GROUP BY job) j
WHERE e.sal = j.msal;


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
--[1단계:실습] 9. javaexp2프로젝트를 만들어, javaexp2.a01_database 패키지와 
-- A01_Dao.java를 만들어 연결처리하세요.  
--처리한 내용캡쳐하시고, java 소스 코드를 text를 붙여주세요.

