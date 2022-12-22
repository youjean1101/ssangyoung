package z02_teamproject4.vo;
///z02_teamproject4.vo.*
public class User {
	private String sId;
	private String sPassword;
	private String sDiv;
	private String sProfileimg;
	private String sUsername;
	private String sPhonenumber;
	private String sBirthday;
	private String sGender;
	private String sAddress;
	private String sDetailaddress;
	private String sEmail;
	private int iPoint;
	private int iSalecount;
	private int iBuycount;
	private int iDeclarationcount;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	 //전체필드
	public User(String sId, String sPassword, String sDiv, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail, int iPoint,
			int iSalecount, int iBuycount, int iDeclarationcount) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sDiv = sDiv;
		this.sProfileimg = sProfileimg;
		this.sUsername = sUsername;
		this.sPhonenumber = sPhonenumber;
		this.sBirthday = sBirthday;
		this.sGender = sGender;
		this.sAddress = sAddress;
		this.sDetailaddress = sDetailaddress;
		this.sEmail = sEmail;
		this.iPoint = iPoint;
		this.iSalecount = iSalecount;
		this.iBuycount = iBuycount;
		this.iDeclarationcount = iDeclarationcount;
	}
	//회원가입필드
	public User(String sId, String sPassword, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sProfileimg = sProfileimg;
		this.sUsername = sUsername;
		this.sPhonenumber = sPhonenumber;
		this.sBirthday = sBirthday;
		this.sGender = sGender;
		this.sAddress = sAddress;
		this.sDetailaddress = sDetailaddress;
		this.sEmail = sEmail;
	}
	// 회원변경 필드
	public User(String sId, String sPassword, String sProfileimg, String sPhonenumber, String sBirthday, String sGender,
			String sAddress, String sDetailaddress, String sEmail) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sProfileimg = sProfileimg;
		this.sPhonenumber = sPhonenumber;
		this.sBirthday = sBirthday;
		this.sGender = sGender;
		this.sAddress = sAddress;
		this.sDetailaddress = sDetailaddress;
		this.sEmail = sEmail;
	}
	public User(String sId, String sPassword) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsPassword() {
		return sPassword;
	}
	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}
	public String getsDiv() {
		return sDiv;
	}
	public void setsDiv(String sDiv) {
		this.sDiv = sDiv;
	}
	public String getsProfileimg() {
		return sProfileimg;
	}
	public void setsProfileimg(String sProfileimg) {
		this.sProfileimg = sProfileimg;
	}
	public String getsUsername() {
		return sUsername;
	}
	public void setsUsername(String sUsername) {
		this.sUsername = sUsername;
	}
	public String getsPhonenumber() {
		return sPhonenumber;
	}
	public void setsPhonenumber(String sPhonenumber) {
		this.sPhonenumber = sPhonenumber;
	}
	public String getsBirthday() {
		return sBirthday;
	}
	public void setsBirthday(String sBirthday) {
		this.sBirthday = sBirthday;
	}
	public String getsGender() {
		return sGender;
	}

	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}
	public String getsDetailaddress() {
		return sDetailaddress;
	}
	public void setsDetailaddress(String sDetailaddress) {
		this.sDetailaddress = sDetailaddress;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	public int getiPoint() {
		return iPoint;
	}
	public void setiPoint(int iPoint) {
		this.iPoint = iPoint;
	}
	public int getiSalecount() {
		return iSalecount;
	}
	public void setiSalecount(int iSalecount) {
		this.iSalecount = iSalecount;
	}
	public int getiBuycount() {
		return iBuycount;
	}
	public void setiBuycount(int iBuycount) {
		this.iBuycount = iBuycount;
	}
	public int getiDeclarationcount() {
		return iDeclarationcount;
	}
	public void setiDeclarationcount(int iDeclarationcount) {
		this.iDeclarationcount = iDeclarationcount;
	}
}
