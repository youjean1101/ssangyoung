package springweb.z01_vo;
//springweb.z01_vo.Member 
public class Member {
	
	
/*
create table member(
	id varchar2(100),
	pass varchar2(100),
	name varchar2(100),
	auth varchar2(100),
	point number,
	address varchar2(100)
);
insert into member values('himan','7777','홍길동','admin',1000,'서울');

 * */	
	
	
	private String id;
	private String pass;
	private String name;
	private String auth;
	private int point;
	private String address;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String name, String auth) {
		this.name = name;
		this.auth = auth;
	}

	public Member(String id, String pass, String name, String auth, int point, String address) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.address = address;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
