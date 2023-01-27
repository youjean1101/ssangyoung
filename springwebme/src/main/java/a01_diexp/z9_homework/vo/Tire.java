package a01_diexp.z9_homework.vo;
//a01_diexp.z9_homework.vo.Tire
public class Tire {
	private String vendor;
	private int price;
	public Tire() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tire(String vendor, int price) {
		super();
		this.vendor = vendor;
		this.price = price;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
