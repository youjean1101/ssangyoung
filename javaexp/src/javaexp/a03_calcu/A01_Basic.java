package javaexp.a03_calcu;

import java.util.Scanner;
public class A01_Basic {
	/*
	 # 연산이란?
	 1. 데이터를 처리하여 결과를 산출하는 것
	 2. 연산자(operations)
	 	연산에 사용되는 표시나 기호
	 	+, -, *, /, %,=, !=, ...
	 3. 피연산자(operand)
	 	연산 대상이 되는 데이터(리터럴, 변수)
	 4. 연산식(expressions)
	 	연산자와 피연산자를 이용하여 연산의 과정을 기술한 것
	 	ex> 25 + 2, num01 + num02
	 # 연산자의 종류
	 1. 산술연산자 : +, -, *, /, %
	 2. 부호 : +, -  ex> int num01 = -25; -num01;
	 3. 문자열 : + : 문자열과 문자열을 이어주는 역할
	 4. 대입 : =
	 		왼쪽데이터에서 오른쪽 변수에 할당
	 		int num01 = 25;
	 		증감대입연산자(사칙연산자적용)
	 		num01 = num01 + 2;
	 		num01 += 2;
	 		num01 += 5;
	 		num01 = num01 * 2;
	 		num01 *= 2;
	 		
	 5. 증감 : ++, --
	 		변수를 1씩 증가/감소처리
	 		cnt++;
	 		cnt--;
	 6. 비교 : true/false인 boolean값을 리턴처리
	 	==, != (!:not)
	 	int point=30;
	 	System.out.println(point==20); false
	 	System.out.println(point!=20); true (같지 않을 떄, true다)
	 	>, <, >=, <=
	 	point>=60 60이상일 떄, true
	 	instanceof 객체참조
	 7. 논리
	 		비교연산식이 2개이상 또는 not(!)를 처리시 사용.
	 		age>=14 && age<=18  (and)
	 			두가지 비교연산자가 모두 true 일때, true
	 		★	ex) id, pass 동일시..
	 			id == "himan" && pass="7777"
	 			id.equals("himan") && pass.equals("7777")
	 			*** 주의
	 			자바는 위와 같이 비교연산자로 문자열 비교하면 안된다. (자바만)
	 			"" ==> new String("") ==> heap 영역 사용.
	 			String id1 = new String("himan");
	 			String id2 = new String("himan");
	 			id1 == id2 false!!!!! // 같더라도, 다른데 저장이 되기 때문?
	 			id1.equals(id2) true !!!!!
	 			
	 		age < 5 || age >= 65 (or)
	 			두가지 비교연산자 중에 하나라도 true이면 true
	 		!(age>=14 && age<=18) (not) ==> age < 14 || age > 18
	 		!(age==13)
	 		
	 	
	 8. 조건(삼항)
	 	조건 ? A:B
	 	if(age>18){
	 		"성인"
	 	}else{
	 		"미성년자"
	 	}
	 	
	 	age>18 ? "성인" : "미성년자"
	 
	 # 연산의 방향과 우선 순위
	 1. 연산자의 방향은 기본적으로
	 	비교연산자 : 왼쪽에서 오른쪽으로 처리된다.
	 		age>=14 & age<=18 :
	 		 age가 14미만이더라도 age<=18을 check한다.
	 		age>=14 && age<=18 :
	 		  age가 14미만이면 age<=18을 check하지 않는다.
	 		  
	 	대입연산자 : 오른쪽에서 왼쪽으로 처리된다.
	 		age = 10;
	 2. 산술연산자 우선순위
	 	1) ()
	 		최상위 우선처리 연산자
	 		(2+5)*7 ==>49
	 	2) * / /
	 		곱셈과 나눗셈이 우선순위로 처리된다.
	 		2+5*7 ==? 37
	 	3) +/-
	 	cf) 산술연산자의 우선 순위는 결과의 차이가 있는 경우에 의미가 있기에 선언하고, 
	 		곱셈과 나눗셈, 덧셈과 뺼셈은 우선처리 순서에 따라 결과가 동일하기에 의미가 없다.
	 	
	 	ps) () - 소괄호
	 		{} - 중괄호
	 		[] - 대괄호
	 */
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 부호연산자
		 피연산자에 부호 기호 (+,-)를 붙여 양수와 음수를 처리하는 것을 말한다.
		 */
		/*
		int num01 = 25;
		int num02 = -5;
		int num03 = -num01;
		int num04 = -num02;
		System.out.println("num03:"+num03);
		System.out.println("num04:"+num04);
		*/
		// ex> 가계부를 아래와 같이 입력하여 출력할려고 한다.
		//  Scanner 사용/ 임의로 입력
		// 날짜	내용	지출 수입	현재잔액
		// @@@	@@@	@@@	@@@	@@@@
		//항목별로 임의로 처리해서 위 형식으로 처리하되
		//현재 잔액은 100000로 진행
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("날짜(00.00) :");
		String day = sc.nextLine();
		System.out.println("내용 :");
		String data = sc.nextLine();
		System.out.println("지출 :");
		int use = sc.nextInt();
		System.out.println("수입 :");
		int enter = sc.nextInt();
		int money = 10000;
		int a = money+enter-use;
		System.out.println("날짜\t내용\t지출\t수입\t현재잔액");
		System.out.print(day+"\t"+data+"\t"+use+"\t"+enter+"\t"+a);
		
		/*
		 String date = "08/31";
		 String con = "차비" ;
		 int spend = 5000;
		 int saving =0;
		 int rest = 100000;
		 System.out.print("날짜\t");
		 System.out.print("내용\t");
		 System.out.print("지출\t");
		 System.out.print("수입\t");
		 System.out.print("현재잔액\t");
		 System.out.print("\n"+date+"\t");
		 System.out.print(con+"\t");
		 System.out.print(spend+"\t");
		 System.out.print(saving+"\t");
		 rest+=(-spend+saving);
		 System.out.print(rest+"\t");
		*/
		
	}
	

}
