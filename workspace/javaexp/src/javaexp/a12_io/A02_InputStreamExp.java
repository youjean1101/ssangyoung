package javaexp.a12_io;

import java.io.IOException;
import java.io.InputStream;

public class A02_InputStreamExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. 숫자
		 2. 문자 : 숫자의 코드값 생성
		 3. 입력 받는 데이터는 코드값과 매핑된 문자로 받을 수 있다.
		 
		 
		ex) A02_InputStreamExp.java를 만들고, InputStream에 의해서 
		 정답을 입력하세요.(1~4) : 를 통해 입력 받고, 해당 정답이 3이면 정답 그외는 
		 오답을 처리하세요. '3' vs 3 다름, code값과 코드는 다름.
		 */
//		정답
		System.out.println("정답을 입력하세요.(1~4):");
		InputStream is = System.in;
		int code;
		try {
			code = is.read(); // read()에서 가져오는 것은 code
			char inData = (char)code;	// code를 문자로 변환
			System.out.println("입력받은 번호:"+inData);
//			문자(char)를 숫자로 변환하기 위해 문자열로 바꾸고, 
//			Integer.parseInt() 등의 함수를 이용해서 처리하여야 한다.
//			문자 ==> 문자열	
//			1) ""+'안'
//			2) Character.valueOf('안').toString()
			char corNum = '3'; // 정답인 문자 '3'과 비교
			if(inData == corNum) {
				System.out.println("정답입니다.");
			}else {
				System.out.println("오답입니다.");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		/* 
		System.out.println(3=='3');
		System.out.println("문자 '3'의 코드값:"+((int)'3'));
		
		InputStream answer = null;
		System.out.println("정답을 입력하세요.(1~4)");
		answer = System.in;
		
		try {
			int anCode = answer.read();
//			System.out.println(anCode);
			// 1= 49,50,51,52
			if(anCode == 51) {
				System.out.println("정답입니다.");
			}else if(49>anCode || 52<anCode) {
				System.out.println("범위 밖을 입력하였습니다.");
			}else {
				System.out.println("오답입니다.");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
	}
}
