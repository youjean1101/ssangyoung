package javaexp.a13_database.homework;

public class vo_Emp04 {
	private int yy;
	private int mm;
	private String inputdate;
	public vo_Emp04() {
		super();
		// TODO Auto-generated constructor stub
	}
	public vo_Emp04(int yy, int mm) {
		super();
		this.yy = yy;
		this.mm = mm;
	}
	public vo_Emp04(String inputdate) {
		super();
		this.inputdate = inputdate;
	}
	public int getYy() {
		return yy;
	}
	public void setYy(int yy) {
		this.yy = yy;
	}
	public int getMm() {
		return mm;
	}
	public void setMm(int mm) {
		this.mm = mm;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	
}
