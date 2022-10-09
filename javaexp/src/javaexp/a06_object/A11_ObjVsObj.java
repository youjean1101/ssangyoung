package javaexp.a06_object;

public class A11_ObjVsObj {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 1:1관계 클래스의 선언과 객체 생성
		 1. 1:1 관계에 있는 현실의 요구사항에서 많이 있을 뿐아니라 실제 프로그래밍에서도
		 	많이 발생하여 처리하여야 한다.
		 	ex) 사람이 가지고 있는 핸드폰, 연필과 지우개, 학생과 성적표, 학생과 전공지도 교수
		 		TV와 리모콘, 결혼할 커플(남/여)
		 2.  선언 방식
		 	1) 종속될 클래스 선언
		 	2) 포함할 클래스 선언
		 */
		HPerson h01 = new HPerson("홍길동");
		h01.checkMyPocket();
		h01.buyPhone(new HandPhone01("010-0000-0000","삼성전자"));
		h01.checkMyPocket();
		h01.buyPhone(new HandPhone01("010-1111-2222","애플"));
		h01.checkMyPocket();
	}
}
class HandPhone01{
	private String number;
	private String compy;
	public HandPhone01(String number, String compy) {
		super();
		this.number = number;
		this.compy = compy;
	}
	public void info() {
		System.out.println("# 핸드폰 정보 #");
		System.out.println("번호:"+this.number);
		System.out.println("제조사:"+this.compy);
	}
}
class HPerson{
	private String name;
	private HandPhone01 phone;
	// 1:1관계 설정시, 필드로 객체를 선언하여 사용한다.
	public HPerson(String name) {
		super();
		this.name = name;
	}
	// public void setCnt(int cnt){} hp.setCnt(5); int cnt=5;
	// public void buyPhone(String pname){} 
	// hp.buyPhone("삼성폰"); String pname = "삼성폰"
	public void buyPhone(HandPhone01 phone) { 
		// hp.buyPhone(new HandPhone01("010-0000-0000","삼성폰"));
		// 	HandPhone01 hp01 = new HandPhone01("010-0000-0000","아이폰")
		
		// HandPhone01 phone = new HandPhone01("010-0000-0000","삼성폰");
		// 	hp.buyPhone( hp01 );
		// HandPhone01 phone = hp01;
		
		this.phone = phone;
		// 객체가 필드에 할당이 됨
	}
	public void checkMyPocket() {
		System.out.println(name+" 주머니 속에 핸드폰을 확인합니다.");
		// 위에 void buyPhone(HandPhone01 phone)
		// 메서드를 호출하여 객체가 할당되지 않는 초기 상태..
		// cf) 객체할당하는 기능메서드에서는 반드시 아래 조건 처리를 하여야지 NullPointException 에러가 발생하지 않는다.
		if(this.phone==null) { // 위 기능메서드 (buyPhone)로 핸드폰이 할당되지 않음.
			System.out.println("핸드폰이 없네요.");
		}else { // 핸드폰이 할당되어 있음.
//			this.phone!=null
			this.phone.info();
		}
	}
}
