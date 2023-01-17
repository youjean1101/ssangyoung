package a01_diexp.z9_homework.vo;
// a01_diexp.z9_homework.vo.BusDriver
//a01_diexp.z9_homework.vo.Bus
public class BusDriver {
	private String name;
	private Bus busName;
	
	public BusDriver() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusDriver(String name) {
		super();
		this.name = name;
	}
	public void busInfo() {
		System.out.println(name+"님이 모시는 버스정보");
		if(busName!=null) {
			System.out.println(busName.getName()+"의 버스");
			System.out.println("시작점:"+busName.getStart());
			System.out.println("종착점:"+busName.getEnd());
		}else {
			System.out.println("버스 정보가 없습니다.");
		}
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Bus getBusName() {
		return busName;
	}
	public void setBusName(Bus busName) {
		this.busName = busName;
	}
	public void setBus01(Bus busName) {
		this.busName = busName;
	}
	
}
