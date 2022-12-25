package z02_teamproject4.vo;

public class Olderproduct {
	private int iProductno;
	private String sKind;
	private String sProductname;
	private int iPrice;
	private String sInformation;
	private String sRegistdate;
	private String sDealmethod;
	private String sDealstat;
	private String sSharewhether;
	private String sPriceoffer;
	private String sWriterID;
	public Olderproduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Olderproduct(int iProductno, String sKind, String sProductname, int iPrice, String sInformation,
			String sRegistdate, String sDealmethod, String sDealstat, String sSharewhether, String sPriceoffer,
			String sWriterID) {
		super();
		this.iProductno = iProductno;
		this.sKind = sKind;
		this.sProductname = sProductname;
		this.iPrice = iPrice;
		this.sInformation = sInformation;
		this.sRegistdate = sRegistdate;
		this.sDealmethod = sDealmethod;
		this.sDealstat = sDealstat;
		this.sSharewhether = sSharewhether;
		this.sPriceoffer = sPriceoffer;
		this.sWriterID = sWriterID;
	}
	public Olderproduct(String sKind, String sProductname, int iPrice, String sInformation, String sRegistdate,
			String sDealmethod, String sSharewhether, String sWriterID) {
		super();
		this.sKind = sKind;
		this.sProductname = sProductname;
		this.iPrice = iPrice;
		this.sInformation = sInformation;
		this.sRegistdate = sRegistdate;
		this.sDealmethod = sDealmethod;
		this.sSharewhether = sSharewhether;
		this.sWriterID = sWriterID;
	}
	public Olderproduct(int iProductno) {
		super();
		this.iProductno = iProductno;
	}
	public int getiProductno() {
		return iProductno;
	}
	public void setiProductno(int iProductno) {
		this.iProductno = iProductno;
	}
	public String getsKind() {
		return sKind;
	}
	public void setsKind(String sKind) {
		this.sKind = sKind;
	}
	public String getsProductname() {
		return sProductname;
	}
	public void setsProductname(String sProductname) {
		this.sProductname = sProductname;
	}
	public int getiPrice() {
		return iPrice;
	}
	public void setiPrice(int iPrice) {
		this.iPrice = iPrice;
	}
	public String getsInformation() {
		return sInformation;
	}
	public void setsInformation(String sInformation) {
		this.sInformation = sInformation;
	}
	public String getsRegistdate() {
		return sRegistdate;
	}
	public void setsRegistdate(String sRegistdate) {
		this.sRegistdate = sRegistdate;
	}
	public String getsDealmethod() {
		return sDealmethod;
	}
	public void setsDealmethod(String sDealmethod) {
		this.sDealmethod = sDealmethod;
	}
	public String getsDealstat() {
		return sDealstat;
	}
	public void setsDealstat(String sDealstat) {
		this.sDealstat = sDealstat;
	}
	public String getsSharewhether() {
		return sSharewhether;
	}
	public void setsSharewhether(String sSharewhether) {
		this.sSharewhether = sSharewhether;
	}
	public String getsPriceoffer() {
		return sPriceoffer;
	}
	public void setsPriceoffer(String sPriceoffer) {
		this.sPriceoffer = sPriceoffer;
	}
	public String getsWriterID() {
		return sWriterID;
	}
	public void setsWriterID(String sWriterID) {
		this.sWriterID = sWriterID;
	}
}
