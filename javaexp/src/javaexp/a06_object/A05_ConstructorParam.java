package javaexp.a06_object;

public class A05_ConstructorParam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 생성자와 메서드의 매개변수 처리
		 1. 기능적 처리하는 함수형에서는 매개변수를 효율적으로
		 	처리하는 것이 필요하다.
		 2. 주로 외부에서 데이터를 입력했을 때, 순서와 타입에 따라 선언된 내용을 처리한다.
		 3. 선언
		 	1) 생성자 선언.
		 		Person(){}
		 		Person(int num){}
		 		Person(String name, int age){}
		 		Person(int age, String name){}
		 		
		 4. 호출
		 	1) 객체 생성시 호출
		 		Person p01 = new Person();
		 		Person p02 = new Person(25);
		 		Person p03 = new Person("홍길동");
		 		Person p03 = new Person("신길동",25);
		 		선언된 데이터 유형과 갯수에 맞게 생성하여야 한다.
		 	ex> House 클래스 선언 후, char, int, double, boolean으로 매개변수가 할당하게 하는
		 	1개의 생성자를 선언하고 해당 생성자를 통해 객체가 생성되게 처리하세요.
		 	필드 (위 데이터 유형에 맞게 선언 및 생성자를 통해 초기화)
		 */
		House h1 = new House('A');
//		System.out.println("집의 등급:"+h1.grade);
		House h2 = new House((byte)25);
		// 25은 매개변수로 넘길 때는 정확하게 해당 유형으로
		// casting해서 전달하여야 한다.
		// House(byte b)를 호출하기 위해
		// 25 데이터는 default int 형으로 이상 데이터 유형 할당
		byte b01 = 25;
		char c = 25;
		House h3 = new House(30.7F); // float 타입으로 선언
		float f01 = 30.7F;
		House h4 = new House(35);
//		long l01 = 35;
		float f02 = 35;
		System.out.println("실행1");
		House h5 = new House(35L);
		System.out.println("실행2");
		House h6 = new House(35.75);
		House h7 = new House(true);
		
	}

}
class House{
	char grade;
	byte data01;

	House(char grade){
	this.grade = grade;
	System.out.println("char 생성자 호출: "+grade);
	}
	
	House(byte b){
	this.data01 = b;
	System.out.println("byte:"+b);
	}
	
	House(float f){
	System.out.println("float:"+f);
	}
	/*
	House(int f){
		System.out.println("int 타입 생성자:"+f);
		}
		*/
	
	House(long f){
		System.out.println("long 타입 생성자:"+f);
	}
	House(double d){
		System.out.println("double 타입 생성자:"+d);
	}
	House(boolean b){
		System.out.println("boolean 타입 생성자:"+b);
	}
}
