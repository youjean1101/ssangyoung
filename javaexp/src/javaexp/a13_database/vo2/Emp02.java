package javaexp.a13_database.vo2;

public class Emp02 {
	private int empno;
	private String ename;
	private double sal;
	private int frSal;
	private int toSal;
	public Emp02() {
		
		// TODO Auto-generated constructor stub
	}
	// 조회리턴할 내용
	public Emp02(int empno, String ename, double sal) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
	}
	// 조건 매개변수
	public Emp02(String ename, int frSal, int toSal) {
		super();
		this.ename = ename;
		this.frSal = frSal;
		this.toSal = toSal;
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
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public int getFrSal() {
		return frSal;
	}
	public void setFrSal(int frSal) {
		this.frSal = frSal;
	}
	public int getToSal() {
		return toSal;
	}
	public void setToSal(int toSal) {
		this.toSal = toSal;
	}
}
