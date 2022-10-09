package javaexp.a02_primitive;

public class A02_ChangeType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 타입변환
		1. 데이터 타입을 다른 타입으로 변환하는 것을 말한다.
			byte <--> int, int <--> double
		2. 종류
			1) 자동(묵시적) 타입 변환 : promotion
			2) 강제(명시적) 타입 변환 : casting
		# 자동타입 변환
		1. 프로그램 실행 도중 작은 타입은 큰 타입으로 자동
			타입변환이 일어날 수 있다.
			큰크기타입 = 작은 크기 타입
			byte < short < *int(정수형) < long (정수형) < float (실수형) < *double(실수형) // 실제데이터가 아닌 용기로 생각
			<객체형(배열, String, class를 통한 객체)
			ex) byte num01 = 25;
				int num02 = num01 + 30;
				byte타입의 데이터는 int 타입으로 형변환이 되어 할당되었다.
				num01 + 20 
		 */
		byte num01 = 30;
		short num02 = (short)(num01 +20); // 연산자로 int형 변환
		// short num05 = num01 +20; 에러발생
		// 주의 연산자가 추가되는 순간 데이터 유형은 int이상으로 되기때문에 int형 이상에 할당되어야 한다. 
		
		int num03 = num01+150; //자동형 변환으로 int형에 할당
		System.out.println(num03);
		double num04 = num03;
		System.out.println(num04);
		String str = ""+num04; // 앞에 ""로 인해 문자열로 변환
		System.out.println(str+10);
		
		// ex) byte 형으로 구매한 사과의 갯수와 바나나의 갯수를 합산하여 특정한 데이터 유형에 할당하세요.
		 byte apple = 2;
		 byte banana = 3;
		 int total = apple+banana;
		 
		 System.out.println("바나나와 사과의 갯수:"+total);
		 
		// 정답
		  byte appleCnt = 5;
		  byte bananaCnt = 10;
		  // byte fruitCnt = appleCnt+banaCnt; 에러이므로, int로 변환시켜줘야함
		 
		
		// ex) 소고기 600g을 정수로 선언하고, 7등분하여 출력하세요.
		int meat=600;
		byte sobun = 600/7; 
				
		System.out.println(sobun);
		
		// 정답
		int meat2 = 600;
		int div =7;
		System.out.println(meat2/div);
		System.out.println(meat2%div);
		System.out.println(meat2/(double)div);
		 
		 	
		// 문자열과 문자열을 이어주는 처리를 한다.
		/*
		 # 강제타입변환
		 1. 큰 타입을 작은 타입 단위로 쪼개기
		 2. 끝의 한부분만 작은 타입으로 강제적으로 변환.
		 3. 형식
		 		작은데이터유형 변수 = (작은데이터유형)큰데이터변수;
		 
		 ** 주의
		 	강제타입변환은 할당된 데이터를 기준으로 처리하는 것이 아니라, 
		 	데이터를 할당하는 유형이 무엇이냐에 따라 형변환 처리 casting을 하여야 한다. 
		 */
		int num99 = 10;
		// 실제할당된 데이터 기준으로 casting 하는 것이 아니라, 
		//데이터 유형을 기준으로 casting한다.
		byte num88 = (byte)num99;
		
		double dblVal = 3.14324234;
		int intVal = (int)dblVal;
		//int 형으로 강제로 변환이 필요할 때, 해당 타입을 선언하여 처리하는데, 
		//정수형 이외는 모두 삭제가 된다.
		System.out.println(intVal);
		// ** 객체의 상속관게에서 타입변환을 활용한다.
		// 		상위객체가 하위객체로 할당시...
	}

}
