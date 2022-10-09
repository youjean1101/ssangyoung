package javaexp.z01_homework;

public class A14_0912_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. [매개변수+필드] Caffee 클래스 선언, 
         필드 : 주문커피종류, 주문 가격, 주문 갯수
         메서드 : orderName - 주문커피종류 저장
                orderCoffee - 주문커피종류, 가격, 갯수 저장
                getPay - 총비용(가격*갯수) 리턴
                getName() - 주문커피종류 리턴
                showAll() - 저장된 주문커피종류,가격,갯수,총액 문자열리턴
		 
		Caffee c1 = new Caffee();
		Caffee c2 = new Caffee();
		Caffee c3 = new Caffee();
		System.out.println("주문커피종류 저장값:");
		c1.orderName("아메리카노");
		c2.orderName("카페라떼");
		c3.orderName("카페모카");
		c1.orderCoffee("카페라떼", 3000, 4);
		System.out.println(" #리턴값# ");
		System.out.println("총비용: "+c1.getPay()+"원");
		System.out.println("주문한 커피: "+c1.getName());
		System.out.println("*빌지*\n"+ c1.showAll());
	}
}
class Caffee{
	String type;
	int price;
	int cnt;
	void orderName(String inputordername){
		this.type = inputordername;
		System.out.print(type+"\t");
	}
	void orderCoffee(String inputordername,int inputprice,int inputcnt) {
		this.type = inputordername;
		this.price = inputprice;
		this.cnt = inputcnt;
		System.out.println("\n주문커피종류,가격,갯수 저장값 :\n"+type+","+price+"원,"+cnt+"개");
	}
	int getPay(){
		return price*cnt;
	}
	String getName() {
		return type;
	}
	String showAll() {
		return "주문커피종류: "+type+"\t가격: "+price+"원\t갯수: "+cnt+"개\n총액: "+getPay()+"원";
	}
}
*/
	/* 
	[1단계:확인] 2. [필드+로직처리] Gugu 클래스 선언
          필드 : 단수, 시작단수, 마지막단수
      메서드 : schGrade - 단수지정
          showResult - 해당 단수의 1~9까지 연산 출력
          setFromTo - 시작단수,마지막단수 지정
          showResult2 - 범위가 있는 단수 출력
		Gugu g1 = new Gugu();
		System.out.println("단수지정: "+g1.schGrade());
		g1.showResult();
		System.out.println("시작단수,마지막 단수: "+ g1.setFromTo());
		g1.showResult2();
	}
}
class Gugu{
	int grade;
	int start;
	int last;
	int schGrade() {
		this.grade = 7;
		return this.grade;
	}
	void showResult() {
		for(int cnt=1;cnt<=9;cnt++) {
			System.out.println(this.grade+"*"+cnt+"="+this.grade*cnt);
		}
	}
	String setFromTo() {
		this.start = 1;
		this.last = 8;
		return this.start+" ~ "+this.last;
			}
		
	void showResult2() {
		for(int grade=this.start;grade<=this.last;grade++) {
		for(int cnt=1;cnt<=9;cnt++){
		System.out.print(grade+"*"+cnt+"="+grade*cnt+(cnt==9?"\n":"\t"));
		}
		}
	}
}
	*/
	/*
	 3. [필드+로직처리] Bus 클래스 선언
     필드 : 버스번호, 구간, 비용
     메서드 : basicInfo - 입력 버스번호, 구간, 비용
        takeBus - 입력 : 인원수 리턴:비용*인원수
                화면 출력 : 구간 @@ 인  @@번 @@명 탑승
      */
		Bus b1 = new Bus();
		b1.basicInfo(1500, "홍대입구", 2500);
		b1.takeBus(20);
		System.out.println("구간 "+b1.busSection+"인 "+b1.busNumber+"번 "+b1.busCnt+"명 탑승");
		System.out.println("총비용: "+b1.takeBus(20)+"원");
	}
}
class Bus{
	int busNumber;
	String busSection;
	int busPrice;
	int busCnt;
	void basicInfo(int inputNumber, String inputSection,int inputPrice){
		this.busNumber = inputNumber;
		this.busSection = inputSection;
		this.busPrice = inputPrice;
		System.out.println("# 입력값 #");
		System.out.println("버스번호: "+inputNumber+"\t구간: "+inputSection+"\t비용: "+inputPrice);
	}
	int takeBus(int cnt){
		this.busCnt = cnt;
		return busPrice*cnt;
	}
}
		
	