package javaexp.z01_homework;

public class A14_0909_0912 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2022-09-09
[1단계:코드] 1. 짜장면(5000), 짬뽕(6000)의 가격으로 되었을 때, 증감 연산자를 활용해서
            1~3, 1~5까지의 총비용을 출력하세요.
[1단계:개념] 2. 단항연산자, 이항연산자, 삼항 연산자의 차이점을 개념과 예제를 통해 기술하세요.
[1단계:코드] 3. 100에서 1/4로  4회 누적해서 나눈 값을 아래의 형식으로 출력 하세요
                 초기데이터 100
                 1회  25 
                 2회  6.2..
                 3회  1.54...
                   4회  0.38..
[2단계:코드] 4. [continue 활용]1~12월까지 마지막일수*10으로 월급여 산정하되,
            31일만 있는 월만 산정해서 출력하고 나머지 월(30일, 28일까지 있는 달)은 산정 처리하지 않고 총 급여을 아래와 같이 출력하세요
                      월  일수   월급여 누적연봉      
                      1월 31일  310만 310만원
                      3월 31일  310만 620만원
                      5월 31일  310만 930만원
                      ..
                      12 31일  ..
[2단계:응용] 5. 두명(컴퓨터vs컴퓨터)의 구슬 홀짝게임 : 한명이 구슬 10개를 가지고 임의의로 쥐게 하여, 
          다른 한명이 이것을 맞추었는지 여부에 따라 승/패로 출력하게 하세요.
[1단계:응용] 6. 두 팀(홍/청-컴퓨터vs컴퓨터)이 주사위를 던져 홍팀의 결과를 출력하세요(승/무/패)
[2단계:응용] 7. while문 숫자 맞추기 게임, 컴퓨터가 임의로 1~100범위의 숫자를 저장하면,
         while문을 통해서 해당 숫자를 입력한다. 비교해서 동일하면 종료,
[1단계:개념] 8. 참조변수가 무엇인지? 메모리 영역을 기본 데이터유형과 비교하여
      기본 예제를 통해서 설명하세요.
[1단계:확인] 9. Music 클래스를 선언하고, 해당 m01, m02 참조변수를 선언하고, 비교하세요.
2022-09-10
[1단계:개념] 1. 배열과 반복문의 관계를 기술하고, 학생 30명을 임의의 점수(0~100)로 배열에 할당/출력하세요.
[1단계:응용] 2. 무지개 색상을 배열로 선언하고, 이 중에서 임의의 색상 3개를 출력하세요
[1단계:개념] 3. 클래스와 객체의 관계를 메모리를 활용하여 설명하고, 주소값을 출력하세요..
[1단계:개념] 4. 클래스를 통해 만들어진 객체와 일반 primitive 데이터와 어떠한 차이점이 있는지 기술하세요.
[1단계:확인] 5. 아래와 같이 여러가지 생성자를 초기화하고 출력하세요.
          1) Singer 클래스를 선언하고 매개변수로 이름, 소속사, 메인곡을 선언하고, 생성자를 통해서 초기화 하고 출력하세요.
          2) Game 클래스를 선언하고 출시회사, 비용, 인기순
2022-09-11
[1단계:확인] 1. [리턴유형연습] 쇼핑몰에서 구매한 물건, 가격, 갯수, 배송지를 리턴값으로 선언하는 메서드와, 
            리턴값이 없이 위 정보를 출력하는 메서드를 선언하세요
