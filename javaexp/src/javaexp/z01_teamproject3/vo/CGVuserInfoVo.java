package javaexp.z01_teamproject3.vo;

public class CGVuserInfoVo {
	private String sUsercode;
	private String sDiv;
	private String sName;
	private String sId;
	private String sPassword;
	private String sPhonenum;
	private String sGender;
	private int iAge;
	private double dPoint;
	public CGVuserInfoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CGVuserInfoVo(String sUsercode, String sDiv, String sName, String sId, String sPassword, String sPhonenum,
			String sGender, int iAge, double dPoint) {
		super();
		this.sUsercode = sUsercode;
		this.sDiv = sDiv;
		this.sName = sName;
		this.sId = sId;
		this.sPassword = sPassword;
		this.sPhonenum = sPhonenum;
		this.sGender = sGender;
		this.iAge = iAge;
		this.dPoint = dPoint;
	}
	public CGVuserInfoVo(String sDiv, String sName, String sId, String sPassword, String sPhonenum, String sGender,
			int iAge) {
		super();
		this.sDiv = sDiv;
		this.sName = sName;
		this.sId = sId;
		this.sPassword = sPassword;
		this.sPhonenum = sPhonenum;
		this.sGender = sGender;
		this.iAge = iAge;
	}
	public CGVuserInfoVo(String sId, String sPassword) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
	}
	public String getsUsercode() {
		return sUsercode;
	}
	public void setsUsercode(String sUsercode) {
		this.sUsercode = sUsercode;
	}
	public String getsDiv() {
		return sDiv;
	}
	public void setsDiv(String sDiv) {
		this.sDiv = sDiv;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
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
	public String getsPhonenum() {
		return sPhonenum;
	}
	public void setsPhonenum(String sPhonenum) {
		this.sPhonenum = sPhonenum;
	}
	public String getsGender() {
		return sGender;
	}
	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	public int getiAge() {
		return iAge;
	}
	public void setiAge(int iAge) {
		this.iAge = iAge;
	}
	public double getdPoint() {
		return dPoint;
	}
	public void setdPoint(double dPoint) {
		this.dPoint = dPoint;
	}
}
