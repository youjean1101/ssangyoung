package javaexp.a06_object;

public class A01_Begin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 객체 지향 프로그래밍
		 1. OOP : Object Oriented Programming
		 	- 부품 객체를 먼저 만들고 이것들을 하나씩 조립해 완성된 프로그램을 만드는 기법
		 2. 객체란?
		 	1) 물리적으로 존재하는 것 - 자동차, 책, 사람
		 	2) 추상적인 것(회사, 날짜) 중에서 자신의 속성과 동작을 가지는 모든 것
		 	3) 객체는 필드(속성)과 메소드(동작)으로 구성된 자바 객체로 모델링 가능
		 	현실세계
		 	사람
		 		- [속성] : 이름, 나이
		 		- [동작] : 웃다, 먹다
		 	자바
		 	사람 객체
		 		- [필드] : 이름, 나이
		 		- [메서드] : 웃다, 먹다
		 	# 객체의 상호 작용
		 		 - 객체들은 서로 간의 기능(동작)을 이용하여 데이터를 주고 받는다.
		 		 사람 객체 <--> 전자계산기
		 */
		//main()안에서 선언된 클래스를 아래의 형식으로 생성
		//클래스명 참조변수 = new 생성자();
		Book b1 = new Book();
		Book b2 = new Book();
		Book b3 = new Book(); // 선언된 클래스로부터 여러개의 객체를 만든다.
		System.out.println(b1); // heap 영역의 주소값을 가지고 있다.
		System.out.println(b2);
		System.out.println(b3);
		/*
		 # 객체와 클래스
		 1. 현실세계 비유
		 	현실세계 : 설계도 ==> 구체적인 사물/객체
		 	자바 : 	클래스 ==> 객체
		 2. 클래스에는 객체를 생성하기 위한 필드와 메소드가 정의
		 3. 클래스로부터 만들어진 객체를 해당 클래스의 인스턴스(instance)
		 4. 하나의 클래스로 부터 여러개의 인스턴스를 만들 수 있다.
		 	하나의 롯데월드 타워 도면으로 부터 서울, 부산, 제주도에 실제 건물을 건축할 수 있다.
		 	위 Book 클래스를 통해 b1, b2, b3의 객체를 생성하여 이름을 할당..
		 */
		// ex> Computer 클래스, HandPhone클래스, Food 클래스를 선언하고, main()안에서 
		// 	객체를 생성하여 각 2개이상씩 객체를 생성하고, 객체의 참조변수를 출력하세요.
		Computer C1 = new Computer();
		Computer C2 = new Computer();
		HandPhone H1 = new HandPhone();
		HandPhone H2 = new HandPhone();
		Food F1 = new Food();
		Food F2 = new Food();
		System.out.println(C1);
		System.out.println(C2);
		System.out.println(H1);
		System.out.println(H2);
		System.out.println(F1);
		System.out.println(F2);
		
		Person99 p1 = new Person99("홍길동");
		Person99 p2 = new Person99("신길동");
	}

}
// class명 시작문자를 대문자.
// 객체형의 이름은 대문자로 시작..
class Person99{
	// 속성(필드) : 메모리(기억)
	String name;
	
	// 생성자 : 객체가 초기에 만들어질 때, 초기 속성을 설정
	// 	클래스명과 동일
	Person99(String name){
		this.name = name;
	}
	
	// 동작(메서드) : 외부에 데이터를 받아서 저장기능, 
	// 외부로 기능을 나타내는 작용(말, 행동)
	String speech() {
		
		
		return "내이름은:"+name;
	}
}
// 하나의 설계도 역할하는 클래스를 선언

class Book{
	// 속성:필드
	// 생성자
	// 메서드
}

class Computer{}
class HandPhone{}
class Food{}
