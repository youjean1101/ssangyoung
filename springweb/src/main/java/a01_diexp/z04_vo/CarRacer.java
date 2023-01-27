package a01_diexp.z04_vo;

import org.springframework.beans.factory.annotation.Autowired;

// a01_diexp.z01_vo.CarRacer
public class CarRacer {
	//CarRacer(name, Car)
	private String name;
	@Autowired
	private Car car;
	public CarRacer() {
	}
	public void driving() {
		System.out.println("# 자동차 운행 #");
		System.out.println("운행자:"+name);
		if(car!=null) {
			System.out.println("자동차명:"+car.getName());
			System.out.println("최고속도:"+car.getMaxSpeed());
		}else {
			System.out.println("차가 없네요");
		}
	}
	
	public CarRacer(String name) {
		this.name = name;
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
