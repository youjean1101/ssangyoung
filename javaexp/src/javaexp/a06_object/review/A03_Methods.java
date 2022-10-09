package javaexp.a06_object.review;

public class A03_Methods {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 메서드
		 	1) 필드와 상호관계 속에서 데이터를 처리.
		 		ex> 물건 구매시, 구매 물건의 갯수를 저장 및 전체 계 호출. 
		 		
		 	2) 주요 기능 처리
		 		- 리턴타입/실제리턴값
		 			메서드는 리턴타입을 먼저하고 그 리턴타입에 맞는 데이터를 
		 			마지막에 return으로 처리하여야 한다.
		 			리턴값이 없으면 void를 선언한다.
		 		- 매개변수 처리
		 			이 객체를 호출하는 외부 객체나 main()에서 데이터를 넘겨서 처리할 때,
		 			필요로 한다.
		 		- {}(중괄호블럭안)에 처리할 프로세스 처리.
		 */
		
		Person2 p01 = new Person2();
		System.out.println(p01.getStr());
		String ret = p01.getStr();
		System.out.println("리턴문자:"+ret);
		System.out.println("필드 리턴:"+p01.getName());
		
		// ex> 클래스로 Computer를 선언하고, 필드로 컴퓨터명을선언,
		//	메서드1 : 컴퓨터이름, 메서드2 : 컴퓨터의 수량리턴(임의로 지정)
		//	해당 메서드를 호출하여 변수에 할당 또는 출력하세요.
		Computer c1 = new Computer();
		System.out.println(c1.getname());
		String name01 = c1.getname();
		System.out.println("이름:"+name01);
		int cnt01 = c1.getcnt();
		System.out.println("리턴 값과 +10:"+(cnt01+10));
		c1.showInfo();
		System.out.println("컴퓨터 현재 상태:"+c1.curOnOff());
		c1.pushBtn(true);
		System.out.println("컴퓨터 현재 상태:"+c1.curOnOff());
		// ex> Mart 클래스선언 필드 pcnt(구매한 물건의 갯수), 
		// 기능메서드 buyProd(int cnt) 매개변수로 한번에 구매한 물건의 갯수를 누적 처리
		// getProduct()는 리턴값 pcnt로 처리하여 현재 구매한 물건갯수를 확인할 수 있도록 처리.
		
		Mart m1 = new Mart();
		m1.buyProd(3);
		m1.buyProd(4);
		m1.buyProd(5);
//		int outcnt = new m1.buyProd(3);
		System.out.println("현재 구매한 물건의 누적 갯수:"+m1.getProduct());
		m1.buyProdName("사과");
		m1.buyProdName("바나나");
		m1.buyProdName("딸기");
		System.out.println("# 구매리스트 #");
		System.out.println(m1.prodlist());
		m1.buyProd("사과");
		m1.buyProd("바나나");
		m1.buyProd("딸기");
		m1.buyProd("포도");
		m1.buyProd("멜론");
		m1.buyProd("수박");
		m1.showList();
	}
	
}
class Mart{
	// 초기에 데이터 할당하는 부분은 생성자를 통해서 처리
	// 계속 변경을 하고 호출하는 부분은 메서드를 통해서 처리
	int pcnt;
	String pnames;
	String[] buylist;
	int buyIdx;
	Mart(){
		this.pnames ="";  // NULL값을 없애줌.
		buylist = new String[5];
	}
	void buyProd(String pname) {
		if(buyIdx<5) {
		buylist[buyIdx++] = pname;
		}else {
			System.out.println("물건은 5개까지 구매가능 합니다.");
		}
	}
	void showList() {
		for(int idx=0;idx<buylist.length;idx++) {
			System.out.println(idx+1+")"+buylist[idx]);
		}
	}
	
	void buyProd(int cnt) {
		System.out.println("이번에 구매한 물건 갯수:"+cnt);
		this.pcnt += cnt;
	}
	// 구매한 물건을 매개변수로 누적 처리하는 메서드.. 사과, 바나나, ...
	void buyProdName(String pname) {
		System.out.println("구매한 물건 :"+pname);
		this.pnames += pname+",";
	}
	//현재 구매된 물건 리스트를 출력
	String prodlist() {
		return this.pnames;
	}
	
	int getProduct() {
		return this.pcnt;
	}	
}
class Computer{
	String comname;
	boolean isOper; //boolean은 설정하지 않으면 default false //저장값
	Computer(){
		this.comname = "보통컴퓨터";
	}
	Computer(String name){
		this.comname = name;
	}
	void pushBtn(boolean on_or_off) {
		isOper = on_or_off; //입력값을 저장값에 넣음
	}
	String curOnOff() {
		return isOper?"가동중":"중지중"; // 저장값에 조건을 걸어서 해당값 출력(return)
	}
	

	void showInfo() {
		System.out.println("컴퓨터 이름:"+this.comname);
	}
	String getname() {
		return this.comname;
	}
	
	int getcnt() {
			return 25;
	}
	int getcnt2() {
		int cnt = 5;
		return cnt;		
	}
	
	
}
class Person2{
	String name;
	Person2(){
		this.name = "무명";
	}
	// 문자열 리턴하는 경우
	String getStr() {
		return "안녕하세요.";	//바로 리턴
	}
	int getInt() {
		int num01 = 25;
		return num01; 	//선언된 데이터를 할당 후 리턴
	}
	String getName() {
		return this.name;	// 필드값을 리턴
	}
	void show() {
		// 리턴값이 없는 경우는 void
		System.out.println("이름을 출력:"+this.name);
	}
	
}
