package a01_diexp.z01_vo;
//a01_diexp.z01_vo.CarRacer
public class CarRacer {
	private String name;
	private Car car;
	public CarRacer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarRacer(String name) {
		super();
		this.name = name;
	}
	public void driving() {
		System.out.println("# 자동차 운행 # ");
		System.out.println("카레이서 "+name+"님은");
		if(car!=null) {
			System.out.println("소유차는 "+car.getName()+"이고");
			System.out.println("최고속도는"+car.getMaxSpeed());
		}else {
			System.out.println("소유차가 없습니다.");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
}
