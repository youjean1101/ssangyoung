--[1단계:코드] 1. salgrade 테이블 전체를 조회하고, 해당 컬럼을 조회해보세요.
--				- losal과 hisal의 범위(가격)를 100단위로 절삭해서 출력하세요.
SELECT * FROM salgrade;
SELECT grade,round(losal,-2) || '원' 최저시급, round(hisal,-2) || '원' 최고시급 FROM salgrade;
--[1단계:개념] 2. lpad, rpad의 기본형식과 예제를 기술하세요
--[1단계:코드] 3. 사원명을 10자리 기준 '&'는 왼쪽에, 직책명을 10자리기준 '!' 오른쪽으로 덧붙여 설정하여 출력하세요.
SELECT ename, job, LPAD(ename,10,'&'), RPAD(job, 10,'!')  
FROM emp;
--[1단계:개념] 4. trim 처리 함수 3가지를 기술하고, 해당 옵션에 대하여 기술하세요.
--[1단계:개념] 5. 숫자형 함수에서 소숫점 이하에 대한 처리를 예제와 함께 기술하세요.
--[1단계:코드]* 6. 급여를 부서번호(10==> 10%, 20==> 20%..)기준으로 인상을 하기로 했다.
--         현재 급여와 인상된 급여를 처리하되 100자리 단위로 절삭하여, 사원명과 함께 출력하세요.
/* 부서번호를 기준으로 % 처리 했으므로, %는 실제데이터는 1/100이므로, /100으로 연산 처리
 * 인상분은 현재 급여 *부서번호/100으로 처리
 * 최종급액은 급여 + (인상분)
 * 100자리단위로 절삭은 trunc(금액,-2)
 */
SELECT ename 사원명,deptno 부서명, sal 현재급여, sal*(deptno/100) 인상비용, trunc(sal+sal*(deptno/100),-2) 인상된급여
FROM emp;
-- 정답
SELECT ename, sal 현재급여, deptno||'%' 인상율, deptno/100, 
			(sal*deptno/100) 인상액,
			sal+(sal*deptno/100) "인상급여(최종)",
			trunc(sal+(sal*deptno/100),-2) "100자리절삭"
FROM emp;
--[1단계:코드] 7. 사번을 기준으로 홀수인 경우 급여기준으로 보너스를 50% 추가하여 급여를 계산하기로 했다.
--         이름, 사번, 구분, 급여, 총급여   를 출력하세요.
SELECT * FROM emp;
SELECT  ename 이름, empno 사번,mod(empno,2) 구분, sal 급여,sal+sal*0.5 총급여
FROM emp
WHERE mod(empno,2)=1;

--[1단계:개념] 8. 날짜 처리 단위별(초,분,시,일) 정리하고 예제를 dual 테이블로 나타내세요.
SELECT sysdate 현재시간, sysdate+((1/60)/60)/24 초,sysdate+(1/60)/24 분,sysdate+1/24 시, sysdate+1 일
FROM dual;
--[1단계:개념] 9. 날짜형 함수의 종류에 대하여 기술하세요.
--[1단계:코드]* 10. 사원명과 함께 근무연한을 @@년 @@개월 @@일이라고 표시하세요. (여러가지 중첩 함수 이용)
SELECT 	ename 사원명,hiredate 입사일,sysdate 현재시간,
		floor(MONTHS_BETWEEN(sysdate,hiredate)) 총개월수,
		floor(SYSDATE-HIREDATE) 총일수,
		floor(MONTHS_BETWEEN(sysdate,hiredate)/12) 년,
		MOD(floor(MONTHS_BETWEEN(sysdate,hiredate)),12) 개월,
		mod(floor(SYSDATE-HIREDATE),12) 일,
		floor(MONTHS_BETWEEN(sysdate,hiredate)/12) ||'년' ||
		MOD(floor(MONTHS_BETWEEN(sysdate,hiredate)),12) || '개월' ||
		mod(floor(SYSDATE-HIREDATE),12)|| '일' "@@년@@개월@@일"
