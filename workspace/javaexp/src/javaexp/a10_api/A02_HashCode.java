package javaexp.a10_api;

public class A02_HashCode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # hash code로 객체 동등 여부 체크
		 */
		 Person p01 = new Person(); //주소값이 10진수로 나타남.
		 Person p02 = new Person(); 
		 // 상위객체에서 object에서 상속받았기 때문에 주소값이 나옴.(없어도 기본적으로 object 상속)
		 Person p03 = p01;
		System.out.println("p01.hashCode():"+p01.hashCode());
		System.out.println("p02.hashCode():"+p02.hashCode());
		System.out.println("p03.hashCode():"+p03.hashCode());
		// 주소값이 같을 때. 확인..
		Student s1 = new Student(1,"홍길동");
		Student s2 = new Student(1,"홍길동");
		Student s3 = new Student(2,"김길동");
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(s3.hashCode());
		System.out.println("주소값이 같은지 여부 :"+(s1 == s2));
		System.out.println("속성 같은지 여부s1,s2 :"+(s1.hashCode() == s2.hashCode()));
		System.out.println("속성 같은지 여부s1,s3 :"+(s1.hashCode() == s3.hashCode()));
		// ex) Product로 물건명 가격을 설정하고, 
//				hashCode를 재정의하여 값이 동일할 때 true로 처리되게 하세요.
		Product p1 = new Product("헤드폰", 300000);
		Product p2 = new Product("이어폰", 17000);
		Product p3 = new Product("헤드폰", 300000);
		System.out.println("속성 같은지(물건/가격) :"+(p1.hashCode() == p2.hashCode()));
		System.out.println("속성 같은지(물건/가격) :"+(p3.hashCode() == p1.hashCode()));
		
		Product pro01 = new Product("사과",3000);
		Product pro02 = new Product("바나나",4000);
		Product pro03 = new Product("바나나",4000);
		System.out.println(pro01.hashCode());
		System.out.println(pro02.hashCode());
		System.out.println(pro03.hashCode());
		System.out.println(pro02.hashCode()==pro03.hashCode());
	}	
}
class Product{
	private String proName;
	private int proPrice;
	public Product(String proName, int proPrice) {
		this.proName = proName;
		this.proPrice = proPrice;
	}
	// 자바의 모든 객체의 최상위 객체인 Object가 가지고 있는 기능메서드
	// hashCode를 재정의 하여, 속성값이 같은지 여부를 check할 수 있게 리턴처리..
	// 속성이 
	@Override
	public int hashCode() {
		// 속성(이름이 hash 코드값 + price의 값 합산)
		int Code = proName.hashCode() + proPrice;
		return Code;
	}
}
class Person extends Object{
	
}

class Student{
	private int no;
	private String name;
	public Student(int no, String name) {
		this.no = no;
		this.name = name;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		// 속성 no와 name의 hash코드 즉, 주소값을 리턴. 
		int hashCode = no + name.hashCode();
		return hashCode;
	}
}
