package springweb.z01_vo;

public class Salgrade {
	private String grade;
	private double losal;
	private double hisal;
	public Salgrade() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Salgrade(String grade, double losal, double hisal) {
		super();
		this.grade = grade;
		this.losal = losal;
		this.hisal = hisal;
	}
	public Salgrade(String grade) {
		super();
		this.grade = grade;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public double getLosal() {
		return losal;
	}
	public void setLosal(double losal) {
		this.losal = losal;
	}
	public double getHisal() {
		return hisal;
	}
	public void setHisal(double hisal) {
		this.hisal = hisal;
	}	
}
