package jspexp.vo;

public class Memberinfo {
	private int userno;
	private String div;
	private String uname;
	private String rrn;
	private String address;
	private String phonenumber;
	private String id;
	private String password;
	public Memberinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Memberinfo(int userno, String div, String uname, String rrn, String address, String phonenumber, String id,
			String password) {
		super();
		this.userno = userno;
		this.div = div;
		this.uname = uname;
		this.rrn = rrn;
		this.address = address;
		this.phonenumber = phonenumber;
		this.id = id;
		this.password = password;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
