package javaexp.a07_access;

// 클래스명을 일반적으로 public 접근제한
// VO(value oject)
// 하나의 class를 하나의 파일로 생성
public class A01_Product {
	
	// 필드(저장소)는 일반적으로 외부에서 직접적으로 접근하지 못하게 하고, 
	// 간접적으로 기능 메서드에 의해 저장 처리(생성자, 메서드를 통해서)
	// 직접접근 pro.name="사과" (X)
	// 간접접근 pro.setName("사과"); (O)
	private String name;
	private int price;
	private int cnt;
	// 생성자도 일반적으로  public
	
	public A01_Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	A01_Product(String name){} 
	public A01_Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
	