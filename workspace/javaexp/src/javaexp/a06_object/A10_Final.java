package javaexp.a06_object;

public class A10_Final {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # final 필드
		 1. 최종적인 값을 갖고 있는 필드 = 값을 변경할 수 없는 필드
		 2. final 필드는 딱 한번 초기값을 지정하면 해당 값을 변경할 수 없다.
		 	- 필드 생성시
		 		final String nation = "한국";
		 	- 생성자
		 		Person(String nation){
		 			this.name = nation;
		 			}
		 	cf) final만 붙은 필드는 객체마다 다른 상수를 가질 수 있다.
		 		Person p01 = new Person("한국");
		 		Person p02 = new Person("중국");
		 		Person p03 = new Person("미국");
		 		객체마다 final 변수를 각각 가지고 변경이 불가능하다.
		 	
		 # static final 
		 1. 상수 = 정적 final 필드
		 	- final 필드: 객체마다 가지는 불변의 인스턴스 필드
		 	- static final
		 		- 객체마다 가지고 있지 않음
		 		- 메소드 영역에 클래스 별로 관리되는 불변의 정적 필드
		 		- 공용 데이터로서 사용
		 		ex) 클래스 단위로 변경하지 못하는 상수 설정
		 		
		 2. 상수 이름은 전부 대문자로 작성
		 3. 다른 단어가 결합되면 _로 연결
		 	 
		 
		 */
		Asian a01 = new Asian("9924", "홍길동");
		a01.showInfo();
//		a01.ssn="2433"; // 객체마다 변경 불가
//		a01.nation="일본";
		System.out.println("#인스턴스 변수 변경 후#");
		a01.name = "신길동";
		a01.showInfo();
		
		Asian a02 = new Asian("4000", "마길동");
		a02.showInfo();
		// Player01 클래스를 선언하여 성적은 인스턴스변수, 이름/팀명은 final변수, 
		//	선수분류는 static  final을 선언하고 초기화하여 출력하세요.
		System.out.println();
		Player01 p1 = new Player01("홍길동","LG");
		Player01 p2 = new Player01("신길동","두산");
		Player01 p3 = new Player01("마길동","기아");
		p1.chRecord(0.321);
		p2.chRecord(0.291);
		p3.chRecord(0.341);
		p1.showInfo();
		p2.showInfo();
		p3.showInfo();
				
	}
}
class Player01 {
	double record; // 인스턴스 - 객체 단위로 계속변경할 수 있는 변수
	final String name;	//객체 단위로 초기값을 설정
	final String teamname;
	static final String kind = "야구선수";
	public Player01(String name,String teamname) {
		super();
		this.name = name;
		this.teamname = teamname;
	}
	public void chRecord(double record) {
		this.record = record;
	}
	public void showInfo() {
		System.out.println("선수이름:"+name);
		System.out.println("점수:"+record);
		System.out.println("팀이름:"+teamname);
		System.out.println("선수분류:"+kind);
	}
}

class Asian{
	String name; // 일반 변수
	final String nation="한국"; // 객체마다 한번만 설정가능 변수
	final String ssn; // 생성자에 의해 초기값 설정
	static final String COLOR="갈색"; // 클래스 고유 메모리로 객체단위로도 변경이 불가능하다.
	// static final 상수는 일반적으로 대문자로 선언하고, 합성어를 사용할 때, _를 이용한다.
	//	ex) SET_NAME, PI_VALUE
	public Asian(String ssn,String name) {
		super();
		this.ssn = ssn;
		this.name = name;
	}
	public void showInfo() {
		System.out.println("국적:"+nation);
		System.out.println("주민번호:"+ssn);
		System.out.println("이름:"+name);
		System.out.println("피부색상:"+COLOR);
		
	}
}
/*
 # 네이밍 규칙
 1. 대문자로 시작(첫자)
 	클래스명(사용자정의)
 	api의 객체명
 	선언시도 대문자를 선언
 	생성자명
 2. 소문자
 	클래스명이외 대부분의 변수
	객체의 참조변수(인스턴스변수) 소문자
	메서드명도 사용
	합성의 경우에는 시작시 소문자로 하고 구분자에 대하여
		camel 형식으로 대문자를 중간에 추가한다.
 3. 모두 다 대문자로 선언
 	static final상수
 */
