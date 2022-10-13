package vo;

public class Dept {
	private String dept;
	private String dname;
	private String loc;
	
	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dept(String dept, String dname, String loc) {
		this.dept = dept;
		this.dname = dname;
		this.loc = loc;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
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
