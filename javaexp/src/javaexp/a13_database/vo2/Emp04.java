package javaexp.a13_database.vo2;

import java.sql.Date;

public class Emp04 {
	 private String dname;
	 private String ename;
	 private Date hiredate;
	 private double sal;
	 private String div;
	 
	public Emp04() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp04(String dname, String ename, Date hiredate, double sal) {
		super();
		this.dname = dname;
		this.ename = ename;
		this.hiredate = hiredate;
		this.sal = sal;
	}
	public Emp04(String dname, String div) {
		super();
		this.dname = dname;
		this.div = div;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
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
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	 
	 
}
