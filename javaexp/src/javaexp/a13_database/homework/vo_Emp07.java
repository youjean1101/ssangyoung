package javaexp.a13_database.homework;

import java.sql.Date;

public class vo_Emp07 {
	private String ename;
	private int deptno;
	private Date hiredate;
	private int ipmm;
	public vo_Emp07() {
		super();
		// TODO Auto-generated constructor stub
	}
	public vo_Emp07(String ename, int deptno, Date date) {
		super();
		this.ename = ename;
		this.deptno = deptno;
		this.hiredate = date;
	}
	public vo_Emp07(int ipmm) {
		super();
		this.ipmm = ipmm;
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
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getIpmm() {
		return ipmm;
	}
	public void setIpmm(int ipmm) {
		this.ipmm = ipmm;
	}
	
}
