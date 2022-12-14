package jspexp.vo;

public class Member {
	private String id;
	private String passwd;
	private String name;
	private String auth;
	private int point;
	private String address;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String passwd, String name, String auth, int point, String address) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.address = address;
	}
	public Member(String id, String name, String auth, int point) {
		super();
		this.id = id;
		this.name = name;
		this.auth = auth;
		this.point = point;
	}
	
	public Member(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	/*
	 * public Member(String name, String auth) { super(); this.name = name;
	 * this.auth = auth; }
	 */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}	
}
