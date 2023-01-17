package a01_diexp.z9_homework.vo;
// a01_diexp.z9_homework.vo.Bus
public class Bus {
	private String name;
	private String start;
	private String end;
	public Bus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bus(String name, String start, String end) {
		super();
		this.name = name;
		this.start = start;
		this.end = end;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
