package javaexp.a13_database.vo;

public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	
	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Dept(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	

	public Dept(String dname, String loc) {
		super();
		this.dname = dname;
		this.loc = loc;
	}
	
	public Dept(int deptno) {
		super();
		this.deptno = deptno;
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
	
	
}
