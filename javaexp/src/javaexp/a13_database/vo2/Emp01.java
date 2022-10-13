package javaexp.a13_database.vo2;

public class Emp01 {
	private int deptno;
	private String ename;
	private String job;
	private double sal;
	
	public Emp01() {
		super();
	}
	
	public Emp01(int deptno, String ename, String job, double sal) {
		super();
		this.deptno = deptno;
		this.ename = ename;
		this.job = job;
		this.sal = sal;
	}
	
	public int getDeptno() {
		return deptno;
	}
	
	public void setDeptno(int deptno) {
		this.deptno = deptno;
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
	
}
