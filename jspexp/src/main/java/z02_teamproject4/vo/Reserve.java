package z02_teamproject4.vo;

public class Reserve {
	private String rno;
	private String date;
	private int sugprice;
	private String reservation;
	private String id;
	private int productno;
	public Reserve() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reserve(String rno, String date, int sugprice, String reservation, String id, int productno) {
		super();
		this.rno = rno;
		this.date = date;
		this.sugprice = sugprice;
		this.reservation = reservation;
		this.id = id;
		this.productno = productno;
	}
	public Reserve(String date, int sugprice, String reservation, String id, int productno) {
		super();
		this.date = date;
		this.sugprice = sugprice;
		this.reservation = reservation;
		this.id = id;
		this.productno = productno;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getSugprice() {
		return sugprice;
	}
	public void setSugprice(int sugprice) {
		this.sugprice = sugprice;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
}
