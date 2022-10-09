package javaexp.z01_homework;

public class A02_0830 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//      2022-08-30
//      [1단계:개념] 1. 기본 출력형식과 특수문자에 대하여 예제를 통해 기술하세요
			/*
			 1) 메서드
			 	System.out.println(); // 줄바꿈
			 	System.out.print(); //줄변경없이
			 2) 출력처리 내용
			 	\n : 문자열로 줄바꿈 기능 포함
			 	\t : 문자열로 탭간격 처리
			 	\"
			 	System.out.print("사과\t바나나\t")
			 */
		
//      [1단계:개념] 2. 변수명의 선언 규칙을 예제를 통하여 기술하세요.
			/*
			 1) 숫자는 첫자로 사용하지 않아야 한다.
			 	int 10num; (X) int num01; (O)
			 2) 변수명에 특수문자는 허용되지 않는다. 단, _,$는 허가된다.
			 	int $name; (O), String #alias; (X)
			 3) 대소문자는 구분하여 다른 변수명으로 인식한다.
			 	int num01;
			 	int nuM01;
			 4) 명령어(내장 keyword)는 변수명으로 사용하지 못한다.
			 	int if; (X)
			 5) 합성어는 대문자를 시작으로 구분하여 사용한다. (가독성)
			 	String setName;
			 */
		
//      [1단계:코드] 3. 21억, 15억 데이터를 int에 할당하고, 합산결과를 변수를 선언하여 할당 출력하세요
		int num01 = 2100000000;
		int num02 = 1500000000;
		int sum = num01+num02;
		long sum2 = (long)num01+(long)num02;
		System.out.println("합산결과:"+sum);
		System.out.println("합산결과:"+sum2);
		
//      [1단계:개념] 4. 150라는 데이터는 기본데이터유형 중에 어디에 할당이 가능한가를 기술하고 그 이유에 대하여 설명하세요
		/*
		 150은 byte 범위는 1byte 초과하여 할당이 불가능하여 에러가 발생하고, 
		 그외 2byte 이상의 데이터유형에는 할당이 가능하다.
		 */
//		byte num11 = 150;
		short num12 = 150;
		int num13 = 150;
		long num14 = 150;
		System.out.println(num12);
		System.out.println(num13);
		System.out.println(num14);
		
//      [2단계:코드] 5. 알파벳의 코드값 범위와 문자 0부터 9까지 범위의 코드값 범위를 확인하고 출력하세요.
		// A~Z, a~z
		int code13 = 'A';
		int code14 = 'Z';
		int code15 = 'a';
		int code16 = 'z';
		System.out.println("알파벳");
		System.out.println("A:"+code13);
		System.out.println("Z:"+code14);
		System.out.println("a:"+code15);
		System.out.println("z:"+code16);
		int code11 = '0';
		int code12 = '9';
		System.out.println("코드값:"+code11);
		System.out.println("코드값:"+code12);
		//48~57
		for(int cnt =48; cnt<=57; cnt++) {
			System.out.println(cnt+":"+(char)cnt);
		}
		
//      [1단계:개념] 6. 형변환 두가지 유형을 예제를 통해서 기술하고 설명하세요..
		/*
		 	형변환은 데이터유형(타입)이 변경되는 것을 말한다.
		 	크게 promote(자동형변환)과 casting(강제형변환)이 있다. 
		 	promote는 보통 작은 데이터유형의 데이터를 큰데이터유형에 할당할 때, 주로 발생하는데, 
		 	별다른 처리없이 데이터를 할당하여 변경되는 것
		 */
		int num30 = 10;
		double num31 = num30;
		System.out.println(num30);
		
//      [1단계:코드] 7. 500cc의 오렌지쥬스를 3잔에 나누어 할당할려고 한다. 소숫점 이하가 처리된 경우와
//            소숫점 이하가 처리되지 않는 경우를 나누어 코딩하세요
			int juicy = 500;
			int glasses = 3;
			System.out.println("한장당용량(int):"+(juicy/glasses));
			System.out.println("한장당용량(double):"+(double)juicy/glasses);
	//1.
		//System.out.println(); 
	 	// 메시지를 출력하고 마지막에 enter처리를 한다.
	 	//System.out.print();
	 	//메시지를 출력하고 enter처리를 하지 않는다.
		//예제
	/*
		System.out.println("homework");
		System.out.println("homework");
		System.out.println("homework");
		
		System.out.print("homework");
		System.out.print("homework");
		System.out.print("homework");
		
		System.out.println("쌍\n용\n강\n북");
		System.out.println("교\t육\t센\t터\t");
		
	//3. 
		int A = 2100000000;
		int B = 1500000000;
		long tot = (long)A+B;
		
		System.out.println(A);
		System.out.println(B);
		System.out.println(tot);
		
		
		*/
		
	}

}
