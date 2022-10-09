package javaexp.a07_access;

import javaexp.a07_access.a01_access.A01_Person;
//import javaexp.a07_access.a01_access.A02_Music;

public class A02_AccessModifier {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 접근제한자(Access Modifier)
		 1. 클래스 및 클래스의 구성 멤버에 대한 접근을 제한하는 역할을 한다.
		 	- 다른 패키지에서 클래스를 사용하지 못하도록 (클래스 제한)
		 	- 클래스로부터 객체를 생성하지 못하도록(생성자 제한)
		 	- 특정 필드와 메소드를 숨기 처리(필드와 메소드 제한)
		 2. 접근 제한자의 종류
		 	- public : 패키지가 다르더라도 접근이 가능
		 	- protected : 상속 관계에 있을 떄, 외부 패키지까지 접근 가능
		 	- default(X) : 같은 패키지에서만 접근 가능
		 	- private : 다른 클래스에서는 접근이 불가능
		 */
		// 클래스 접근 제어자 확인.
		// 1. A01_Product
		A01_Product prod; // 같은 패키지에 있는 클래스 호출 가능..
		prod = new A01_Product("사과"); // 같은 패키지는 생성자가 default 접근제어자이어도 접근이 가능
//		System.out.println(prod.name);
		A01_Person pson; // 다른 패키지에 있는 클래스 호출.
//		A02_Music music; // 다른 패키지에 있는 클래스가 public이 아닐 때, 에러 발생
//		pson = new A01_Person();
		A01_Person pson2;
//		pson2 = new A01_Person("홍길동"); 생성자가 default 접근제어자 이기에 에러발생.
		/*
		 # 패키지에 따른 클래스와 생성자의 접근 제한
		 1. 호출 하는 클래스가 같은 패키지인 경우 접근제어자가 public, X(default)경우 자유롭게
		 	클래스 선언과 생성자 선언이 가능하다.
		 2. 호출하는 클래스가 다른 패키지인 경우 접근제어자가 public 인 경우에 class 선언이 가능하고,
		 	생성자도 public인 경우에 생성이 가능하다.
		 3. 같은 패키지이더라도 접근제어자가 private인 경우에는 외부 클래스에서 접근이 불가능하다.
		 */
	}

}