[1단계:확인] *2. [매개변수연습] driving메서드에 매개변수로 1~3개를 각각 선언하되,
            차량명, 목적지, 거리를 선언하여 출력하되 오버로딩 규칙에 따라 처리하세요.
            
	}
}
		class  Car{
			String name;
			String target;
			int distance;
			Car(){
				this.name = "정하지않음";
				this.target = "없음"; // 스트링은 NULL값이 나오므로 지정
			}
		//차량명, 목적지, 거리
		void driving() { // 매개변수 없음.
			System.out.println("차량명:"+this.name);
			System.out.println("목적지:"+this.target);
			System.out.println("거리:"+this.distance);
		}
		void driving(String name) { // 1개 매개변수..
			this.name = name;
			this.driving();
		}
		void driving(int distance) {	// 매개변수 타입이 다름..
			this.distance = distance;
			this.driving();
		}
		void driving(String name,int distance) { 
			this.name = name;
			this.distance = distance;
			this.driving();
		}
		void driving(int distance,String name) { // 매개변수의 타입의 순서가 다름..
			this.name = name;
			this.distance = distance;
			this.driving();
		}
	}
		*/
		
		
		/*
[1단계:확인] 3. [매개변수+리턴] Student 클래스
            tot() 매개변수:국어,영어,수학점수 리턴값:총점수(정수)
            avg() 매개변수:국어,영어,수학점수 리턴값:평균값(실수)
            reg() 매개변수:번호,이름  리턴값:@@번 @@@(문자열)
            show() 매개변수:이름,국어,영어,수학  리턴값:없음, 출력:매개변수값
[1단계:확인]* 4. [매개변수+리턴] Member 클래스 선언하고, regdate()메서드로
            회원명, 아이디, 패스워드 매개변수로 입력과 String으로 등록 내용을 리턴
            usePoint()메서드로 사용한 포인트를 입력받아 10%적립포인트 리턴(실수)
            addPoint()메서드로 추가할포인트를 입력받아 지역변수로 있는 point=1000
            에 추가하여 리턴처리하세요.
          
	}
}
	class Member02{
	String name;
	String id;
	String pass;
	double point;
	String inputMember(String name,String id,String pass) {
		this.name = name;
		this.id = id;
		this.pass = pass;
		String ret = "이름:"+name+",아이디:"+id+", 패스워드:"+pass;
		return ret;
	}
	double usePoint(double point) {
		this.point=point*0.1;
		return this.point;
	}
//	addPoint()메서드로 추가할포인트를 입력받아 지역변수로 있는 point=1000 에 추가하여 리턴처리하세요.
	double addPoint(double addPt) { 
		int point = 1000;
		point +=addPt;
		return point;
	}
}
	*/
		/*
2022-09-12
[1단계:확인]* 1. [매개변수+필드] Caffee 클래스 선언, 
         필드 : 주문커피종류, 주문 가격, 주문 갯수
         메서드 : orderName - 주문커피종류 저장
                orderCoffee - 주문커피종류, 가격, 갯수 저장
                getPay - 총비용(가격*갯수) 리턴
                getName() - 주문커피종류 리턴
                showAll() - 저장된 주문커피종류,가격,갯수,총액 문자열리턴
             
	}
}
class Caffee{
	private String cname;
	private int price;
	private int cnt;
	public void orderName(String cname) {
		this.cname = cname;
	}
	public void orderCoffee(String cname, int price, int cnt) {
		this.cname = cname;
		this.price = price;
		this.cnt = cnt;
	}
	public int getPay() {
		return this.price*this.cnt;
	}
	public String getname() {
		return this.cname;
	}
	public String showAll() {
		String ret = "커피종류:"+this.cname+",가격:"+this.price+",갯수:"+this.cnt+",총액:"+this.price*this.cnt;
		return ret;
	}
}
*/
		/*
[1단계:확인]* 2. [필드+로직처리] Gugu 클래스 선언
          필드 : 단수, 시작단수, 마지막단수
      메서드 : schGrade - 단수지정
          showResult - 해당 단수의 1~9까지 연산 출력
                             setFromTo - 시작단수,마지막단수 지정
          showResult2 - 범위가 있는 단수 출력

	}
}
	
class Gugu{
	int grade; // 전역변수
	int start;
	int end;
	void schGrade(int grade) {
		this.grade = grade;
	}
	void showResult() {
		System.out.println("# "+this.grade+"단 #");
		for(int cnt=1;cnt<=9;cnt++) {
			System.out.println(this.grade+" X "+cnt+" = "+this.grade*cnt);
		}
	}
	void setFromTo(int start,int end) {
		this.start = start;
		this.end = end;
	}
	void showResult2() {
		//showResult2 - 범위가 있는 단수 출력
		for(int grade = this.start;grade<=this.end;grade++) {// 지역변수 grade
			System.out.println("# "+grade+"단 #");
			for (int cnt=1;cnt<=9;cnt++) {
				System.out.println(grade+" X "+cnt+" = "+grade*cnt);
			}
		}
	}
}
*/
		/*
[1단계:확인] *3. [필드+로직처리] Bus 클래스 선언
         필드 : 버스번호, 구간, 비용
         메서드 : basicInfo - 입력 버스번호, 구간, 비용
            takeBus - 입력 : 인원수 리턴:비용*인원수
                    화면 출력 : 구간 @@ 인  @@번 @@명 탑승
		 */
	}
}
class Bus2{
	private int no;
	private String fromTo="";
	private int pay;
	public void basicInfo(int no, String fromTo, int pay) {
		this.no =no;
		this.fromTo =fromTo;
		this.pay =pay;
	}
	public int takeBus(int cnt) {	// 인원수 입력
		System.out.print("구간: "+fromTo+"인 ");
		System.out.print(this.no+"번"+cnt+"명 탑승");
		return this.pay*cnt; // 필드로 선언하지 않아서 지역변수 // return : 비용*인원수
	}
}

