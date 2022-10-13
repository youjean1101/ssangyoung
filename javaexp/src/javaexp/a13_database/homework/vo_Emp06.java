package javaexp.a13_database.homework;

public class vo_Emp06 {
	private String mgrname;
	private String ename;
	private int deptno;
	private double sal;
	public vo_Emp06() {
		super();
		// TODO Auto-generated constructor stub
	}
	public vo_Emp06(String mgrname, String ename, int deptno, double sal) {
		super();
		this.mgrname = mgrname;
		this.ename = ename;
		this.deptno = deptno;
		this.sal = sal;
	}
	public vo_Emp06(String ename) {
		super();
		this.ename = ename;
	}
	public String getMgrname() {
		return mgrname;
	}
	public void setMgrname(String mgrname) {
		this.mgrname = mgrname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	
}
