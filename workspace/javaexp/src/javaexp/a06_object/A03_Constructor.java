package javaexp.a06_object;

public class A03_Constructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 생성자
		 1. 필드 초기화
		 	1) 초기값 없이 선언된 필드는 객체가 생성될 때, 기본값으로 자동 설정할 수 있다..
		 	2) 다른 값으로 필드 초기화하는 방법
		 		- 필드 선언할때, 초기값 설정한다.
		 		- 생성자의 매개값으로 초기값 설정한다.
		 		- 매개변수와 필드명 같은 경우 this 사용한다.
		 2. 생성자 기본 형식
		 	1) new 연산자에 의해 호출되어 객체의 초기화를 담당한다.
		 		new 클래스()
		 		- 필드값 설정
		 		- 메소드 호출해 객체를 사용할 수 있도록 준비하는 역할
		 3. 기본 생성자(default 생성자)
		 	1) 모든 클래스는 생성자가 반드시 존재하며 하나 이상 가질 수 있다.
		 	2) 생성자 선언을 생략하면 컴파일러는 다음과 같은 기본 생성자 추가한다.
		 		class Car{ ==(컴파일)==>	class Car{
		 								public Car(){} // 자동 추가
		 		}
		 		Car c1 = new Car();
		 4. 생성자 선언
		 	1) 위 기본 생성자(디폴트) 생성자 개발자가 직접 선언
		 		생성자(매개변수1, 매개변수2...){}
		 	2) 개발자 선언한 생성자 존재시 컴파일러는 기본 생성자 추가하지 않는다.
		 		new 연산자로 객체 생성시 개발자가 선언한 생성자만 사용할 수 있다.
		 
		 5. 생성자의 다양화
		 	1) 생성자는 초기값 설정에 따라 여러개를 선언할 수 있다.
		 	2) 객체 생성할 때, 외부 값으로 객체를 초기화할 필요가 있고, 
		 	3) 외부값이 어떤 파입으로 몇개가 제공될지 모르기 때문에 생성자도 다양화할 수 있다.
		 
		 6. 생성자의 오버로딩(Overloading)
		 	1) 생성자는 매개변수의 갯수, 타입, 순서가 다르면 여러개 선언이 가능하다.
		 	
		 				 	
		 */
		Company c1 = new Company();
		Company c2 = new Company("오리온전자");
		Company c4 = new Company(40000);
		Company c3 = new Company("하이닉스", 30000,100000000);	
		Company c5 = new Company(40000,"오리온전자"); 
		// 매개변수를 통해 다른 생성자가 호출되는 것이 
		Company c6 = new Company("오리온 전자",40000); // 구분함..
		NoteBook nb = new NoteBook("맥북 프로");
		
	}

}

class Company{
	String name;
	int empNum;
	int earMoney;
	Company(){} // 프로그래머가 생성자를 추가할 때, default 생성자는 더 이상 
	// 만들어지지 않지만, 사용자 정의로 정의할 때, 사용할 수 있다.
//	Company(){} 
	Company(String name){
		this.name = name;
		// this : 현재 전체 객체를 지칭
		// 이 객체가 가지고 있는 구성요소를
		// 호출할 때, 사용.
	}
	Company(String name,int empNum){
		this.name = name;
		this.empNum = empNum;
	}
	Company(int earMoney){
		this.earMoney = earMoney;
	}
	Company( int earMoney,String name){
		this.name = name;
		this.earMoney = earMoney;
	}
	Company(String name, int empNum, int earMoney){
		this.name = name;
		this.empNum = empNum;
		this.earMoney = earMoney;
	}
}
class NoteBook{
	NoteBook(String name){}
}