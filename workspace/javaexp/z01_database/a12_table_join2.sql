/*
# self join
1. 개요
	하나의 테이블 내에 있는 컬럼까지 연결하는 조인이 필요한 경우에 사용된다.
	조인 대상 테이블이 자신 하나라는 것 외에는 equi join과 동일하다.
2. where 절을 사용한 self join
	하나의 테이블에서 두개의 컬럼을 연결하여 equi join
	from 절에서 하나의 테이블에 테이블 별칭지정
	ex) 사원테이블에서 사원번호와 관리자번호는 self join 하여 처리된다.
3. select a.*, b.*
	from 테이블1 a, 테이블2 b
	where a.컬럼1 = b.컬럼2
	 ex) 사원 테이블의 self join 관계에 있는 컬럼
	 empno : 모든 사원의 고유 번호로 key로 식별하여 사용된다.
	 mgr : 해당 사원의 관리자 번호로 위 empno에 등록된 번호이어야 한다.
	 예를 들어 사원번호 7369인 관리자 번호 mgr은 7902인데 이 관리자 번호를 가진 사원은
	 FORD이다. 즉 SMITH의 관리자는 FORD이고, 이것은 empno와 mrg이 self join을 통해서
	 나타난 결과이다.  
*/
SELECT e.empno, e.ename, e.mgr, m.empno, m.ename, 
		e.ename||'의 관리자는 '||m.ename||'이다!' msg
FROM emp e, emp m
WHERE e.mgr = m.empno;
SELECT * FROM emp;
-- ex) 연봉이 @@@인 사원명 @@@의 관리자명은 @@@이고 연봉은 @@@입니다.를 출력하세요.
SELECT * FROM emp m;
SELECT '연봉이 '|| e.sal ||'인 사원명' ||e.ename ||'의 관리자명은 '||m.ename ||'이고 연봉은'||m.sal||' 입니다.'
 msg
FROM emp e, emp m
WHERE e.mgr = m.empno;
-- 기본 예제와 이전에 배웠던 여러가지 구문형태/함수 형태를 복합적으로 활용해서 원하는 정보를 뽑아낼수 있게 해야한다.
