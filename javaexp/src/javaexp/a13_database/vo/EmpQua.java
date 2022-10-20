package javaexp.a13_database.vo;

public class EmpQua {
	private int empno;
	private String ename;
	private String qu;
	private double sal;
	private double frSal;
	private double toSal;
	public EmpQua() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpQua(String qu, double frSal, double toSal) {
		super();
		this.qu = qu;
		this.frSal = frSal;
		this.toSal = toSal;
	}
	public EmpQua(int empno, String ename, String qu, double sal) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.qu = qu;
		this.sal = sal;
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
	public String getQu() {
		return qu;
	}
	public void setQu(String qu) {
		this.qu = qu;
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
}
