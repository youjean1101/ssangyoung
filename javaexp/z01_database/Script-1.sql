SELECT * FROM emp10;
insert INTO emp10(empno) values(9002);
-- transaction 기능에 의해 commit하기 전에 rollback에 의해 원복가능
-- commit 전에 접속종료나 외부에 다른 곳에서 계정 접속하면 dml
-- 처리가 되지 않는 것을 확인할 수 있다.