package javaexp.z01_homework;

import java.util.Scanner;

public class A09_0907_test {

	private static Object id;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
 		2. 자바의 기본데이터 유형으로 class ExpConst에 데이터를 할당하고, 
 		생성자에 할당된 데이터를 출력하세요.
		
		ExpConst E1 = new ExpConst("어렵네요ㅠ-ㅠ", 7);

	}

}
class ExpConst{
	String data01;
	int data02;
	ExpConst(String data01,int data02){
		this.data01 = data01;
		this.data02 = data02;
		System.out.println("할당된 데이터(문자):"+data01+"\n할당된 데이터(숫자):"+data02);
	}
	
	
}
*/
		/*	
 			 4. AutoSeller 클래스 선언 메서드 insertCoin()를 통해서 입력된 동전을 필드 
    	 curMoney에 누적 저장하고, getCurMoney()를 통해 현재 저장된 돈을 리턴 처리하는 기능을 처리하세요.
		 
		
		AutiSeller a1 = new AutiSeller();
		System.out.println(a1.A);
		
	}
}
class AutiSeller {
	 Scanner sc = new Scanner(System.in);
	 int curMoney;
	 void insertCoin() {
	      while(true) {
	         System.out.println("동전 금액을 입력하세요.(완료시 0을 입력)");
	         int num = sc.nextInt();
	         if(num==0) {
	            break;
	         }
	         else {
	            curMoney += num;
	         }
	      }      
	  }
	 int getCurMoney() {
	      return curMoney;
	   }
}
	*/
		/*
		5. GoTravel 클래스를 선언하고  오버로딩의 원칙에 따라 메서드를 선언하되 
	      - 리턴유형을 void
	      1) setTarget : 목적지를 1, 2, 3개로 선언하여 출력
	      2) setTarget : 비용을 선언하는 내용 처리 
	      3) setTarget : 목적지와 비용을 순서를 다르게 선언 출력..
		출력 예시입니다.
		#여행지 1개#
		목적지1개:남해안
		#여행지 3개#
		목적지1:남해안
		목적지2:부산
		목적지3:경포대
		#여행지 1개#
		비용:1000000
		#여행지와 비용(목적지, 비용)#
		목적지:제주도
		비용:1000000
		#여행지와 비용(비용, 목적지)#
		목적지:동남아
		비용:1000000
	
		GoTravel G1= new GoTravel();
		G1.setTarget("제주도","동남아","목포");
		G1.setTarget(100000);
		G1.setTarget("제주도",300000);
		G1.setTarget(300000,"목포");
	}
}
class GoTravel{
	String destin;
	int cost;
	void setTarget(String destin1,String destin2,String destin3) {
		this.destin = destin1;
		this.destin = destin2;
		this.destin = destin3;
		System.out.println("#여행지3개#");
		System.out.println("목적지1:"+destin1);
		System.out.println("목적지2:"+destin2);
		System.out.println("목적지3:"+destin3);
	}
	void setTarget(int cost) {
		this.cost = cost;
		System.out.println("#여행지비용#");
		System.out.println("비용:"+cost);
	}
	void setTarget(String destini,int cost) {
		this.destin = destin;
		this.cost = cost;
		System.out.println("#여행지와 비용(목적지, 비용)#");
		System.out.println("목적지:"+destin);
		System.out.println("비용:"+cost);
	}
	void setTarget(int cost,String destini) {
		this.cost = cost;
		this.destin = destin;
		System.out.println("#여행지와 비용(비용, 목적지)#");
		System.out.println("비용:"+cost);
		System.out.println("목적지:"+destin);
	}
	void setTarget(String destini) {
		this.destin = destin;
		System.out.println("#여행지#");
		System.out.println("목적지:"+destin);
	}
}
		 */
		/*
		6. BuyProduct 클래스를 선언하고, 생성자를 통해서 물건명과 가격을 초기화하고
      getProdName(), getProdPrice(),  물건명, 가격(정수) 리턴
      buyProd() 매개변수로 갯수를 할당, 가격과 연산하여 계를 리턴하게 처리하게 하세요.
		
		BuyProduct b1 = new BuyProduct("양말",2500);
		System.out.println("총합계: "+b1.buyProd(3));
	}
}
class BuyProduct {
	String name;
	int price;
	int cnt;
	BuyProduct(String name,int price){
		this.name=name;
		this.price=price;
		System.out.println("물건명 :"+name);
		System.out.println("가격 :"+price);
	}
	String getProdName() {
		return name;
	}
	int getProdPrice() {
		return price;
	}
	int buyProd(int cnt) {
		return price*cnt;
	}
}
*/
		/*
		 7. Member클래스로 선언하여 login()에 매개변수로 id, pass를 입력하여 himan/7777일 때, 로그인
      성공문자리턴, 그외는 로그인실패문자리턴처리.
		 */
		/*Scanner sc = new Scanner(System.in);
		System.out.println("# 로그인 #");
		System.out.println("아이디를 입력하세요:");
		String inputid = sc.nextLine();
		System.out.println("패스워드를 입력하세요:");
		int inputpass = sc.nextInt();
		*/
		Member m1 = new Member();
		
		System.out.println(m1.login("admin",1234));
		System.out.println(m1.login("himan",1234));
		System.out.println(m1.login("admin",7777));
		System.out.println(m1.login("himan",7777));

	}
}
class Member{
	String login(String id, int pass){
		if(id.equals("himan")&&pass == 7777) {
	         return "# 로그인 성공 #";
		}
		else{
			return "# 로그인 실패 #";}
	}
}



