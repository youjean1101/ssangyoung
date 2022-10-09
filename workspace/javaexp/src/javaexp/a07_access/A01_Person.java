package javaexp.a07_access;
// 1. class명 앞에 public
// 		선언시 호출하는 곳에서 접근 여부 확인
//		A01_Person p01;
public class A01_Person {
	// 2. 필드는 접근제어자를 private
	private String name;
	private int age;
	private String loc;
//	3. 생성자의 접근제어자는 객체 생성시 영향을 미친다.
//	p01 = new A01+Person();
//	public이 아닐시에는 객체 생성을 외부 패키지에서 생성을 하지 못한다.
	public A01_Person(String name, int age, String loc) {
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


	public A01_Person() {
		// TODO Auto-generated constructor stub
	}
	
	
}
