package a01_diexp.z9_homework.vo;

import java.util.List;
// a01_diexp.z9_homework.vo.Car
public class Car {
	private String carName;
	private List<Tire> tlist;
	public Car(String carName) {
		super();
		this.carName = carName;
	}
	public void tireInfo() {
		System.out.println(carName+"의 타이어 정보");
		if(tlist!=null && tlist.size()>0) {
			System.out.println("공급업체\t가격");
			for(Tire t:tlist) {
				System.out.print(t.getVendor()+"\t");
				System.out.print(t.getPrice()+"\n");
			}
		}else {
			System.out.println("타이어 정보가 없습니다.");
		}
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public List<Tire> getTlist() {
		return tlist;
	}
	public void setTlist(List<Tire> tlist) {
		this.tlist = tlist;
	}
}
