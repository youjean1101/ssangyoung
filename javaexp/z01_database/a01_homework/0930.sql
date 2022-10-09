--2022-09-30
--[1단계:개념] 1. 그룹함수의 기본형식을 예제를 통해 설명하세요 
--[1단계:개념] 2. 그룹함수의 종류를 기술하세요.
--[1단계:코드] 3. 직책별 가장에 최근에 입사한 사원의 입사일을 출력하세요.
SELECT job,max(hiredate) FROM emp
GROUP BY job;
--[1단계:코드] 4. 직책별 평균급여가 2000이상인 경우를 출력하세요.
SELECT job,round(avg(sal)) FROM emp
GROUP BY job
HAVING avg(sal)>=2000;

--[1단계:코드] 5. 월별로 가장 급여가 낮은 급여를 출력하세요.
SELECT to_char(hiredate,'MM"월"') 월별, min(sal) 가장낮은급여
FROM emp
GROUP BY to_char(hiredate,'MM"월"')
ORDER BY 월별;
--[1단계:코드] 6. 사원번호가 짝수/홀수를 청/홍팀으로 나누고 청/홍팀 평균급여와 사원수를 출력하세요.
SELECT decode(mod(empno,2), 1, '홍' ,0, '청') "청/홍", round(avg(sal)) 평균급여,count(*) 사원수
FROM emp
GROUP BY decode(mod(empno,2), 1, '홍' ,0, '청');
--[1단계:코드] 7. 분기별, 입사 사원수의 수가 2명이상인 분기기준으로 분기 별의 최고 급여를 출력하세요.
SELECT to_char(hiredate,'Q') 분기, count(*) "사원수(2명이상)", max(sal) 최고급여
FROM emp
GROUP BY to_char(hiredate,'Q')
HAVING count(*)>=2
ORDER BY 분기;
--[1단계:개념] 8. 테이블의 조인의 기본 형식을 기술하세요.
--[1단계:코드] 9. 입사일이 2~5월 사이인 사원의 부서명, 사원명, 입사일을 출력하세요
SELECT dname 부서명, ename 사원명, hiredate 입사일
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND 2<=to_char(hiredate,'MM') AND 5>=to_char(hiredate,'MM');

--[1단계:코드] 10. 1/4분기에 입사하고, 연봉이 1000이상인 사원의 사원명, 
--      입사일, 입사분기, 부서명, 부서위치를 출력하세요
SELECT ename 사원명, hiredate 입사일, to_char(hiredate, 'Q') 입사분기, dname 부서명, e.deptno 부서위치, sal 연봉
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND to_char(hiredate, 'Q')=1 
AND	sal>=1000;
--[1단계:코드] 11. 부서위치(LOC)별, 최고 급여가 2000이상인 경우를 출력하세요.
SELECT loc, max(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY loc
HAVING max(sal)>=2000;