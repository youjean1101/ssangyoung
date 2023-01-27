package a01_diexp.z04_vo;

import org.springframework.beans.factory.annotation.Autowired;

//a01_diexp.z01_vo.CarRacer
public class CarRacer {
	private String name;
	@Autowired
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
	// 컨테이너의 id와 메서드의 property가 동일할 때, 해당 객체 할당 하는 것 byName
	public void setCar03(Car car) {
		this.car = car;
	}
	
}
