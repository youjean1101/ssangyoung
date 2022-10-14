package javaexp.a13_database.vo;

public class Person {
	private String name;
	private int age;
	private String loc;
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Person(String name, int age, String loc) {
		super();
		this.name = name;
		this.age = age;
		this.loc = loc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