FROM emp;
-- 정답
/* 1. 전체근무개월수 현재일과 입사일을 차를 통해 도출 : floor(months_between(sysdate, hiredate))
 * 2. 근무 연한 계산 위 근무개월수를 /12로 처리
 * 			floor(months_between(sysdate, hiredate)/12)
 * 3. 연도를 제외한 근무 개월수 위 전체 근무개월수를 mod(전체근무개월수, 12)
 * 			mod(floor(months_between(sysdate, hiredate)),12)
 * 4. 연도/근무개월수를 제외한 날짜계산
 * 			전체 근무개월수 : 나머지 날짜를 뺀 순수한 개월수만 처리한 데이터
 * 			그러므로 해당 개월수에 날짜는 나머지 일수가 포함되어 있지 않다.
 * 		식의 도출과정
 * 			1) 전체개월수 산정(현재일과 입사일) :  floor(months_between(sysdate, hiredate))
 * 			2) 입사일로부터 전체개월 수 : 남은 날짜를 제외한 개월수에 대한 날짜를 처리
 * 				==> add_months(현재날짜, 전체개월수)
 * 
 * 				2021/09/14 : 입사를 했으면, 
 * 				months_between(sysdate, hiredate) ==> 12.5...
 * 				현재날짜가 2022/09/29
 * 				나머지날짜를 구할려면 일단, 월단위로 처리되는 날짜(2022/09/14) 를 먼저 구하고
 * 				sysdate - 구한날짜 : 실제 나머지 근무일수가 처리.
 * 					sysdate - add_months(2021/09/14, 개월수)
 * 					현재날	  2022/09/29
 * 			3) 현재날짜와 위 남은 날짜가 포함되지 않는 날짜를 빼주면 
 * 				근무연도/근무월을 뺸 나머지 날짜를 도출할 수 있다.
 */
SELECT 	ename, 
		floor(months_between(sysdate, hiredate)) "전체개월수",
		floor(months_between(sysdate, hiredate)/12) "근무연한",
		mod(floor(months_between(sysdate, hiredate)),12) "월",
		ADD_MONTHS(hiredate, floor(months_between(sysdate, hiredate))) "날짜1",
		floor(sysdate - 
				ADD_MONTHS(hiredate, 
					floor(months_between(sysdate, hiredate)))) "날짜2"
FROM emp;
-- 위와 같이 연산된 내용이 중복적으로 복잡한 내용은 inlineView라는 개념으로 효과적으로 처리될 수 있다.
/*
 SELECT *
 FROM (
 	sql을 통해 가상의 테이블 데이터 생성
 );
 */
SELECT ename,	
	floor(mm/12)||'년 '||mod(mm,12)||'개월 '||
	floor(sysdate - add_months(hiredate, mm))||'일' "근무기간"
FROM (
		SELECT ename, hiredate, floor(months_between(sysdate, hiredate)) MM
		FROM emp
);
--[1단계:코드] 11. @@월 @@째 수요일 등을 미국에서 쓰이는 공휴일 처리 방식인, 한국의 선거일의 경우 
--			임기종료 @@주째 전 수요일같이 날짜를 요일에 대한 날짜를 계산할 때 사용된다.
--         	오늘로 부터 3개월 후 해당월의 3번째 수요일을 출력하세요.
SELECT sysdate 오늘, ADD_MONTHS(SYSDATE,3) "3개월후",
		NEXT_DAY(NEXT_DAY(NEXT_DAY(ADD_MONTHS(SYSDATE,3),'수'),'수'),'수') "3번째수요일" 
FROM dual;
--[1단계:코드]* 12. 사원의 첫급여일이 다음달 첫 날로 지정하였다. 급여일과 입사월의 근무일수를 출력하세요..
SELECT  HIREDATE 입사일, LAST_DAY(HIREDATE)+1 급여일, 
		 floor((LAST_DAY(HIREDATE)+1)-hiredate) 근무일수
FROM emp;
-- 정답 
--	ex) +1 : ex) 12/31 입사일이면 1일근무 1/1 급여일
SELECT ename,hiredate,
		LAST_DAY(hiredate)+1 "급여일",
		LAST_DAY(hiredate)+1-hiredate "근무일수"
FROM emp;