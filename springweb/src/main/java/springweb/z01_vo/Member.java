package springweb.z01_vo;

public class Member {
	private String id;
	private String name;
	private String password;
	private String auth;
	private int point;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String name, String password, String auth, int point) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.auth = auth;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
}
