package javaexp.a01_begin;

public class A04_VarBasic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 숫자형 변수 선언
		int num01; // num01이란 변수에 정수를 할당 하겠다고 선언
		num01 = 30; // 데이터 30을 할당..
		int num02 = 40; // num02를 선언과 할당.
		String name = "홍길동";
		// 문자열 : 문자의 배열
		// String이라는 문자열을 처리하는 데이터유형(객체형)을
		// 선언하고 데이터를 할당
		// "" :  문자열을 할당할 때, 쌍따옴표를 이용해서 할당한다.
		// name 이라는 변수에  홍길동이라는 문자열 데이터를 선언과
		// 할당 처리..
		// sysout + ctrl + space :  출력 메서드 자동 생성
		System.out.println();
		// + 기호 처리  
		// 1. 숫자에서 덧셈 연산처리
		//    25 + 5 
		// 2. 문자열과 문자열을 이어주는 개념
		//    "사과" + "빵"  : "사과빵"
		// 3. 숫자형 문자열은 이어주는 처리
		//"25" + "5" : "255"
		// "" + 25 + 5 :"255"
		// "" + (25 + 5) :"30"
		
		System.out.println("이름:"+name);
		System.out.println("합산:"+num01+num02);
		System.out.println("합산:"+(num01+num02));
		// 자동형변환 :  
		// 1. 문자열 + 숫자 ==> 자동형변환에 의해서 숫자는
		//    문자열로 변환
		//    30 ==> "30", 40 ==> "40"
		//    "30" + "40" ==> "3040"
		// 2. 자동형변환되기 전에 연산부터 처리할려면 ()를
		//    해 주어야한다.
//		숫자형 문자열의 숫자변환
//		1. int num01 = Integer.parseInt("숫자형 문자열")
//			ex) int num01 = Integer.parseInt("25")
//		2. double num01 = Double.parseInt("숫자형 문자열")
//			ex) double num01 = Double.praseInt("3.14")
//		()를 통해서 먼저 연상을 하고 + (문자열 연결)을 하여야 한다.	
// 			int price = Integer.parseInt(args[0]);
//			int data01 = Integer.parseInt(sc.nextLine());
		
		
		
		// ()를 통해서 먼저 연산을 하고 + (문자열 연결)을 하여야 한다.
		/*
		ex) 물건명(문자열), 가격(정수), 갯수(정수)를  선언과
		할당하고, 해당 내용을 출력하세요.
		물건명 : @@@
		가격 : @@@
		갯수 : @@@
		계 : @@@
		
		 * */
		String prodName = "사과";
		int price = 1200;
		int cnt = 3;
		System.out.println("물건명:"+prodName);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		System.out.println("계:"+(price*cnt));
		System.out.println("계(*,/):"+price*cnt);
		System.out.println("계(+):"+price+cnt);
//		System.out.println("계(-):"+price-cnt);
		// 앞에 문자열 데이터의 영향에 의해 숫자가 자동으로 
		// 문자열로 변환할 수 있으므로, 우선 연산자인 ()를 사용하여
		// 연산 후 처리가 될 수 있게 한다.
		// 주의 : 괄호가 없을 떄
		// *, / : 우선연산이 되고,
		// + : 자동형변환 문자열로 이어주는 처리
		// - : 에러발생
		System.out.println("계:"+price*cnt);
		
	}

}
