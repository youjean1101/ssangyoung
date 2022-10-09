package javaexp.a08_inherit;

public class A02_Super_This {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # super와 this
		 1. this
		 	1) 인스턴스 필드/메서드를 호출할 때 사용. ex) this.필드명
		 	2) this() 다른 생성자를 호출할 때 사용. ex) this(), this(name)
		 2. super
		 	1) 상속관계에서 상위/하위 클래스 동일한 멤버를 사용할 때,
		 		구분하기 위해서 활용된다.
		 		ex) 주로 생성자와 메서드에서 사용된다.
		 	2) 생성자
		 		- 하위 객체는 상위객체의 생성자를 생성하면서 처리가 된다.
		 			default 생성자에 의해서 기본적으로 호출된다.
		 			class Father{
//		 			public Father(){super();} // default 생성자 포함
		 			Father(String s){}
		 			Fathter(String name, int age){
		 					this.(name); // 첫라인에서만 선언..
		 					}
		 			}
		 			class Son extends Father{
		 			public Son(){
		 			super(); //default 상위 생성자를 호출..
		 			}
		 			// 객체 생성자를 통해서 상위에 있는 매개변수가 있는 생성자를
		 			// 반드시 호출하여햐 하기 때문에 기본 선언으로 에러가 발생.
		 			 //
		 			 public Son(){
		 			 super("홍길동"); //super()생성자 첫라인에 선언
		 			 }
		 			 // 상속관계로 인하여 객체를 사용할려면 상위에 있는 필드와 메서드를 
		 			 // 활용하여야 하는데, 상위에 있는 선언된 생성자를 호출하지 않고는 사용할 수 
		 			 // 없기 때문에 반드시 선언된 생성자 1개라도 호출하여야 한다.  
		 			}
		 			cf) 자바는 모든 클래스가 상위/하위 상속관계로 설정.
		 				- Object(내장) 최상위 클래스 선언되어 있다. 
		 				ArrayList li = new Arraylist();
		 				ArrayList<Object> li2 = new Arraylist<Object>();
		 				동일하고..
		 				// Object는 모든 객체를 다형성으로 할당이 가능.
		 				Object ob = new Person();
		 				li.add(new Person());
		 				li.add("안녕하세요");
		 				li.add(25); // Wrapper(Integer)로 자동변환되어 할당(Boxing)
		 				for(Object ob:li2){
		 					System.out.println(ob);
		 					// 주소값/String은 문자열의 toString() 문자열 자체를 가지고 있기
		 					// 때문에 그대로 문자열이 나온다.
		 				}
		 			
		 	3) 메서드에 사용하는 super.메서드()
		 		- 오버라이딩
		 			상위에 있는 기능 메서드를 하위 클래스에서 다양한 기능을 처리하기 위해
		 			동일한 메서드 메서드명을 재정의 하는 것을 말한다.
		 			이때, 상위의 메서드 내용도 호출해서 사용할려면, 현재 정의된 메서드와
		 			구분하기 위해 super.메서드명()으로 호출하여 처리한다.
		 	
		 	# 명시적 부모 생성자 호출
		 	1. 부모 객체 생성할 때, 부모 생성자 선택해 호출
		 		자식클래스(매개변수, 선언..){
		 			super(매개값)
		 			}
		 	2. super(매개값..)
		 		- 매개값과 동일한 타입, 갯수, 순서 맞는 부모 생성자 호출
		 	3. 부모 생성자 없다면 컴파일 오류 발생
		 	4. 반드시 자식 생성자의 첫줄에 위치
		 	5. 부모 클래스에 기본(매개변수없는) 생성자 없다면 필수 작성.
		 */
		Object ob01 = new Object();
//		ob01.기본메서드()
		Son01 s1 = new Son01("신길동");
		System.out.println(s1.getName());
		
		Daugher01 d1 = new Daugher01("해물찜");
		System.out.println("딸이 엄마한테 물려받아 잘하는 음식:"+d1.getGoodcook());
		Daugher02 d2 = new Daugher02();
		System.out.println("딸2이 엄마한테 물려받아 잘하는 음식:"+d2.getGoodcook());
	}
	// ex) Mother 잘하는 요리 필드 선언, 생성자 할당, 잘하는 요리return메서드	
	//	Daugher Mother상속 생성자 호출 할당 Daughter생성..
}
class Mother01{
	private String goodcook;
	Mother01(String d){
		this.goodcook = d;
	}
	public String getGoodcook() {
		return this.goodcook;
	}
}
//Daugher01 d1 = new Daughter01();
//d1.getGoodcook();
class Daugher01 extends Mother01{
	public Daugher01(String goodcook){
		super(goodcook);
	}
}
class Daugher02 extends Mother01{
	public Daugher02() {
		super("자장면");
	}
}
class Daugher03 extends Mother01{
	public Daugher03() {
		super("초밥");
	}
}

class Father01{
	private String name;
	Father01(String s){
		this.name = s;
	}
	public String getName() {
		return name;
	}
	
}
class Son01 extends Father01{
	Son01(String name){
		super(name);	// 하위에서는 반드시 상위 클래스 생성자를 호출하여야 한다.
	} //default로 보이지 않지만 처리되어 있기 때문..
}

