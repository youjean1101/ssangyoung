-- 과제 : DB 환경 설정 부분 ppt자료로 만들어 제출하세요
--2022-09-27
--[1단계:개념] 1. select의 sql의 전체형식의 내용을 예제와 함께 기술하세요.
--[1단계:코드] 2. 급여가 (3000이상 이거나 2000미만)이고  부서명이 30이 아닌 데이터를 검색하세요.
SELECT * FROM emp
WHERE (sal>=3000 OR sal<2000) AND deptno<>30;
--[1단계:개념] 3. 비교연산자 중에 부정연산자인 경우 3가지를 기술하세요.
--[1단계:코드] 4. 사원명과 관리자번호(mgr)- null인 경우 0으로 출력
SELECT nvl(ename,0),nvl(mgr,0) FROM emp;

--[1단계:코드] 5. null이 아닌 경우만 중복되지 않는 관리자번호를 출력하세요
SELECT DISTINCT mgr FROM emp
WHERE mgr IS NOT NULL;
--[1단계:개념] 6. IN 구문과 OR 구문의 차이점을 예제를 통해서 기술하세요
--[1단계:개념] 7. keyword 검색의 형식을 예제를 통해서 기술하세요.
--[1단계:코드] 8. [키워드검색]사원명이 두번째 글짜가 A이거나 직책이 MAN을 끝나는 데이터를 조회하세요.
SELECT * FROM emp
WHERE ename LIKE '_A%' OR job LIKE '%MAN'; 
--[1단계:개념] 9. 대소문자 상관없이 조건을 입력했을 때, 검색 처리되는 여러가지 형식을 함수를 통해 기술하세요
--[1단계:개념] 10. 한글과 영문의 길이의 차이를 검색하는 함수의 기능을 기술하세요
--[1단계:개념] 11. substr() 함수의 기본 기능을 기술하세요.
--[1단계:코드] 12. dual 함수를 이용하여 임의의 주민번호를 substr()처리하여 @@년@@월@@일생이라고 출력하세요.
SELECT substr(951101,1,2)"년" ,substr(951101,3,2)"월" ,substr(951101,5,2) "일생" 
FROM dual;
--[1단계:코드] 13. [함수검색]사원명에 A가 포함되어 있는 데이터의 함수와 검색위치를 출력하세요
SELECT ename, INSTR(ename,'A')  
FROM emp
WHERE INSTR(ename,'A')<>0; 