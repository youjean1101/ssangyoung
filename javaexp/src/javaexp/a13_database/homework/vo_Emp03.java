package javaexp.a13_database.homework;

public class vo_Emp03 {
	private String ename;
	private int empno;
	private int div;
	private double sal;
	private double bonus;
	private double totsal;
	
	public vo_Emp03() {
		super();
		// TODO Auto-generated constructor stub
	}

	public vo_Emp03(String ename, int empno, int div, double sal, double bonus, double totsal) {
		super();
		this.ename = ename;
		this.empno = empno;
		this.div = div;
		this.sal = sal;
		this.bonus = bonus;
		this.totsal = totsal;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getDiv() {
		return div;
	}

	public void setDiv(int div) {
		this.div = div;
	}

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public double getBonus() {
		return bonus;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}

	public double getTotsal() {
		return totsal;
	}

	public void setTotsal(double totsal) {
		this.totsal = totsal;
	}
}
