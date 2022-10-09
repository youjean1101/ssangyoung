package javaexp.a01_begin;

public class A05_VarDeclare {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 변수란?
		하나의 값을 저장할 수 있는 메모리 공간
		# 변수의 선언
		1. 형식 :  타입 변수이름;
			ex) int age; double value;
		# 변수 이름을 위한 명명 규칙
		1. 첫번째 글자는 문자이거나 $,_여야 하고 숫자로 시작할 
			수 없다(필수)
				cf)변수명에 특수문자는 허용되지 않는다.
				단, $,_만 예외적으로 허용
				
		2. 영어 대소문자가 구분된다(필수)
		3. 첫문자는 영어 소문자로 시작하되, 다른 단어가 붙을
			경우 첫자를 대문자로 한다. (가독성)
			
		4. 문자 수는 제한이 없다.
		5. 자바의 예약어는 사용할 수 없다.(필수)
			예약어 : 자바의 명령어로 변수로 사용되면 충돌이 발생하므로 사용이 불가능하다.
			int break01; 0
			
			
		*/		
		int $price = 300; // 사용가능
//		int #tot = 20; 에러발생.
		int num01 = 20;
		int nuM01 = 30;
//		int 10num = 50; 에러발생
		int maxSpeed = 170; // 가독성을 위해 합성어는 
		// 대문자로 구분한다.
//		String if = "홍길동";  예약어는 에러발생
		String if01 = "예약어"; // 변수 선언시 예약어를 벗어 나기 위한
		// 방법으로 뒤에 숫자를 붙여 준다.
		System.out.println($price);
		System.out.println(num01);
		System.out.println(nuM01);
		System.out.println(maxSpeed);
		System.out.println(if01);
		
	}

}
