package javaexp.z01_homework;

public class A09_0907 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
[1단계:개념] 1. 생성자의 this()를 사용하는 경우와 규칙을 예제를 통하여 기술하세요.
[1단계:코드] 2. 자바의 기본데이터 유형으로 class ExpConst에 데이터를 할당하고, 생성자에 할당된 데이터를 출력하세요.
[1단계:개념] 3. 메서드의 기능적 구성요소를 기술하고 예제를 통해서 설명하세요.
[1단계:코드]* 4. AutoSeller 클래스 선언 메서드 insertCoin()를 통해서 입력된 동전을 필드 
      curMoney에 누적 저장하고, getCurMoney()를 통해
      현재 저장된 돈을 리턴 처리하는 기능을 처리하세요.
      
      	AutoSeller as = new AutoSeller();
		System.out.println("초기 현재 저장된 금액:"+as.getCurMoney());
		as.insertCoin(500);
		as.insertCoin(1000);
		as.insertCoin(1500);
		as.insertCoin(2000);
		System.out.println("현재 저장된 금액:"+as.getCurMoney());
		}	
	}
	class AutoSeller{
		int curMoney;
		void insertCoin(int money) {
			this.curMoney+=money; // 누적 저장
		}
		int getCurMoney() {
			return curMoney;
		}
	}
	*/
		/*
[1단계:코드]* 5. GoTravel 클래스를 선언하고  오버로딩의 원칙에 따라 메서드를 선언하되 
      - 리턴유형을 void
      1) setTarget : 목적지를 1, 2, 3개로 선언하여 출력
      2) setTarget : 비용을 선언하는 내용 처리 
      3) setTarget : 목적지와 비용을 순서를 다르게 선언 출력..
     
		GoTravel gt = new GoTravel();
		gt.setTarget("부산", "목포", "제주도");
		gt.setTarget("하와이");
		gt.setTarget(2000000);
		gt.setTarget("괌",3000000);
		gt.setTarget(2000000, "사이판");
		
		}
	}
class GoTravel{
	void setTarget(String loc1, String loc2, String loc3) {
		System.out.println("# 목적지 3개 메서드 #");
		System.out.println("목적지1:"+loc1);
		System.out.println("목적지2:"+loc2);
		System.out.println("목적지3:"+loc3);
	}
	void setTarget(String loc1) {
		System.out.println("# 목적지1 메서드 #");
		System.out.println("목적지 : "+loc1);
	}
	void setTarget(int pay) {
		System.out.println("# 비용 메서드 #");
		System.out.println("비용 : "+pay);
	}
	void setTarget(String loc1, int pay) {
		System.out.println("# 매개순서(목적지,비용) #");
		System.out.println("목적지 :"+ loc1);
		System.out.println("비용 :"+ pay);
	}
	void setTarget(int pay, String loc1) {
		System.out.println("# 매개순서(비용, 목적지) #");
		System.out.println("목적지 :"+ loc1);
		System.out.println("비용 :"+ pay);
	}
}
 */
		
		/*
[2단계:코드]* 6. BuyProduct 클래스를 선언하고, 생성자를 통해서 물건명과 가격을 초기화하고
      getProdName(), getProdPrice(),  물건명, 가격(정수) 리턴
      buyProd() 매개변수로 갯수를 할당, 가격과 연산하여 계를 리턴하게 처리하게 하세요.
      
		BuyProduct bp = new BuyProduct("사과",1200);
		System.out.println("구매 계:" + bp.buyProd(2));
		System.out.println("구매 계:" + bp.buyProd(3));
		System.out.println("구매 계:" + bp.buyProd(5));
		}
	}
		class BuyProduct{
			String name;
			int price;
			BuyProduct(String name, int price){
				this.name = name;
				this.price = price;
			}
			String getProdName() {
				return this.name;
			}
			int getProdPrice() {
				return this.price;
			}
			int buyProd(int cnt) {
				System.out.println("# 물건구매 #");
				System.out.println("물건명 :"+this.name);
				System.out.println("가격 :"+this.price);
				System.out.println("갯수:"+cnt);
				return this.price*cnt;
			}
		}
		*/
		/*
[1단계:코드]* 7. Member클래스로 선언하여 login()에 매개변수로 id, pass를 입력하여 himan/7777일 때, 로그인
      성공문자리턴, 그외는 로그인실패문자리턴처리.
 */		
		Member1 m1 = new Member1();
		System.out.println("login 결과:"+m1.login("himan", "7777"));
		System.out.println("login 결과:"+m1.login("himan2", "7777"));
	}
}
class Member1{
	String login(String id, String pass) {
		String result = "로그인 실패";
		if(id.equals("himan")&&pass.equals("7777")) {
			result = "로그인 성공";
		}
		return result;
	}
}
	
