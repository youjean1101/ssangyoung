SELECT * 
FROM emp;
-- ex1) 부서를 조건으로 부서번호, 사원명, 직책명, 급여를 출력하세요
-- sql ==> vo ==> 기능메서드 선언(A04_DaoExp.java)
-- sql 작성완료 손들기

SELECT deptno, ename, job, sal
FROM EMP
WHERE deptno = 10;
-- vo 작성완료 손들기 select : List<Vo>, where : 매개변수
-- type와 이름
/*
private int deptno; -- deptno는 where로 조건이 정해져있어서 생략가능.
private String ename;
private String job;
private Double sal;

 리턴값은 select ==> Vo ==> List<Vo>
	 매개변수는 where ==>  Vo/int
	 public List<Emp01> getSch01(Emp01 sch){
	 
	 }
	 public List<Emp01> getSch01(int deptno){
	 	List<Emp01> list = new ArrayList<Emp01>();
	 	return list;
	 }
*/
-- 사원명(키워드검색), 급여(시작~끝)으로 조건으로
-- 사원번호, 사원명, 급여를 출력하세요.
SELECT empno, ename, sal
FROM emp
WHERE ename LIKE '%'||'A'||'%'
AND sal BETWEEN 1000 AND 2000;
/* -- select, where
private int empno;
private String ename;
private double sal;
private int frSal;
private int toSal;

기능메서드
1. 리턴유형
2. 매개변수
private List<Emp02> getSch02(Emp02 sch){
	List<Emp02> list = new ArrayList<Emp02>();
	
	return list;
}
ex) 직책(키워드검색) 또는 부서번호를 조건으로 사원번호, 사원명, 직책명, 부서번호를 검색하세요.
	1) sql 작성 손들기
	2) vo 작성
	3) 기능메서드 작성
*/
SELECT empno, ename, job, deptno
FROM emp
WHERE job LIKE '%'||''||'%'
OR deptno = 10;

/*
 select 
 where
private int empno;
private String ename;
private String job;
private int deptno;
 */
-- ex) dept 와 조건을 통해서 부서명(키워드)와 분기별 조건으로 부서명, 사원명, 입사일, 급여를 출력하세요.
-- 1) sql
SELECT dname, ename, hiredate, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND dname LIKE '%'||''||'%'
AND to_char(hiredate,'Q')= 2 ;
-- 2) vo
/*
 private String dname;
 private String ename;
 private date hiredate;
 private double sal;
 */
-- 3) 기능메서드
SELECT deptno, ename, job, sal
FROM EMP
WHERE deptno = 10;
/*
 ResultSet : 조회 결과의 데이터를 가지고 있다.
 1. next() : 행단위로 이동
 2.get타입("컬럼명"), get타입(1) 1부터 select의 순서대로
 	while(rs.next()){ 데이터가 있을 때까지 이동
 		rs.getInt("empno")
 		rs.getString("ename")
 		rs.getString(3)
 		rs.getDouble(4)
 	}
 3. 위 반복 프로세스에서 리턴으로 선언한 객체에 단위 데이터를 입력(생성자)하고
 	Emp e = new Emp(rs.getInt("empno"), rs.getString("ename"),
 			rs.getString(3), rs.getDouble(4))
 4. List<Emp>에 하나씩 반복문을 통해서 담기
 		list.add(e);
 		
 */
SELECT * FROM emp;
SELECT * FROM dept;
create table emp100
as select * from emp;
SELECT * FROM emp100;
alter table emp100
modify (
	job varchar2(50),
	ename varchar2(50),
	empno number(4) primary key
	);
-- sequence 만들기(primary key 설정)
create sequence emp100_seq
		start with 1000
		minvalue 1000
		maxvalue 9999;		
	
insert into emp100 
values(emp100_seq.nextval, '홍길동', '사원', 7800,
to_date('2022/01/01','YYYY/MM/DD'), 3500, 100, 10);

SELECT * FROM emp100;

CREATE TABLE dept100
AS SELECT * FROM dept;
ALTER TABLE dept100
modify(
	dname varchar2(50),
	loc varchar2(50)
);
SELECT * FROM dept100;
-- A03_DeptDao.java에 추가 기능 메서드 처리.
-- 1. sql : insert into dept10 values(11,'인사','서울')
DELETE FROM dept100
WHERE dname = '회계';

INSERT INTO dept100
values(11,'인사','서울');

-- 2. vo

-- 3. public void insertDept(Dept ins){

-- }

CREATE TABLE person(
	name varchar2(50),
	age NUMBER,
	loc varchar2(50)
);
SELECT * FROM person;
DELETE FROM person WHERE name = '홍길동';
INSERT INTO person values('홍길동',25,'서울 신림');
/*
1. Vo
class Person{
private String name;
private int age;
private String loc;
}

2. 메서드 정의
public void insertperson(Person ins){}

3. main() 추가 처리 

4. DB로 확인
A04_DaoExp.java
 */

