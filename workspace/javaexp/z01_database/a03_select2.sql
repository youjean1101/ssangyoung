/*
 # null 데이터 처리
 1. 데이터가 할당되지 않는 경우를 의미한다.
 	'', 공백으로 들어간 데이터와 숫자형인 경우 0으로 들어간 데이터와 차이가 있다는 것을 
 	반드시 확인하여야 한다.
 	주의) 눈으로 데이터가 없는 경우와 ''이 들어간 경우가 차이가 나지 않는 경우가 있다. 
 			''은 공백데이터가 입력된 경우고 null은 데이터 자체가 없는 경우를 말한다.
 2. 처리내용
 	1) 조건문 처리 where
 		컬럼명 is null : 해당 컬럼에 데이터가 할당되지 않는 경우
 		컬럼명 is not null : 해당 컬럼에 데이터 할당된 경우
 	2) 함수 처리 nvl
 		nvl(컬럼명, null일 때 나올 데이터)
 		숫자형 nvl(comm, 0)
 		문자형 nvl(ename, '')
 		comm이 숫자유형의 데이터이기에 초기값을 0으로 설정한다.
 		만약에 ''을 넣으면 에러 발생.
 		
 	ps) 주의
 	1. null은 연산 처리가 되지 않기에, 연산 처리나 조건문에 활용할 때 nvl을 활용한다.
 	2. nvl을 활용해서 null데이터에 대한 처리를 할 때, 해당 유형에 맞게 ''(문자열), 0(숫자형)으로 처리하여야 한다.
 		ex) nvl(ename, 0) (X)
 			nvl(comm, '') (X)
 			nvl(''||comm, '') (O) 굳이 쓰고자 한다면 형변환으로 하여 처리한다.
 */
SELECT sal, comm, sal+comm "합산1", sal+nvl(comm,0) "합산2"
FROM emp;
-- 프로그램으로 처리하여 나타날 0과 null을 동일시하여 처리할 경우도 있다.
-- ex) 보너스가 0인 경우와 null인 경우를 제외한 경우 사원명과 급여, 보너스, 급여+보너스를 출력하세요
SELECT ename "사원명", sal "급여", comm "보너스", sal+comm "합산"
FROM emp
WHERE comm IS NOT NULL AND comm !=0;

SELECT ename "사원명", sal "급여", comm "보너스", sal+comm "합산"
FROM emp
WHERE nvl(comm, 0) !=0;
/*
 # distinct
 1. 기본적으로 데이터는 전체 다른 컬럼과 함께 연관 관계에서 데이터를 출력해준다.
 	- 한 열의 데이터를 다른 컬럼과의 관계 속에서 해당 열의 데이터를 출력
 2. 이럴때, 해당 컬럼의 데이터가 중복되는 경우가 많다.
 3. 이러한 중복을 제거해주는 명령어가 distinct이다.
 4. 이것은 하나의 컬럼뿐만 아니라 여러 컬럼에서도 사용된다.
 */
SELECT * FROM emp;
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;
SELECT deptno, job
FROM EMP
ORDER BY deptno;
-- 위 내용을 보면 , 두개의 커럼을 기준으로 중복되는 컬럼이 보인다.
SELECT DISTINCT deptno,job
FROM emp
ORDER BY deptno;
-- distinct를 사용하면 두개 모두가 비교하여 다른 것을 filtering 한다.
/*
# in 구문
1. 데이터는 or조건에 관련된 내용은 해당 조건 중에 참이 하나라도 있으면
	조건에 맞기에 로딩해주는 것을 말한다.
2. 이 때, 하나의 컬럼을 기준으로 많은 or 조건을 효과적으로 처리하기 위해
	in()이라는 구문을 oracle sql에서는 지원한다.
3. 기본 형식
	where 컬럼 in(데이터1, 데이터2, 데이터3)
	: 해당 데이터들이  or 조건으로 데이터가 있을 때, 검색해준다.
	
	ps)
	sql1을 통해서 처리된 데이터를 조건이 맞는 데이터로 다시 sql2로 처리하는 구문에 사용할 때가 있음.
	select * 
	from 테이블
	where 컬럼 in (select 컬럼 from 테이블);
	ex) 각 부서별 최고급여자를 출력하고자 할 때, 위 subquery형태로 활용된다.
 */
