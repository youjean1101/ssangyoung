package javaexp.a10_api;

public class A01_Begin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
 		# 자바 API 도큐먼트
 		1. 자바에서 기본적으로 제공하는 라이브러리
 			프로그램 개발에 자주 사용되는 클래스 및 인터페이스 모음
 		2. API 도큐먼트
 			- 쉽게 api 찾아 이용할 수 있도록 문서화한 것
 			- html 페이지로 작성되어 있어 웹브라우저로 바로 볼 수 있다.
 		# java.lang 패키지
 		1. 자바 프로그램의 기본적인 클래스를 담은 패키지
 		2. 포함된 클래스와 인터페이스는 import없이 사용
 		3. 주요 클래스
 			Object - 자바 클래스의 최상위 클래스로 사용
 				모든 클래스(내장/사용정의)는 Object를 상속하고 있다.
 				그러므로, Object가 가지고 있는 기본적인 메서드는 재정의하거나
 				사용할 수 있다.
 				toString(), hashCode()...
 				1) ArrayList list ==> ArrayList<Object> list
 				2) 다형성에 의해서 모든 객체는 Object 객체에 할당이 가능하다.
 					Object ob = new Person()
 				3) 그래서, 상위에 재정의하는 메서드는 상위 Object의 참조 변수로 사용이 가능하지만
 				4) 하위 고유의 메서드를 사용하고자 할 때는 typecasting이 필요로 하다.
 					Person 클래스에서만 선언된 name 필드와 
 					getName() 메서드를 상위 클래스의 참조 변수
 					ob로 사용 불가, 
 					ob.getName() (X)
 					타입 캐스팅을 하여야 한다.
 					Person p = (Person)ob;
 					p.getName() (O)
 				5) ArrayList list = new ArrayList();
 					list.add(new Person());
 					list.add("안녕");
 					list.add(new Man());
 					이렇게 모든 객체를 할당할 수 있지만, 해당 객체의 고유의 필드와 메서드를 사용하려면
 					타입캐스팅이 필요로 하다.
 					Person p = (Person)list.get(0)
 					Man m = (Man)list.get(1);
 				6) 위 같이 할당은 가능한지 사용할려는 객체의 유형으로 타입캐스팅하는 불편함이 있는데, 
 				 단일 객체를 사용할 경우 Generic(<객체유형>)을 선언하는 경우 사용가능하다.
 				 ArrayList<Person> p = new ArrayList<Person>();
 				 list.add(new Person());
 				 list.add(new Person());
 				 
 				 Person p = list.get(0);
 				 Person p = list.get(1);
 				 
 			System - 	표준 입력(키보드)으로부터 데이터를 입력 받는다.
 							System.in
 						표준 출력장치(모니터)로 출력하기 위해 사용
 							System.out
 						자바 가상머신을 종료시킬 때 사용
 						exit(0) : 프로세스 중단 처리..
 						쓰레기 수집기를 실행 요청할 때 사용
 			Class - 클래스를 메모리로 로딩할 때 사용
 				Class.forName("패키지명..클래스명);
 			String - 문자열을 저장하고 여러가지 정보를 얻을 때
 				"문자열"+"문자열" : 메모리 2개
 			StringBuffer, StringBuilder 
 				- 문자열을 저장하고 내부 문자열을 조작할 때 사용
 					sbf.append("문자열")
 					sbf.append("문자열") : 메모리 1개
 			Math - 수학 함수를 이용할 때 사용
 			Wrapper class (기본 데이터유형의 객체 유형화)
 				Byte, Short, Character, Integer,
 				Float, Double, Boolean
 				- 기본 타입의 데이터를 갖는 객체를 만들 때 사용
 				- 문자열을 기본 타입으로 변환할 때 사용
 				- 입력값 검사에 사용.
 				- Boxing, UnBoxing - Auto Boxing, Auto UnBoxing
 					기본데이터유형 <==> 객체
		 */
			/*
			 # Object클래스
			 1. 자바의 최상위 클래스
			 2. 객체비교 equals() 메소드 지원
			 3. 기본적으로 == 연산자와 동일한 결과 리턴(번지 비교)
			 4. 논리적 동등 위해 오버라이딩 필요
			 	1) 논리적 동등이란?
			 		- 같은 객체이건 다른 객체이건 상관없이 객체 저장 데이터 동일
			 	2) Object의 equals() 메소드
			 		- 재정의하여 논리적 동등 비교할 때 이용
			 5. 객체 해시코드(hashCode())
			 	1) 객체 해시코드란?
			 		- 객체 식별할 하나의 정수값
			 		- 객체의 메모리 번지 이용해 해시코드 만들어 리턴
			 			개별 객체는 해시코드가 모두 다른
			 	2) 논리적 동등 비교시 hashCode() 오버라이딩의 필요성
			 		컬렉션 프레임워크의 HashSet, HashMap, Hashtable과 같은 클래스는 
			 		두 객체가 동등한 객체인지 판단할 때 사용된다.
			 6. 참조 변수의 기본 문자열 출력 형태 선언(toString())
			 */
		Member m01 = new Member("홍길동");
		Member m02 = new Member("홍길동");
		Member m03 = new Member("마길동");
		System.out.println("비교 연산자:"+(m01==m02));
		System.out.println("equals 메서드:"+(m01.equals(m02)));
		System.out.println("비교 연산자:"+(m01==m03));
		System.out.println("equals 메서드:"+(m01.equals(m03)));
	}
}
class Member{
	private String name;

	public Member() {
		super();
	}

	public Member(String name) {
		this.name = name;
	}

	@Override
	public boolean equals(Object obj) { // Object obj = new Member("홍길동")
		// 참조값 instanceof 객체 : 두개의 객체가 같은 클래스를 참조할 때, true
		boolean isEquals = false;
		Member m = (Member)obj; // 해당객체의 속성을 사용할려면 type casting이 필요.
		// 문자열로 name 속성이 같을 때, true 그외는 false
		if(this.name.equals(m.getName())) {
			isEquals = true;
		}
		return isEquals;
	}

	public String getName() {
		return name;
	}
}
