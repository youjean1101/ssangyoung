package z02_teamproject4.vo;

public class Cartlist {
	private int productno;
	private String id;
	public Cartlist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cartlist(int productno, String id) {
		super();
		this.productno = productno;
		this.id = id;
	}
	public Cartlist(int productno) {
		super();
		this.productno = productno;
	}
	public Cartlist(String id) {
		super();
		this.id = id;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
