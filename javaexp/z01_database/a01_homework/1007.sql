/*
# 다음 내용을 모두 포함하는 데이터베이스를 설계하세요.
(설계-erd + 테이블 생성-제약사항포함 + 데이터 입력)
1. 회사는 네 개의 부서를 운영한다. 부서는(부서번호, 부서이름)을 저장한다.
2. 부서는 1명 이상의 직원(직원번호, 직원이름, 직책)을 두고 있다. 각 직원은 하나의
	부서에 소속된다.
3. 직원은 부양가족(이름, 나이)이 있을 수 있다.
4. 각 직원은 근무했던 부서에 대한 근무 기록(기간, 직책)이 있다.
~ 월 18:00
**/
CREATE TABLE department(
		departno varchar2(8) PRIMARY KEY,
		name varchar2(20) CONSTRAINT department_name_nn NOT null);
SELECT * FROM department;	

-- DELETE FROM department WHERE name='인사팀';
INSERT INTO department values('A1000000','기획팀');
INSERT INTO department values('A1000001','제작팀');
INSERT INTO department values('A1000002','개발팀');
INSERT INTO department values('A1000003','경영지원팀');
SELECT * FROM department;
	
CREATE TABLE employee(
	employeeno varchar2(10) PRIMARY KEY,
	name varchar2(30) CONSTRAINT employee_name_nn NOT null,
	emposition varchar(30) CONSTRAINT employee_emposition_nn NOT null);
SELECT * FROM employee;

-- DELETE FROM employee WHERE name = '이길동';
INSERT INTO employee values('AB900000','홍길동','사원');
INSERT INTO employee values('AB900001','마길동','사원');
INSERT INTO employee values('AC900002','김길동','대리');
INSERT INTO employee values('AD900003','이길동','과장');
SELECT * FROM employee;

CREATE TABLE dapemp(
	departno CONSTRAINT dapemp_departno_fk REFERENCES department(departno),
	employeeno CONSTRAINT dapemp_employeeno_fk REFERENCES employee(employeeno));
SELECT * FROM dapemp;

INSERT INTO dapemp values('A1000000','AB900000');
INSERT INTO dapemp values('A1000001','AB900001');
INSERT INTO dapemp values('A1000002','AC900002');
INSERT INTO dapemp values('A1000003','AD900003');
DELETE FROM dapemp WHERE departno = 'A1000000';
SELECT * FROM dapemp;

CREATE TABLE dependents(
	employeeno CONSTRAINT dependents_employeeno_fk REFERENCES employee(employeeno) CONSTRAINT dependents_employeeno_uq UNIQUE,
	name char(20),
	age NUMBER);
SELECT * FROM dependents;

INSERT INTO dependents values('AD900003','이길준',89);
INSERT INTO dependents values('AC900002','홍기순',98);
SELECT * FROM dependents;

CREATE  TABLE workrecord(
	employeeno CONSTRAINT workrecord_employeeno_fk REFERENCES employee(employeeno) CONSTRAINT workrecord_employeeno_uq UNIQUE,
	period DATE,
	recordpositon varchar2(30));
SELECT * FROM workrecord;

--DELETE FROM workrecord WHERE employeeno = 'AB900000';
INSERT INTO workrecord values('AD900003','20150809','대리');
INSERT INTO workrecord values('AB900001','20201231','사원');
INSERT INTO workrecord values('AC900002','20170705','사원');
INSERT INTO workrecord values('AB900000','20211111','사원');
SELECT * FROM workrecord;



