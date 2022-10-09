package javaexp.z01_homework;

import java.util.Scanner;

public class A06_0905 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2022-09-05
		[1단계:개념] *1. stack영역과 heap영역의 차이점을 기술하세요.
			객체를 사용하느냐에 따라 heap 영역의 사용여부를 결정한다.
			stack영역
			1. 기본 데이터 유형 : 변수명 선언과 실제 데이터 할당
			2. 객체 유형 : 변수명 선언과 heap영역 주소값 할당.
			heap영역
			1. 객체 유형에 실제 객체 유형의 데이터 할당.
			
		[1단계:코드] *2. 정수형 배열(arr05)로 물건의 가격을 3개 할당하고, 새로운 배열 변수(arr06)에 물건의 가격 변수(arry05)
      		를 할당하고 arr06에 중간데이터를 변경 후 두 변수를 비교시 동일한 데이터가 나오는 이유를 기술하세요.
      		
			int[] arr05 = {3000, 4000, 5000};
			// stack영역에 arr05라는 이름으로 실제 할당된 heap영역의 주소를 저장
			// heap영역에는 {3000, 4000, 5000} 객체 데이터를 저장.
			int []arr06 = arr05;
			// arr05에 있는 할당되어 있는 stack 영역에 있는 주소를 복사해서 arr06에 할당
			arr06[1] = 7000;
			System.out.println("중간 데이터 변경(arr06[1]):"+arr06[1]);
			System.out.println("#변경 후, 데이터 arr05[]의 데이터 확인:"+arr05[1]);
			// 주소값이 같으므로 한쪽에 있는 데이터(arr06[1])를 변경하더라도 다른쪽 데이터(arr05[1])가 변경되는 것을 
			// 확인 할 수 있다.
		
      		
		[1단계:개념]* 3. 객체형 데이터를 선언하여 초기화(null)후, 구성요소를 호출할 때 나오는 에러와 원인을 예제를 통해서
      설명하세요
      
		int[] arry07;
		arry07 = null;
		Person p01;
		p01 = null;
//		System.out.println("배열 구성 요소 호출:"+arry07[0]); NullPointerException
//		System.out.println("배열 구성 요소 호출:"+p01.name); NullPointerException
		// heap 영역에 객체가 만들어져 있지 않는 상황에서 구성요소를 호출하므로 에러가 발생한다.
		arry07 = new int[] {100,200,300};
		p01 = new Person();
		System.out.println("배열 구성 요소 호출:"+arry07[0]);
		System.out.println("객체 구성 요소 호출:"+p01.name);
		// heap 영역에 객체가 만들어 진 후에는 구성요소를 호출하여도 에러가 발생하지 않는다.
		
		
		[1단계:개념] 4. 배열에서 사용하는 구성요소와 선언 및 할당 처리를 기본 예제와 함께 설명하세요.
		[1단계:코드] 5. 유럽챔피언스리그 팀과 성적을 배열로 선언하고 출력하세요.
		[1단계:코드] *6. 학생3명의 이름과 국어 점수를 배열로 선언하고 Scanner로 입력한 후, 출력하세요.
		
		// 데이터를 할당할 수 있게 배열 객체 선언/객체 생성
		String[]names = new String[3];
		int[] kors = new int[3];
		Scanner sc = new Scanner(System.in);
		for(int idx=0;idx<names.length;idx++) {
			System.out.println(idx+1+"번째 학생의 이름 입력:");
			names[idx] = sc.nextLine();
			System.out.println(idx+1+"번째 학생의 국어점수 입력:");
			kors[idx] = Integer.parseInt(sc.nextLine());
		}
		System.out.println("번호\t이름\t국어점수");
		for(int idx=0;idx<names.length;idx++) {
			System.out.println(idx+1+"\t"+names[idx]+"\t"+kors[idx]);
		}
		
		
		[3단계:코드] *7. 임시비번에 사용할 임의의 데이터를 입력후(갯수 입력 후 문자입력), 문자 5개로 구성된 임시 비밀번호를 생성출력하세요.
		 
		// 임시비밀번호로 사용할 배열 선언 후,
		String[] tmpStrs = new String[10];
		Scanner sc2 = new Scanner(System.in);
		System.out.println("비밀번호를 사용할 문자열 10개를 입력하세요.");
		for (int idx=0;idx<tmpStrs.length;idx++) {
			System.out.println(idx+1+"번째 문자열 입력:");
			tmpStrs[idx] = sc2.nextLine();
		}
		System.out.println("비밀번호로 사용할 문자열");
		for (int idx=0;idx<tmpStrs.length;idx++) {
			System.out.print(tmpStrs[idx]+",");
		}
		String tmPass = "";
		for(int cnt=1;cnt<=5;cnt++) {
			int rIdx = (int)(Math.random()*tmpStrs.length);
			tmPass+=tmpStrs[rIdx];
		}
		System.out.println("임시 비밀번호 : "+ tmPass);
		*/
		/*
		for(int cnt=1;cnt<=200;cnt++) {
			System.out.println(cnt+":"+(char)cnt);
		}
		*/
		// 48~57(숫자),65~90(알파벳 대문자), 97~122(알파벳 소문자) : 배열을 char로 만들어서 이 범위에 있는 문자만 입력, 랜덤
		// 33~126 : 숫자, 소문자, 대문자, 특수문자
		char []tmpPassC = new char[8];
		for(int idx=0;idx<tmpPassC.length;idx++) {
			int ranCod = (int)(Math.random()*93+33); //경우의 수 93가지 시작수 33
			tmpPassC[idx] = (char)ranCod;
		}
		for(int idx =0; idx<tmpPassC.length;idx++) {
			System.out.print(tmpPassC[idx]);
		}
		System.out.println();
		// char[] ==> String으로 변환 처리
		String tmpPass = new String(tmpPassC);
		System.out.println("최종 임시비번"+tmpPass);
//		Scanner sc = new Scanner(System.in);
//		char c = sc.nextLine;
//		System.out.println("문자:"); // 쓰다 마심.
	}

}
class Person{
	String name="홍길동";
	}
