package javaexp.a13_database.homework;

import java.sql.Date;

public class vo_Emp02 {
	private int yy;
	private int cnt;
	private double mxal;
	private int iphiredate;
	public vo_Emp02() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public vo_Emp02(int yy, int cnt, double mxal) {
		super();
		this.yy = yy;
		this.cnt = cnt;
		this.mxal = mxal;
	}

	public vo_Emp02(int iphiredate) {
		super();
		this.iphiredate = iphiredate;
	}

	public int getYy() {
		return yy;
	}

	public void setYy(int yy) {
		this.yy = yy;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public double getMxal() {
		return mxal;
	}

	public void setMxal(double mxal) {
		this.mxal = mxal;
	}

	public int getIphiredate() {
		return iphiredate;
	}

	public void setIphiredate(int iphiredate) {
		this.iphiredate = iphiredate;
	}
	
	
}
