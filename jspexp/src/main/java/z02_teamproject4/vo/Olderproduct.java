package z02_teamproject4.vo;

public class Olderproduct {
	private int productno;
	private String productname;
	private String kind;
	private String dealmethod;
	private int price;
	private String sharewhether;
	private String priceoffer;
	private String information;
	private String registdate;
	private String dealstat;
	private String faddressval;
	private String saddressval;
	private String caddressval;
	private String daddressval;
	private String writerid;
	public Olderproduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	//전페 상품정보
	public Olderproduct(int productno, String productname, String kind, String dealmethod, int price,
			String sharewhether, String priceoffer, String information, String registdate, String dealstat,
			String faddressval, String saddressval, String caddressval, String daddressval, String writerid) {
		super();
		this.productno = productno;
		this.productname = productname;
		this.kind = kind;
		this.dealmethod = dealmethod;
		this.price = price;
		this.sharewhether = sharewhether;
		this.priceoffer = priceoffer;
		this.information = information;
		this.registdate = registdate;
		this.dealstat = dealstat;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.writerid = writerid;
	}
	// 찜 상품정보 불러오기
	
	public Olderproduct(int productno) {
		super();
		this.productno = productno;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDealmethod() {
		return dealmethod;
	}
	public void setDealmethod(String dealmethod) {
		this.dealmethod = dealmethod;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSharewhether() {
		return sharewhether;
	}
	public void setSharewhether(String sharewhether) {
		this.sharewhether = sharewhether;
	}
	public String getPriceoffer() {
		return priceoffer;
	}
	public void setPriceoffer(String priceoffer) {
		this.priceoffer = priceoffer;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getDealstat() {
		return dealstat;
	}
	public void setDealstat(String dealstat) {
		this.dealstat = dealstat;
	}
	public String getFaddressval() {
		return faddressval;
	}
	public void setFaddressval(String faddressval) {
		this.faddressval = faddressval;
	}
	public String getSaddressval() {
		return saddressval;
	}
	public void setSaddressval(String saddressval) {
		this.saddressval = saddressval;
	}
	public String getCaddressval() {
		return caddressval;
	}
	public void setCaddressval(String caddressval) {
		this.caddressval = caddressval;
	}
	public String getDaddressval() {
		return daddressval;
	}
	public void setDaddressval(String daddressval) {
		this.daddressval = daddressval;
	}
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
}
