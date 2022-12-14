package jspexp.vo;

public class Computer {
	private String maker;
	private int price;
	private String type;
	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Computer(String maker, int price, String type) {
		super();
		this.maker = maker;
		this.price = price;
		this.type = type;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
