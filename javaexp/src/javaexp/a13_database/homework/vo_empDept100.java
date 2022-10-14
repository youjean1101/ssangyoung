package javaexp.a13_database.homework;

import java.sql.Date;

public class vo_empDept100 {
		private int empno;
		private String ename;
		private String job;
		private int mgr;
		private Date hiredate;
		private String hiredateS;
		private double sal;
		private double comm;
		private int deptno;
		private String dname;
		private String loc;
		public vo_empDept100() {
			super();
			// TODO Auto-generated constructor stub
		}
		public vo_empDept100(int empno, String ename, String job, int mgr, String hiredateS, double sal, double comm,
				int deptno, String dname, String loc) {
		
			this.empno = empno;
			this.ename = ename;
			this.job = job;
			this.mgr = mgr;
			this.hiredateS = hiredateS;
			this.sal = sal;
			this.comm = comm;
			this.deptno = deptno;
			this.dname = dname;
			this.loc = loc;
		}
		
		public int getEmpno() {
			return empno;
		}
		public void setEmpno(int empno) {
			this.empno = empno;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public String getJob() {
			return job;
		}
		public void setJob(String job) {
			this.job = job;
		}
		public int getMgr() {
			return mgr;
		}
		public void setMgr(int mgr) {
			this.mgr = mgr;
		}
		public Date getHiredate() {
			return hiredate;
		}
		public void setHiredate(Date hiredate) {
			this.hiredate = hiredate;
		}
		public double getSal() {
			return sal;
		}
		public void setSal(double sal) {
			this.sal = sal;
		}
		public double getComm() {
			return comm;
		}
		public void setComm(double comm) {
			this.comm = comm;
		}
		public int getDeptno() {
			return deptno;
		}
		public void setDeptno(int deptno) {
			this.deptno = deptno;
		}
		public String getDname() {
			return dname;
		}
		public void setDname(String dname) {
			this.dname = dname;
		}
		public String getLoc() {
			return loc;
		}
		public void setLoc(String loc) {
			this.loc = loc;
		}
		public String getHiredateS() {
			return hiredateS;
		}
		public void setHiredateS(String hiredateS) {
			this.hiredateS = hiredateS;
		}
		
	}
