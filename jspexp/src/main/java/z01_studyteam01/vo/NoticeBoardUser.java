package z01_studyteam01.vo;

public class NoticeBoardUser {
	private String sId;
	private String sPassword;
	private String sName;
	private String sEmail;
	private String sPhonNumber;
	public NoticeBoardUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeBoardUser(String sId, String sPassword, String sName, String sEmail, String sPhonNumber) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sName = sName;
		this.sEmail = sEmail;
		this.sPhonNumber = sPhonNumber;
	}
	public NoticeBoardUser(String sId, String sPassword) {
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
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	public String getsPhonNumber() {
		return sPhonNumber;
	}
	public void setsPhonNumber(String sPhonNumber) {
		this.sPhonNumber = sPhonNumber;
	}
	
	
}
