/*
 # database에서 함수 (function)
 1. sql에서 함수 (주로 내장함수)
 	1) 컬럼의 값이나 데이터 타입이 변경하는 경우를 말한다.
 	2) 숫자 또는 날짜 데이터의 출력 형식이 변경하는 경우이다.
 	3) 하나 이상의 행에 대한 집계(aggregation)를 하는 경우이다.
 	
 2. sql 함수의 유형
 	1) 단일 행 함수 : 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수
 		적용하여 하나의 결과를 반환하는 함수이다.
 		ex) 대문자를 소문자로 변환처리
 	2) 복수 행 함수 : 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩 변환하는 함수
 		여러행의 데이터를 함수를 적용했을 때, 단일 또는 줄어든 결과를 리턴하여 처리할 때, 사용된다
 		ex) 부서별 최소급여
 		10 3000
 		10 3500		deptno, min(sal) ==> 10, 2000
 		10 2000							 20, 1000		
 		20 1000
 		20 1200
 					min(sal) ==> 1000
 		
 3. 단일행 함수
 	1) 데이터 값을 조작하는데 주로 사용된다.
 	2) 행별로 함수를 적용하여 하나의 결과를 반환하는 함수이다.
 	3) 단일행 함수의 종류
 		문자함수(upper, lower, initcap)
 		숫자함수(ceil, trunc, round)
 		날짜함수(add_months)
 		변환함수(묵시적데이터변환/명시적데이터변화 - 문자 ==> 숫자,
 				숫자 ==> 날짜, 날짜 ==> 문자)
 				to_date(), to_number(), to_char()
 		일반함수(nvl, decode)
 			decode(deptno, 10, '인사', 20, '재무', '기타')
 			
 		
 4. 단일행 함수의 사용법
 	select 함수명(컬럼명/데이터, 매개변수1, 매개변수2...)
 			출력된 내용 select 구문에서 처리
 	from 테이블명
 	where 컬럼명 = 함수명(컬럼명/데이터, 매개변수1, 매개변수2...)
 		and 함수(컬럼) = 함수(데이터);
 			where 조건에 의해서 내부적으로 나타날 기준을 설정.
 	select ename
 	from emp
 	where deptno = 7710;
 	select upper(ename) HIHI -- 출력할 내용
 	from emp
 	where lower(ename) = 'hihi'; -- 조건을 처리할 내용
 	HiHi, HIHI, hihi ==> hihi
 */
/*
 # 문자함수
 1. 문자 데이터를 입려가여 문자나 숫자를 결과로 반환하는 함수
 2. 문자 함수의 종류
 	1) 대소문자 변환 함수
 	2) 문자조작 함수
 	3) 문자열 길이 반환 함수
 3. initcap : 문자열의 첫번째 문자만 대문자로 변환 처리함수
 	lower : 문자열 전체를 소문자로 변환
 	upper : 문자열 전체를 대문자로 변환
 */
SELECT * FROM emp;
SELECT ename, INITCAP(ename), LOWER(ename),UPPER(ename)
FROM emp;
-- ex) 함수를 이용하여 다음과 같은 형태로 출력하세요. (이름과 직책)
-- 		The job of [Smith] is a [Clerk]!!!
--		[컬럼]
SELECT 'The job of '||INITCAP(ename)||' is a/an '||INITCAP(job)||'!!!' show
FROM emp;
/*
 # lower(), upper()의 사용
 1. 입력되어 있는 데이터를 대소문자 상관없이 검색을 처리할 때, 활용
 2. 'a'문자로 입력하거나 'A'를 입력하여 검색하더라도 대소문자 상관없이 처리가 필요할 때, 위 함수를 처리한다.
 */
-- o/O를 입력해서 O문자가 포함된 사원명을 검색하고자 할때.
SELECT ename, job
FROM emp
WHERE ename LIKE '%'||upper('o')||'%';
-- 이 때, 등록된 데이터도 소문자가 있는 경우에는 
SELECT ename, job
FROM emp
WHERE upper(ename) LIKE '%'||upper('o')||'%';
-- 조회 조건의 컬럼명도 대문자로 변환 후, 검색하여야 한다.
-- ex) 사원정보 테이블에 직책이 'Man'|'MAN'|'man' 등 여러형식으로 있을 지라도 
--		대소문자 관계없이 키워드 검색되게 할려면 사용하는 sql처리하세요.
SELECT job, ename, lower(job), upper(job)
FROM emp;
SELECT * FROM emp
WHERE lower(job) LIKE '%' || lower('man') ||'%';
/*
 # 문자열 길이 반환
 1. length(데이터/컬럼명) : 입력되는 문자열의 길이(글자수)를 반환하는 함수
 2. lengthb(데이터/컬럼명) : 입력되는 문자열의 바이트를 반환하는 함수
 	한글이나 특수문자는 1글자가 3byte인 경우가 있다.
 	영어와 한글을 글자 수에서 차이가 난다.
 	
 cf) dual : 오라클에서 지원되는 임시가상테이블로 테이스 용으로 한라인에 데이터와 함수의 적용 결과를 확인할 수 있다.
 */
SELECT * FROM dual;
SELECT 15 num01, 16 num02, 15+16 sum01 FROM dual;
SELECT '안녕' str1, '반가워' str2 FROM dual;
SELECT 'hello' 인사1, length('hello') 인사1크기1, lengthb('hello') 인사1크기2,
		'안녕' 인사2, length('안녕') 인사2크기1, lengthb('안녕') 인사2크기2 -- 한글자당 3바이트 먹는걸 보여줌
	FROM dual;
SELECT ename, LENGTH (ename) 사원명길이
FROM emp;
-- ex) 사원 테이블에서 사원명과 직책의 글자 수를 표현하되, 직책이 6이상인 데이터만 출력하세요.
SELECT ename, length(ename) 사원글자수, job, length(job) 직책글자수 
FROM emp
WHERE length(job) >= 6;
/*
 # 기타 문자열 조작함수
 1. concat(문자열1, 문자열2) : 두 문자열을 결합처리한다.
	문자열1 || 문자열2 동일
	concat(concat(문자열1,문자열2),문자열3)
	문자열1 || 문자열2 || 문자열3
 2. substr(문자열데이터, 시작위치, 시작위치의 갯수) :
 	문자열 데이터를 시작위치와 마지막위치를 기준으로 절삭처리하여 사용하는 것을 말한다.
 	index : 0부터 시작하는 경우와 1부터 시작하는 경우로 나누어진다.
 	ex) substr('sql*plus',5,4) ==> plus
 		12345
 		sql*plus
 		다섯번째부터 시작해서 4개의 문자를 추출하여 데이터를 표현한다.
 	ex) 코드성 데이터 - 사번, 주민번호, 학번에는 각각의 위치별로 의미하는 바가 있기 때문에 추출하여 데이터를 활용한다.
 		주민번호의 경우 생년월일을 위치에 따라 추출할 수 있다.
*/
SELECT empno, ename, job, concat(ename, job) "이름과 직책"
FROM emp;
SELECT substr('sql*plus',5,4) "데이터" FROM dual;
SELECT * FROM emp;
-- ex) 사원명과 사원번호를 이어서 표현하고, 직책은 2번째부터 3글자를 추출해서 출력하세요.
SELECT concat(ename,empno) "사원명/사원번호", substr(job,2,3) "직책" -- 1부터 시작(자바는 0부터)
FROM emp;
