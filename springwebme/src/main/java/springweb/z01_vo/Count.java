package springweb.z01_vo;

public class Count {
	private int startNum;
	private int step;
	public Count() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Count(int startNum, int step) {
		super();
		this.startNum = startNum;
		this.step = step;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	
}
