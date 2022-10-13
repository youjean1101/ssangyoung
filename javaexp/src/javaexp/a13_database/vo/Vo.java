package javaexp.a13_database.vo;

import java.util.Date;

	public class Vo {
	
		private int empno;
		private String ename;
		private String job;
		private double sal;
		private double frSal;
		private double toSal;
		private int deptno;
	
	public Vo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Vo(int empno, int deptno) {
		this.empno = empno;
		this.deptno = deptno;
		this.job = job;
		this.sal = sal;
		this.ename = ename;
	}



	public Vo(int deptno,int empno, String ename, String job, double sal) {
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.sal = sal;
		this.deptno = deptno;
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

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public double getFrSal() {
		return frSal;
	}

	public void setFrSal(double frSal) {
		this.frSal = frSal;
	}

	public double getToSal() {
		return toSal;
	}

	public void setToSal(double toSal) {
		this.toSal = toSal;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	

}
