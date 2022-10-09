package javaexp.a06_object.review;

public class A02_Constructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BasePlayer p1 = new BasePlayer();
		System.out.println("# 입력 없는 초기값 #");
		System.out.println("팀명: "+p1.teamname);
		System.out.println("이름: " +p1.name);
		System.out.println("타율:"+p1.hitRatio);
		BasePlayer p2 = new BasePlayer("SSG","김광현",0.687);
		System.out.println("# 매개변수가 있는 초기값 #");
		System.out.println("팀명: "+p2.teamname);
		System.out.println("이름: " +p2.name);
		System.out.println("타율:"+p2.hitRatio);
		
		Product pd1 = new Product();
		System.out.println("#매개변수 지정안한 상품#");
		System.out.println("상품명 : "+pd1.name);
		System.out.println("가격 : "+pd1.price+"원");
		System.out.println("상품 갯수 : "+pd1.cnt+"객");
		
		Product pd2 = new Product("양말");
		System.out.println("#매개변수 1개만 지정한 상품#");
		System.out.println("상품명 : "+pd2.name);
		System.out.println("가격 : "+pd2.price+"원");
		System.out.println("상품 갯수 : "+pd2.cnt+"개");
		
		Product pd3 = new Product("양말",3);
		System.out.println("#매개변수 2개 지정한 상품#");
		System.out.println("상품명 : "+pd3.name);
		System.out.println("가격 : "+pd3.price+"원");
		System.out.println("상품 갯수 : "+pd3.cnt+"개");
		
		Product pd4 = new Product(3,"양말");
		System.out.println("#매개변수 2개 순서변경한 상품#");
		System.out.println("상품명 : "+pd4.name);
		System.out.println("가격 : "+pd4.price+"원");
		System.out.println("상품 갯수 : "+pd4.cnt+"개");
		
		Product pd5 = new Product("양말",2500,3);
		System.out.println("#매개변수 3개 지정한 상품#");
		System.out.println("상품명 : "+pd5.name);
		System.out.println("가격 : "+pd5.price+"원");
		System.out.println("상품 갯수 : "+pd5.cnt+"개");
		
		Product pd6 = new Product(2500,3);
		System.out.println("#매개변수 타입이 같은 상품#");
		System.out.println("상품명 : "+pd6.name);
		System.out.println("가격 : "+pd6.price+"원");
		System.out.println("상품 갯수 : "+pd6.cnt+"개");
		
	}
	// ex> BasePlayer 클래스를 선언하고 팀명, 이름, 타율을 필드로
	//		선언하고, 생성자를 통해서 팀명과 이름을 초기화하고 출력하세요.
}
class BasePlayer{
	String teamname;
	String name;
	double hitRatio;
	/*
	 # 생성자 overloading
	 1. 생성자를 선언할 수 있는 규칙을 말한다. - 메서드 오버로딩 규칙과 동일
	 2. 규칙
	 	1) 매개변수의 *갯수가 다를 때
	 	2) 매개변수의 갯수가 같더라도 *타입이 다를 때
	 	3) 매개변수의 갯수가 같고 타입이 같더라도 타입이 선언된 *순서가 다를 때 
	 */
	
	
	BasePlayer(){
		// 외부 입력 없이 초기화
		this.teamname = ""; // 안할경우, String은 default 초기값 null
		this.name = "";
	}
//	BasePlayer(매개변수){}
	BasePlayer(String teamnm, String nm, double hitRatio){
		this.teamname = teamnm;
		this.name = nm;
		this.hitRatio = hitRatio;
	}
	BasePlayer(String teamnm, double hitRatio){
		this.teamname = teamnm;
		this.hitRatio = hitRatio;
	}
	BasePlayer(double hitRatio,String teamnm){
		this.teamname = teamnm;
		this.hitRatio = hitRatio;
	}
	// 클래스 내에는 오버로딩 규칙에 의해 여러 생성자를 선언할 수 있고
	// 객체를 생성할 때는 이 중에 하나만 사용하여 처리할 수 있다.
	// BasePlayer b1 = new BasePlayer("해태", 0.275);
	// BasePlayer b2 = new BasePlayer(0.301,"LG");	
}
// ex> 물건 클래스에 필드로 물건명 가격 갯수를 선언하되,
//		오버로딩 규칙에 의해서 생성자를 선언해 보세요.
class Product{
	String name;
	int price;
	int cnt;
	Product(){
		this.name = " ";
	}
	Product(String nm){
		this.name = nm;
	}
	Product(int price){
		this.price = price;
	}
	//타입
	Product(int price,int cnt){
		this(); // 정의된 생성자를 호출할 때 사용
		this.price = price;
		this.cnt = cnt;
	}
	//순서가 다른(타입이 다를 때만 가능)
	Product(String nm,int cnt){
		this.name = nm;
		this.cnt = cnt;
	}
	Product(int cnt,String nm){
		this.name = nm;
		this.cnt = cnt;
	}
	//갯수
	Product(String nm,int price,int cnt){
		this.name = nm;
		this.price = price;
		this.cnt = cnt;
	}
	
}