SELECT ename, deptno
FROM emp
WHERE deptno =10 OR  deptno=20 OR DEPTNO  =30;
-- 부서번호가 10이거나 20이거나 30인 경우 출력
SELECT ename, deptno
FROM emp
WHERE deptno in(10,20,30);
-- ex) 직책이 'SALESMAN'이거나 MANAGER인 경우에 사원 정보를 출력하세요.
SELECT  * FROM emp
WHERE job IN('SALESMAN','MANAGER');
/*
 # LIKE 연산자를 이용한 KEYWORD 검색
 1. 컬럼에 저장된 문자열 중에 like 연산자에서 지정한 문자 패턴과 부분적으로 
 일치하면 참이되어, 조건문에서 검색되게 하는 것을 말한다.
 ex) 사원명에 'A'라는 문자열을 포함하면 조죄되게 한다.
 	1) 'A'라는 문자가 위치에 상관없이 있기만 하면 검색 : 컬럼명 like '%A%'
 		ex)
 		select *
 		from emp
 		where ename like '%'||'A'||'%';
 		'A' :를 || ||사이에 구분해서 데이터를 처리하여야 한다.
 	2) 'A'로 첫자가 시작되면 검색 : 컬럼명 like 'A%'
 	3) 'A'로 끝나는 검색 : 컬럼명 like '%A'
 	4) 자리수 위치를 정확히 맞추어 포함되면 검색
 		- 3번째 자리에 'A'가 포함되면 검색 : 컬럼명 like '__A%'	
 	ex) 글자수가 4자리이고, 2번째 자리에 A가 포함
 		like '_A__'	
 */
SELECT * FROM emp
WHERE ename LIKE '%A%';

SELECT * FROM emp
WHERE ename LIKE 'A%';

SELECT * FROM emp
WHERE ename LIKE '%N'; -- N으로 끝아면 검색

SELECT * FROM emp
WHERE ename LIKE '__A%'; -- 3번째 자리가 A이면 검색

-- ex1) 직책에 'MAN'이라는 글자가 포함됭 있으면 조회되게 하세요.
SELECT * FROM emp
WHERE job LIKE '%MAN%';
-- ex2) 사원명에 S로 끝나는 데이터
SELECT * FROM emp
WHERE  ename LIKE '%S';
-- ex3) 사원명에 S를 포함하는 글자가 있는 데이터
SELECT * FROM emp
WHERE ename LIKE '%S%';
-- ex4) 사원명이나 직책에 마지막 두번째 글자가 'E'가 들어 가는 데이터를 조회하세요.
SELECT * FROM emp
WHERE ename LIKE '%E_' OR JOB LIKE '%E_';
/*
# 정렬 처리
1. sql 명령문에서 검색된 결과는 테이블에 데이터가 입력된 순서대로 출력
2. 데이터의 출력 순서를 특정 컬럼을 기준으로 오름차순/내림차순으로 정렬하는 경우가 발생한다.
3. 여러 개의 컬럼에 대해 정렬 순서를 지정해서 처리해야 할 경우가 발생한다.
	- 입사일은 오름차순, 급여 기준으로 내림차순
4. 기본적인 정렬 방법
	- 문자값을 알파벳순으로 출력되고, 한글을 가나다라 순으로 출력된다.
	- 숫자값은 가장 작은 값으로부터 출력
	- 날짜는 과정의 날짜에서 최신 날짜순으로 출력된다.
5. 기본 형식
	select * from 테이블 where 조건
	order by 컬럼명1 [asc/desc], 컬럼명2 [/desc] ...
	asc : default 오름차순 정렬(생략가능)
	desc : 역순/ 내림차순 정렬
 */
-- 사원번호를 기준(오름차순/내림차순)으로 사원번호와 이름을 조회
SELECT empno, ename FROM emp
ORDER BY empno desc;
 -- ex1) 입사일을 기준으로 최근에 입사한 사람으로 제일 위로 가장 먼저 입사한 사람을 뒤로 정렬
SELECT * FROM emp
ORDER BY hiredate desc;
 -- ex2) 연봉이 가장 높은 사람부터 가장 낮은 사람으로 정렬
SELECT * FROM emp
ORDER BY sal desc;
-- ex3) 부서번호는 오름차순, 연봉은 내림차순으로 출력되게 처리;
SELECT * FROM emp
ORDER BY deptno, sal desc;


