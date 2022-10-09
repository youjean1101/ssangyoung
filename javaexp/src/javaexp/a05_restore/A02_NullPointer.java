package javaexp.a05_restore;

public class A02_NullPointer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 기본 데이터의 초기값 설정.
		int num01;
//		System.out.println(num01); 초기화를 해야 사용가능
		num01=0;	// 초기데이터를 0 : stack
		System.out.println(num01);
		Person p01;
//		System.out.println(p01);
		p01 = null; // 객체는 초기화를 stack영역에 null
					// heap 영역의 객체는 생성되지 않았다.
		// # stack 영역에 초기화 처리
		// 1. 기본 유형 : 각 데이터의 초기값으로 데이터 선언 - int num01 = 0;
		// 2. 객체 유형 : null이라는 키워드로 stack영역에 초기화를 선언 - int[] array=null;
		//		주의 - 아직까지 heap영역에 실제 객체를 할당하지 않았음 의미.
		/*
		 
		 */
		
		
		System.out.println(p01);
		// 초기화를 했지만, 실제 객체를 할당하지 않았음에도 불구하고, 실제 객체가 있는 것과
		// 동일하게 구성요소를 호출할 때 발생..
		// ex> 자동차가 아직까지 주차되지 않는 상황에서 자동차의 트렁크 내용을 확인하려고 함..
		// NullPointerException
		// Pointer : heap영역에 주소를 지치
		// Null : 실제 객체가 없음을 의미
		/*
		 if(p01!=null){ //객체가 생성되어 heap영역에 주소에 있을 때.
		 	p01.name
		 	}
		 */
		
	
//		System.out.println(p01.age);
//			java.lang.NullPointerException
//			객체가 heap영역에 생성되지 않았을 때, 구성요소를 
//			호출하면 runtime error인 NullPointerException
//			ex> 도서관에 해당 번호에 있어야 할 자리에 책이 없음
//				그 책의 50페이지를 확인하려는 것과 비유할 수 있다.
		p01 = new Person(); // 객체가 heap영역에 생성된다.
		System.out.println(p01);
		System.out.println(p01.age);
		p01.age=25;
		System.out.println(p01.age);
		// 모든 객체는 객체가 생성됨과 동시에 구성요소들이 초기화된다.
		// 숫자는 0, 객체(String 포함) null
		System.out.println(p01.age);
//		System.out.println(p01.height);
//		System.out.println(p01.name);
	}
}
class Person{
	int age;
	double height;
	String name; 
} // 사용정의 class 선언..
	