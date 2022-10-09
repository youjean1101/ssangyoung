package javaexp.a08_inherit;

public class A01_Begin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 상속이란?
		 1. 현실 세계 : 
		 	1) 부모가 자식에게 물려주는 행위
		 	2) 부모가 자식을 선택해서 물려줌
		 2. 객체 지향 프로그램
		 	1) 자식(하위, 파생) 클래스가 부모(상위) 클래스의 멤버를 물려받는 것
		 	2) 자식이 부모를 선택해 물려받음.
		 	3) 상속 대상 : 부모의 필드와 메소드
		 ex)
		 	class Parent{
		 		String name;
		 		void call(){
		 		System.out.println("이름:"+name);
		 		}
		 	}
		 	class Child extends Parent{ 
		 	// 상속을 하는 순간 위에 선언된 부모의 name, call()을 선언한 것과 동일한  
		 	// 효과를 가지고 있다.
		 	String gender;	// 추가되는 필드
		 	void showAll(){	//추가되는 메서드.
		 		call(); // 부모의 메서드를 사용
		 		System.out.println("성별:"+gender);
		 		}
		 	}
		 	# 상속(inheritance) 개념과 활용
		 	1. 상속의 효과
		 		1) 부모 클래스 재사용해 자식 클래스 빨리 개발 가능
		 		2) 반복된 코드 중복을 줄임
		 		3) 유지 보수 편리성 제공
		 		4) 객체 다형성 구현 가능
		 	2. 상속 대상 제한
		 		1) 부모 클래스의 private 접근 갖는 필드와 메소드 제외
		 		2) 부모 클래스가 다른 패키지에 있을 경우, default 접근 갖는 필드와 메소드도 제외
		 		ps) super()생성자나 public 기능 메서드를 통해서 간접적으로 필드의 값을 할당하거나
		 			호출할 수 있다.
		 		3) protected : 상속관계에 있으면 해당 접근제어자로 선언되어 있으며
		 			접근이 가능하다.(필드/메서드)
		 	# extends 키워드
		 	1. 자식 클래스가 상속할 부모 클래스를 지정하는 키워드
		 		class Child extends Parent{}
		 	2. 자바는 단일 상속 - 부모 클래스를 여러개 나열 불가하다.
		 		class Child extends Parent1,Parent2(X){}
		 */
		Daughter d1 = new Daughter();
//		System.out.println(d1.charac);
//		d1.cooking();
		d1.callTalent();
		Son s1 = new Son();
		s1.showAll();
	}
}
//ex) 아버지(모습이 통통하다, running() 빠른 속도로 뛴다.), 
//아들(키가 크기, showAll()-부모 구성+키))
class Father{
	private String charact = "성격이 온화하다.";
	String shape = "통통하다.";
	void running() {
		System.out.println("빠른 속도로 뛴다.");
	}
	public String getShape() {
		return shape;
	}
	
}
class Son extends Father{
	String cm = "키가크다.";
	void showAll() {
		System.out.println("#부모 구성+키#");
		System.out.println("모습: "+shape);
		running();
		System.out.println("키:"+cm);
//		System.out.println("성격:"+charact);	//접근제어자가 private인 경우 처리하지 못함.
		System.out.println("성격:"+getShape()); // 간접적으로 접근을 하영 처리한다.
	}
}
class Mother{
	String charac="현명하다";
	void cooking() {
		System.out.println("요리를 잘한다!!");
	}
}
class Daughter extends Mother{
	String goodPoint = "주위 사람을 밝게 한다.";
	void callTalent() {
		System.out.println("#딸의 재능#");
		System.out.println(charac); // 부모의 속성
		cooking(); // 부모의 메서드
		System.out.println(goodPoint); // 추가적 속성
	
	}
}
