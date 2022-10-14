package javaexp.a13_database.homework;

import java.sql.Date;

public class vo_member100 {
	private String id;
	private String passwd;
	private String name;
	private String auth;
	private int point;
	private String makedate;
	public vo_member100() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public vo_member100(String id, String passwd) {
		super();
		this.id = id;
		this.passwd = passwd;
	}
	
	public vo_member100(String id, String passwd, String name, String auth, int point, String makedate) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.makedate = makedate;
	}
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
	public String getMakedate() {
		return makedate;
	}
	public void setMakedate(String makedate) {
		this.makedate = makedate;
	}
	
}
