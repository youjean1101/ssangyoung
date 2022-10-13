package javaexp.a13_database.homework;

public class vo_Emp01 {
	private String ename;
	private String dname;
	private double sal;
	private int grade;
	private int losal;
	private int hisal;
	private String div;
	
	public vo_Emp01() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public vo_Emp01(String ename, String dname, double sal, int grade) {
		super();
		this.ename = ename;
		this.dname = dname;
		this.sal = sal;
		this.grade = grade;
	}

	public vo_Emp01(String dname, String div) {
		super();
		this.dname = dname;
		this.div = div;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getLosal() {
		return losal;
	}

	public void setLosal(int losal) {
		this.losal = losal;
	}

	public int getHisal() {
		return hisal;
	}

	public void setHisal(int hisal) {
		this.hisal = hisal;
	}

	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}
	
	
	
	
}
