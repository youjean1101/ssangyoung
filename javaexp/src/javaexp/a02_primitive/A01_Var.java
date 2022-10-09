package javaexp.a02_primitive;

public class A01_Var {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 변수의 초기화
		 1. 변수는 초기화가 되어야 읽기가 가능하다.
		 */
		int num01; // 변수의 선언
//		int tot = num01 + 10; 초기화되지 않아서 에러를 발생
		num01 = 3;
		//cf) 클래스의 필드(전역변수)는 초기화 하지 않고, 사용이 가능하다.
		int tot2 = num01 + 10; //초기화 되어 사용이 가능.
		/*
		 # 리터럴
		 1. 소스 코드 내에서 직접 입력된 변수의 초기값
		 ex) int num02 = 3;
		 num02 변수에서 3이라는 정수형 데이터가 리터럴이라고 한다.
		 2. 리터럴 변수는 정수형, 실수형, 문자열 등 사용한다.
		 # 변수의 사용 범위
		 1. 변수는 {}(중괄호)를 기준으로 상하위 계층관계를 가지고 처리할 수 있다.
		 	반복문/조건문, 클래스/메서드에서 언급
		 2. 즉, 상위단계에서 선언된 내 변수는 하위에서 호출하여 사용되고
		 3. 하위 단계에서 선언된 변수는 상위에서 선언 및 호출하지 못한다.
		 # primitive 데이터 타입
		 1. 자바에서는 기본 stack 영역에서 선언 및 호출, 할당되는 기본 데이터 타입으로 정수, 실수, 문자,
		  논리형이 있다. 
		  ps) 자바는 크게 메모리를  stack, heap 으로 나누어서 사용한다.
		  	  작은 메모리인 기본 데이터 유형은 stack영역에 선언과 저장을 동시에 처리하고 있고,
		  	  이런 기본 유형을 모아서 리스트한 배열이나, 객체유형은 stack영역에는 주소를 heap영역의 주소를 
		  	  저장하고, 실제 배열/객체는 heap영역에 저장처리한다.  
		  	  
		 2. 메모리의 최소 기억단위인 bit가 8개 모여서 byte가 됨으로 시작되었다.
		 bit가 됨으로 시작되었다.
		 bit 0/1 ==> 7개 이진법으로 모여서 숫자를 처리
		 	 1개는 부호(+/-)
		 	 -128~127
		 	 byte : 정수형의 가장 적은 데이터 단위
		 3. 정수형
		 		byte	1byte	-128~127
		 		char	2byte	0~65535
		 			문자를 담는데 유니코드로 숫자와 연결하여 처리한다.(**실무에 많이 쓰임)
		 			ps) 모스부호
		 				'A' ==> 문자
						 0 ==> 숫자
						'0' ==> 문자
						char유형은 int유형으로도 변경이 가능하고, 
						int 유형은 casting에 의해 문자 한자로 변경이 될수 있다. 
						
		 		short	2byte
		 		int		4byte (정수형의 default 데이터 유형)
		 			253, 연산자가 들어가는 순간 int형으로 promote가 된다.
		 			
		 		long	8byte
		 				ex) 21억 4천 이상의 데이터인 경우
		 					long형으로 선언하여 처리하여야 하는데, 
		 					정수형 기본 유형이 아니기에 L,l를 붙여야 
		 					사용할 수 있다. 
		 						234234234234234L	 					
		 */
		byte num03 = 25;
		short num02 = 25;
		// 할당할 수 있는 범위 안에 있으면 작은 데이터 유형
		// 모두 처리가 가능하다.
//		num01 =257; 범위가 넘어 에러 발생..
		char ch01 = 'A'; // 문자 한자는 ''홋따옴표 사이에 입력
		int code = ch01;
		System.out.println(ch01);
		System.out.println(code);
		char ch02 = (char)(code+1);
		System.out.println(ch02);
		// 0.0<=Math.random()<1.0
		System.out.println(Math.random());
		int ran1 = (int)(Math.random()*26+65);
		int ran2 = (int)(Math.random()*26+65);
		int ran3 = (int)(Math.random()*26+65);
		int ran4 = (int)(Math.random()*26+65);
//		System.out.println(ran);
		System.out.print((char)ran1);
		System.out.print((char)ran2);
		System.out.print((char)ran3);
		System.out.println((char)ran4);
		char c = '0';
		int cd01=c;
		System.out.println(cd01);
		for(int cnt =1 ; cnt<=200 ; cnt++ ) {
			System.out.println(cnt+":"+(char)cnt);
		}
		
		// 1. 문자는 ''사이에 한자를 입력하여, char로 할당할 수 있다.
		char ch03='B';
		// 2. 코드 값을 확인하기 위해서는 정수형 데이터에 바로 바로 할당하여 처리할 수 있다.
		int code03 = ch03;
		System.out.println(code03);
		//3. 정수형 변수를 선언하고, 해당 정수의 코드값에 해당하는 유니코드를 확인할려면, 
		// casting으로 확인할 수 있다.
		int code04 = 70;
		char ch04 = (char)code04;
		System.out.println(ch04);
		/*
		4. 실수형
			1) float : 4byte
			2) double : 8byte (실수형의 default 데이터 유형)
			
		 */
		double d01 = 2.242;
		float f01 = 3.42F; // float 유형일 때, F를 붙여서 사용함.
		
		/*
		 5. 논리형
		 	1) boolean
		 		true/false
		 */
		int point=90;
		boolean isPass = point>=80; //80점 이상일 때 합격.
		System.out.println("합격여부:"+isPass);
		boolean isPass2 = true;
		System.out.println("결과:"+isPass2);
		/*
		 ex1) 초기화 선언 확인
		 현재 나이를 변수로 선언하여, 초기화 되지 않을 때, 10년 후 나이를 처리하고, 
		 초기화한 후, 10년 후 나이를 처리하고 출력하세요.
		 ex2) 문자 'Z', '홍'의 유니코드 값을 확인하여 출력하세요.
		 ex3) 정수 데이터 100에 해당하는 문자를 출력하세요.
		 */
		// 1.
		int age;
//		int after = age+10; 초기화되지 않을 떄, 에러발생
		
		age = 28;
		int rsafter = age+10;
		
//		System.out.println(after); 
		System.out.println(rsafter);
		
		/*
		 => 정답
		 int age1;
		 int age110 = age1 + 10;
		 int age = 25;
		 int age10 = age + 10;
		 System.out.println(age);
		 */
	
		//2.
		char eng = 'Z';
		int Ecode = eng;
		char kor = '홍';
		int kcode = kor;
		
		System.out.println(Ecode);
		System.out.println(kcode);
		
		/* 
	 	-> 정답
	 	int code10 = 'Z';
	 	int code11 = '홍';
	 	System.out.println("Z의 코드:"+code10);
	 	System.out.println("홍의 코드:"+code11);
		 */
		
		//3. 
		/*
		 -> 정답
		  	int code12 ='가';
	 	System.out.println("가의 코드:"+code12);
		 */
	}
}
