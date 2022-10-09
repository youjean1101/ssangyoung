package javaexp.a06_object;

public class A07_Method {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 메소드?
		 1. 객체의 동작(기능)
		 2. 호출해서 실행할 수 있는 중괄호{} 블록
		 3. 메소드 호출하면 중괄호{}블록에 있는 모든 코드들이 일괄 실행
		 # 메소드 선언
		 1. 핵심 기본 유형
		 	리턴타입 메소드명(매개변수1, 매개변수2...){
		 		프로세스 처리
		 		return 실제리턴데이터;
		 		}
		 		int plus(int num01, int num02){
		 			int sum = num01 + num02;
		 			return sum;
		 			}
		 		String getGeet(){
		 			return "안녕하세요";
		 		}
		 		
		 		1) 리턴타입: 
		 			이 메서드를 호출했을 때, 나오는 데이터의 유형을 선언한다.
		 			마지막에 리턴할 데이터의 유형을 선언한다.
		 			리턴값이 없는 경우에는 void를 적고 리턴하지 않는다.
		 			ex> 사람의 귀는 음성정보를 입력해서 두뇌에 저장
		 			
		 			void를 사용하는 경우
		 			1. 입력값을 통해서 주로 필드에 저장하는 경우.
		 				void setName(String name){
		 					this.name = name;
		 					}			
		 			2. System.out.println()화면에 출력만 하는 경우
		 				void showInf(){
		 					System.out.println("이름"+this.name);
		 					}
		 			
		 		2) 매개변수 : 
		 			메서드도 생성자와 동일하게 여러개의 데이터를 단일 또는 다중으로 입력받아서 처리할
		 			수 있다. 
		 			cf) 메서드 오버로딩
		 			메서드 이름이 같지만 매개변수의 갯수, 유형, 순서(유형이 다른)에 따라 선언을 
		 			할 수 있다. 
		 			
		 			
		 */
		MethodReturnExp m01 = new MethodReturnExp();
		m01.callString();
		
		System.out.println("리턴데이터:" + m01.callString());
		String ret = m01.callString();
		
		System.out.println(ret+"! 반갑습니다.");
		System.out.println(m01.callInt());
		System.out.println(m01.callDouble());
		double num01 = m01.callDouble()+10;
		System.out.println("num01:"+num01);
		System.out.println("호출:"+m01.callName());
		
		m01.setName("마길동");
		System.out.println("다시 호출 : "+m01.callName());
		
//	=====================================================	
		System.out.println(" #Person name,age선언# ");
		Person p01 = new Person();
		System.out.println(p01.getname());
		System.out.println(p01.getage());
		p01.setname("홍길동");
		p01.setage(25);
		System.out.println(p01.getname());
		System.out.println(p01.getage());
		String name = p01.getname();
		System.out.println("이름:"+name);
		int age = p01.getage();
		System.out.println("10년 후 나이:"+(age+10));
//========================================================				
		// ex> Calcu num01, num02
		//		1) 기능메서드1 num01 저장 - 오버로딩
		//		2) 기능메서드2 num02 저장
		//		3) 기능메서드3 num01, num02 - 오버로딩
		//		4) 기능메서드4 두개의 변수를 더해서 return
		//		5) 기능메서드5 두개의 변수를 곱해서 return
		System.out.println(" # Calcu num01,num02 출력 # ");
		Calcu c01 = new Calcu();
		c01.setnum01(20);
		c01.setnum02(30);
		System.out.println(c01.getnum01());
		System.out.println(c01.getnum02());
//		int sum = c01.getsum();
		System.out.println("두개의 합:"+c01.getsum());
//		int multi = c01.getmulti();
		System.out.println("두개의 곱:"+c01.getmulti());
		c01.setnum01(20,30); //오버로딩
		System.out.println(c01.getsum());
		System.out.println(c01.getmulti());
		System.out.println("생성자에 의해 초기화");
		Calcu c02 = new Calcu(20,50);
		System.out.println(c02.getsum());
		System.out.println(c02.getmulti());
	}

}
class Calcu {
	int num01;
	int num02;
	Calcu(){}
	Calcu(int num01,int num02) {
		this.num01= num01;
		this.num02= num02;
	}
	void setnum01(int num01) {
		this.num01= num01;
	}
	void setnum02(int num02) {
		this.num02= num02;
	}
	void setnum01(int num01,int num02) {
		this.num01= num01;
		this.num02= num02;
	}
	int getnum01() {
		return num01;
	}
	int getnum02() {
		return num02;
	}
	
	int getsum() {
		return this.num01+this.num02;
	}
	int getmulti() {
		return this.num01*this.num02;
	}
	
}
	// ex> Person 필드 name, age 선언, 
	// 	1) 이름과 나이를 저장하는 메서드1, 메서드2
	//	2) return 이름과 나이를 호출하는 메서드3, 메서드4
	//	main()d에서 저장과 호출하여 출력하세요.

class Person{
	String name;
	int age;
	void setname(String name) {
		this.name=name;
	}
	// 매개변수 없음.
	void setData() {
		name = "없음";
		age=-1;
	}
	// 매개변수 1
	void setData(String name) {
		setData();	// 이 객체가 소속된 기능메서드 호출.
		this.name=name;
	}
	void setData(int age) {
		this.age = age;
	}
	// 매개변수
	void setData(String name,int age) {
		this.setData(name);
		this.age = age; //메서드는 순서 상관없음.
	}
	
	void setData(int age,String name) {
		this.setData(name);
		this.age = age; 
	} // 순서(갯수,타입은 같음)가 달라도 괜찮음(오버로딩) **면접시 많이 물어봄(기초탄탄)
	
		void setage(int age) {
		this.age=age;
	}
	
	String getname() { 
		return name;
	}
	
	int getage() {
		return age;
	}
}
class MethodReturnExp{
	String name;
	void setName(String name) {
		this.name=name;
		System.out.println("저장할 데이터:"+name);
		// void를 쓰면 하단에 return을 하지 않아야 한다.
	}
	String callName() {
		return name;
	}
	String callString() {
		return "안녕하세요";
	}
	int callInt() {
		return 35;
	}
	double callDouble() {
		return 3.14;
	}
}