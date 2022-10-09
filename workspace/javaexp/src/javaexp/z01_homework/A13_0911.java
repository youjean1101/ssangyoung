package javaexp.z01_homework;


public class A13_0911 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. [리턴유형연습] 쇼핑몰에서 구매한 물건, 가격, 갯수, 배송지를 리턴값으로 선언하는 
		 메서드와, 리턴값이 없이 위 정보를 출력하는 메서드를 선언하세요
		 */
		Shop s1 = new Shop();
		System.out.println("# 리턴값 있는 출력 #");
		System.out.println("구매한 물건: "+s1.getProd());
		System.out.println("가격: "+s1.getPrice()+"원");
		System.out.println("배송지: "+s1.getDest());
		s1.buyShop();
	}

}
class Shop{
	String product;
	int price;
	String destination;
	Shop(){
		this.product = "양말";
		this.price = 2500;
		this.destination = "서울특별시 마포구 월드컵북로 21 2층 풍성빌딩";
	}
	void buyShop(){
		System.out.println("# 리턴값 없이 출력 #");
		System.out.println("구매한 물건: "+this.product+"\n가격: "+this.price+"원"+"\n배송지: "+this.destination);
	}
	String getProd() {
		return this.product;
	}
	int getPrice() {
		return this.price;
	}
	String getDest() {
		return this.destination;
	}
}

		/*
		 2. [매개변수연습] driving메서드에 매개변수로 1~3개를 각각 선언하되,
            차량명, 목적지, 거리를 선언하여 출력하되 오버로딩 규칙에 따라 처리하세요.
		
		Drive d1 = new Drive();
		d1.driving(298,"제네시스","함양");
		System.out.println();
		Drive d2 = new Drive();
		d2.driving("모닝","속초해수욕장",226);
		System.out.println();
		Drive d3 = new Drive();
		d3.driving("북한산성입구",32);
		
	}
}
class Drive{
	String car;
	String destination;
	double distance;
	void driving(){
		System.out.println("입력받지 않았습니다.");
	}
	void driving(String inputcar){
		this.car = inputcar;
		System.out.println("차량명:"+car);
	}
	void driving(double inputdist){
		this.distance=inputdist;
		System.out.println("거리:"+distance+"km");
	}
	void driving(String inputdest,double inputdist){
		this.destination = inputdest;
		this.distance=inputdist;
		System.out.println("목적지:"+destination);
		System.out.println("거리:"+distance+"km");
	}
	void driving(String inputcar, String inputdest,double inputdist){
		this.car = inputcar;
		this.destination = inputdest;
		this.distance=inputdist;
		System.out.println("차량명:"+car);
		System.out.println("목적지:"+destination);
		System.out.println("거리:"+distance+"km");
	}
	void driving(double inputdist,String inputcar, String inputdest){
		this.car = inputcar;
		this.destination = inputdest;
		this.distance=inputdist;
		System.out.println("차량명:"+car);
		System.out.println("목적지:"+destination);
		System.out.println("거리:"+distance+"km");
	}
	void driving(String inputcar,double inputdist, String inputdest){
		this.car = inputcar;
		this.destination = inputdest;
		this.distance=inputdist;
		System.out.println("차량명:"+car);
		System.out.println("목적지:"+destination);
		System.out.println("거리:"+distance+"km");
	}
}
 */
		/*
	  3. [매개변수+리턴] Student 클래스
            tot() 매개변수:국어,영어,수학점수 리턴값:총점수(정수)
            avg() 매개변수:국어,영어,수학점수 리턴값:평균값(실수)
            reg() 매개변수:번호,이름  리턴값:@@번 @@@(문자열)
            show() 매개변수:이름,국어,영어,수학  리턴값:없음, 출력:매개변수값
           
		Student s1 = new Student();
		System.out.println("국어,영어,수학 총점수: "+s1.tot());
		System.out.println("국어,영어,수학 평균값: "+s1.avg());
		System.out.println("학생 번호,이름: "+s1.reg());
		System.out.print("매개변수값: ");
		s1.show();
	}
}
class Student {
	int korPt;
	int engPt;
	int mathPt;
	String name;
	int number;
	Student(){
		this.korPt = 60;
		this.engPt = 70;
		this.mathPt= 90;
		this.name = "정유진";
		this.number= 17;
	}
	int tot(){
		return this.korPt+this.engPt+this.mathPt;
	}
	double avg() {
		return tot()/3;
	}
	String reg() {
		return this.number+"번 "+this.name;
	}
	void show() {
		System.out.println(name+"\n국어점수: "+korPt+"\t영어점수:"+engPt+"\t수학점수:"+mathPt);
	}
}
*/
		/*
		 4. [매개변수+리턴] Member 클래스 선언하고, regdate()메서드로
            회원명, 아이디, 패스워드 매개변수로 입력과 String으로 등록 내용을 리턴
            usePoint()메서드로 사용한 포인트를 입력받아 10%적립포인트 리턴(실수)
            addPoint()메서드로 추가할포인트를 입력받아 지역변수로 있는 point=1000
            에 추가하여 리턴처리하세요.
		
		Member01 m1 = new Member01();
		System.out.println(m1.regdate("정유진","admin",1234));
		System.out.print(m1.name+"님의 적립된 포인트: ");
		System.out.println(m1.usePoint(40000)+"P");
		System.out.println("총포인트(+1000):"+m1.addPoint(2000)+"P");
		System.out.println();
		Member01 m2 = new Member01();
		System.out.println(m2.regdate("홍길동","admin2",7777));
		System.out.print(m2.name+"님의 적립된 포인트: ");
		System.out.println(m2.usePoint(20000)+"P");
		System.out.println("총포인트(+1000):"+m2.addPoint(1000)+"P");

	}
}
class Member01{
	String name;
	String id;
	int passwd;
	double point;
	int add = 1000; // 전역변수 = > 변수 선언 안에 들어가야 지역변수가 됌.

	String regdate(String inputname,String inputid,int inputpasswd) {
		this.name = inputname;
		this.id = inputid;
		this.passwd = inputpasswd;
		return "이름: "+inputname+"\t아이디:"+inputid+"\t패스워드: "+inputpasswd;
	}
	double usePoint(double inputmoney) {
		double accPoint =inputmoney*0.1;
		this.point = accPoint;
		return accPoint;
	}

	double addPoint(double inputadd) {
		// int add = 1000; 여기에 들어가야 지역변수가 됌.
		System.out.println(name+"님이 추가할 포인트: "+inputadd+"P");
		return point+inputadd+add;
	}
} */

