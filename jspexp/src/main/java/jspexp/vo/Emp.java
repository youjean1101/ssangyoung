package jspexp.vo;
//jspexp.vo.Emp
import java.util.Date;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private String hiredateS;
	private double sal;
	private double frSal;
	private double toSal;
	private double comm;
	private int deptno;
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 등록시 사용할 생성자..
	public Emp(String ename, String job, int mgr, String hiredateS, double sal, double comm, int deptno) {
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredateS = hiredateS;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}
	
	public Emp(int empno, String ename, int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.deptno = deptno;
	}

	// ename,  sal deptno
	public Emp(String ename, double sal, int deptno) {
		this.ename = ename;
		this.sal = sal;
		this.deptno = deptno;
	}	
	
	public Emp(int empno, String ename, double sal) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
	}

	public Emp(int empno, String ename, double sal, int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
		this.deptno = deptno;
	}

	// 검색1  
	public Emp(String ename, String job, double frSal, double toSal) {
		this.job = job;
		this.ename = ename;
		this.frSal = frSal;
		this.toSal = toSal;
	}

	// 조회리스트시 필요한 생성자
	public Emp(int empno, String ename, String job, 
			int mgr, Date hiredate, double sal,
			double comm, int deptno) {
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}
	public Emp(String ename, String job) {
		this.ename = ename;
		this.job = job;
	}
	
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
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
	
	public String getHiredateS() {
		return hiredateS;
	}

	public void setHiredateS(String hiredateS) {
		this.hiredateS = hiredateS;
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
	
}
