/*
# 데이터 타입의 변환
1. 오라클에서 사용하는 데이터 유형은 함수에 의해서 데이터 타입을 변경할 수 있다.
			날짜
		숫자		문자열
		
2. 형변환 유형
	1) 묵시적 데이터 타입의 변환
		조건문에서 정확하게 해당 type을 맞게 설정하지 않더라도 결과를 검색해주는 경우가 있는데 이것은 오라클 시스템 내부적으로 
		타입을 변환했기 때문이다.
		ex) select * from emp
			where sal>='2000';
			문자열로 '2000'을 입력하더라도 시스템에서 연산을 인식하여 숫자로 자동형 변환 시켜 처리된다.
	2) 명시적 데이터 타입의 변환
		일반적으로 데이터 베이스는 변환함수를 이용하여 데이터 타입을 변환하여 효과적으로 처리한다.
		- *to_char(컬럼/데이터, '변환형식') 숫자/날짜 타입을 문자열로 변환해주는 함수이다.
		- to_number(컬럼/데이터) : 날짜/문자 타입을 숫자로 변환해주는 함수
		- to_date(컬럼/데이터) : 문자/숫자 타입을 날짜로 변환해주는 함수
			입력데이터(문자열)기준으로 날짜형으로 변경해서 처리하고자 할때..
			ex) 2022/01/12 날짜 등록? '2022/01/12' 문자열
				문자열을 날짜형 데이터에 넣을 때, 형식을 지정해서 등록
				to_date('2022-01-12','YYYY-MM-DD')		
	ps) 명시적 타입변환을 통해서 서버의 판단에 무리를 주지않고, index나
		기타 데이터 처리에 효율화를 줄 수 있다.
*/
SELECT * FROM emp WHERE sal >='2000';
SELECT sal + to_number('2000') "합", e.* 
FROM emp e
WHERE sal >= to_number('2000'); -- 명시적 형변환 처리
SELECT ename, hiredate, to_char(hiredate)
FROM emp
WHERE hiredate LIKE '81/12%';

--WHERE to_char(hiredate) LIKE '81/12%';
-- 실제 저장된 데이터는 날짜형이지만, 묵시적 형변환에 의해 문자열로 변환된
-- 형식을 기준으로 검색이 가능하다.
SELECT * FROM emp;
-- ex) 12월에 입사한 사원을 묵시적 형변환에 의해 검색하세요.
SELECT ename, to_char(hiredate)
FROM emp
WHERE hiredate LIKE '%/12%';
SELECT hiredate FROM emp;
-- 정답
SELECT e.*, to_char(hiredate), substr(hiredate,6,2)
FROM emp e
WHERE substr(hiredate,4,2) = '12';
/*
# to_char
1. 날짜/숫자를 원하는 형식으로 데이터를 처리하기 위하여 사용된다.
2. 기본 형식
	to_char(데이터, 출력할 형식)
3. 출력할 형식(날짜)
	1) CC : 세기
	2) YYYY/YYY/YY/Y 년도 표기
	3) AD/A.D : AD/BC 표기
	4) Q : 분기 1~4
	5) MM/MONTH/MON : 월표기
	6) WW/W :연을 주간단위로 표기/월을 주단위로 표기
	7) DDD/DD/D : 날짜 표기
	8) DY/DAY : 요일 표기
	위의 있는 형식에 한글 등 특수문자를 혼합해서 표기할 때는
	'YYYY"년도" MM"월" ' 형식으로 "추가문자열"을 표현한다.
*/
SELECT ename, hiredate, to_char(hiredate,'cc"세기" AD YYYY/MM/DD"/4분기" MM"월" W"째주" DAY') show,
		to_char(hiredate,'CC') "세기",
		to_char(hiredate,'YYYY') "년도",
		to_char(hiredate,'Q') "분기",
		to_char(hiredate,'MM') "월",
		to_char(hiredate,'DD') "일"
FROM emp;
-- ex) @@@(사원명)은 @@년 @@월에 @@/4 분기에 입사했습니다.
SELECT ename||'은 '||to_char(hiredate,'YY"년" MM"월에 " Q"/4 분기"')||' 입사했습니다.' show
FROM emp;
-- ex2) 1/4분기에 입사한 사원의 이름과 입사년월일을 출력하세요.
SELECT ename, to_char(hiredate,'YYYY/MM/DD Q"/4분기"') "입사년월일"
FROM emp
WHERE to_char(hiredate,'Q') = '1';
/*
# data 타입의 시간 표시 형식
1. AM/PM : 오전/오후 시간 표시
2. A.M/P.M : 오전/오후 시간 표시
3. HH/HH12 : 시간표시(1~12)
4. HH24 : 24표시 (0~24)
5. MI : 분
6. SS : 초
 */
SELECT sysdate,to_char(sysdate,'AM HH:MI:SS') "시간" FROM dual;
-- ex) sysdate를 활용해서 현재 시간을 @@시 @@분 @@초 (24시) 표시형태로 출력하세요.
SELECT SYSDATE,to_char(sysdate,'HH24"시 " MI"분 " SS"초"') FROM dual;
SELECT * FROM emp;
/*
 # 숫자형 데이터를 문자열 형식으로 변환처리
 1. 기본 형식 : to_char(숫자형데이터, '형식')
 2. 주요 형식
 	 해당 자리수 이상의 데이터가 처리 될 때는 ###으로 표시된다.
 	 9999 : 기본 자리수에 맞게 처리
 	 0000 : 해당 자리수이할 일때는 0으로 채워짐
 	 $ : 앞에 $표기 처리
 	 . : 특정한 자리의 소숫점 표기
 	 , : 특정한 위치에 ,를 표기

==> DB ------> 			   java(프로그램 연동)
	문자열(숫자형, 날짜형) ===> String 
	Date ===> Date
 	 * 	 */
SELECT ename, sal, to_char(sal,'99999') "형식1",
		to_char(sal,'00000') "형식2",
		to_char(sal,'$99999') "형식3",
		to_char(sal,'9,999') "형식4",
		to_char(sal,'9,999.999') "형식5",
		to_char(sal*10000,'9,999.999') "형식6"
FROM emp;
-- ex) 사원명, 급여, 급여2(천단위 콤마 앞에 $표기, 소숫점1자리 표기)
SELECT ename, sal, to_char(sal,'$9,999.9') 급여2
FROM emp;

 
 
 
