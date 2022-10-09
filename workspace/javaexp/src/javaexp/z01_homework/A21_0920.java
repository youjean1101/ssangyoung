package javaexp.z01_homework;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class A21_0920 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2. 한글 무지개 색상 첫자를 코드값을 확인하여 임의의 색상 5가지를 문자열로 만들어 출력하세요.
		 # 처리 순서
		 1. 색상 문자열 선언
		 2. getBytes byte배열로 확인,
		 	새로 생성할 임의 색상 배열선언.
		 3. for 5번 호출 및 랜덤 호출
		 	임의 색상 코드값 배열에 할당.
		 4. new String(newByte) 할당 후 출력.
		 */
//		정답
		String rbColor2 = "ROY";
		
		String rbColor = "빨주노초파남보";
		// # char[] <==> String
		// .toCharArray() : String ==> char[]
		// String s = new String(char[]) : char[] ==> String
		char[] arr = rbColor.toCharArray();
		// 배열로 위 색상의 한글 코드값을 저장.
		char [] ranChar = new char[5];
		for(int cnt=1;cnt<=5;cnt++) {
			int rCIdx = (int)(Math.random()*arr.length);
			// "빨주노초파남보"를 char 배열로 만든 내용 중에 한개 임의 추출
			char charVal = arr[rCIdx];
			System.out.println(cnt+"번째 색:"+charVal);
			// 새로만든 ranChar에 하나씩 할당..
			ranChar[cnt-1] = charVal;
		}
		String ranColor = new String(ranChar);
		System.out.println("임의의 5가지 색상:"+ranColor);
		
		/*
		System.out.print("무지개 색상 첫자 코드값: ");
		System.out.print("{"+(int)'빨'+", ");
		System.out.print((int)'주'+", ");
		System.out.print((int)'노'+", ");
		System.out.print((int)'초'+", ");
		System.out.print((int)'파'+", ");
		System.out.print((int)'남'+", ");
		System.out.println((int)'보'+"}");

		int[] rainStr = {48744, 51452, 45432, 52488, 54028, 45224, 48372};
		for(int idx=0;idx<=5;idx++) {
			int ramrain =(int)(Math.random()*rainStr.length);
			char rainbow = (char)rainStr[ramrain];
			System.out.print(rainbow+" ");
		}
*/
			/*	3. Hello! 자바!를 한글 encoding방식
  				euc-kr와 utf-8로 설정하여 문자열로 출력하세요.
			 
		String homework = "Hello! 자바!";
		try {
			byte[] homebyte1 = homework.getBytes("EUC-KR");
			byte[] homebyte2 = homework.getBytes("UTF-8");
			String homeStr1 = new String(homebyte1);
			String homeStr2 = new String(homebyte2);
			System.out.println("EUC-KR: "+homebyte1);
			System.out.println("UTF-8: "+homebyte2);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		*/
		/*
		 5. switch case문을 활용하여 주문할 메뉴 짜장면, 짬뽕, 탕수육 입니다. indexOf를 사용하여 해당 메뉴가 있으면, 
		 @@번 메뉴 주문하였습니다.  없으면 없는 메뉴입니다로 표시하세요.
		 
		String menu = "주문할 수 있는 메뉴는 짜장면, 짬뽕, 탕수육 입니다.";
//		System.out.println(menu.indexOf("짜장면"));
//		System.out.println(menu.indexOf("짬뽕"));
//		System.out.println(menu.indexOf("탕수육"));
		// 13,18,22
		System.out.println(menu);
		System.out.println("주문하실 메뉴를 입력해주세요.");
		Scanner sc = new Scanner(System.in);
		String chinaFood = sc.nextLine();
		int findIdx = menu.indexOf(chinaFood);
		switch(findIdx) {
		case -1 : System.out.println("없는 메뉴입니다");
		case 13 : System.out.println("01번."+chinaFood+" 메뉴를 주문하였습니다.");break;
		case 18 : System.out.println("02번."+chinaFood+" 메뉴를 주문하였습니다.");break;
		case 22 : System.out.println("03번."+chinaFood+" 메뉴를 주문하였습니다.");break;
		default : System.out.println("입력범위 초과 등 기타 유효성 문제");break;
		}
		System.out.println("프로그램 종료!");
		*/
		/*
		  6. 다음과 같은 고등학교 학번을 아래 형식을 기준으로 입력받아 @@고등학교 @@학년 @@반 @@@로 출력하세요
              형식  "세화030523홍길동" ==> 세화고등학교 03학년 05반 23번 홍길동
	
		System.out.println("고등학교 학번 이름을 입력해주세요.(세화030523홍길동)");
		Scanner sc =new Scanner(System.in);
		String highShcoolInfo = sc.nextLine();
		if (highShcoolInfo.length()==11) {
			String school = highShcoolInfo.substring(0,2)+"고등학교 ";
			String age = highShcoolInfo.substring(2,4)+"학년 ";
			String clas = highShcoolInfo.substring(4,6)+"반 ";
			String number = highShcoolInfo.substring(6,8)+"번 ";
			String name = highShcoolInfo.substring(8,11);
			System.out.println(school+age+clas+number+name);
		}else {
			System.out.println("입력형식에 맞게 입력해주세요.");
		}
		*/
		/*
		7. 사과&3000&2-딸기&12000&3-오렌지&3000&3를 split을 이용해서 단위별로 출력(이중 for문 활용)하세요
			1)  - 구분자로 데이터 split 처리
			2) for문을 통해서 &구분자로 split 처리
			3) 출력 형식을 처리 
		*/
//		정답
			String data = "사과&3000&2-딸기&12000&3-오렌지&3000&3";
			String []lev1 = data.split("-");
			for(String str1:lev1) {
//				System.out.println(str1);
				String [] lev2 = str1.split("&");
				for(String str2:lev2) {
					System.out.println(str2+"\t");
				}
				System.out.println();
			}
		/*
		String[] fruit="사과&3000&2-딸기&12000&3-오렌지&3000&3".split("-");
		for(String fru:fruit) {
			System.out.println(fru);
			String[]step = fru.split("&");
			for(String inf:step) {
				System.out.println(inf);
			}
		}*/
		/*
		 10. StringBuffer로 두 팀의 임의의 주사위 던지기 10회 내용과 결과를 저장하고, 마지막에 출력하세요.
              no  홍  청  결과
              1   3   4  청승
              2   4   4  무
            1) StringBuffer sbf 초기 선언.
            2) 반복문 for 1~10
            3) 홍팀과 청팀 점수 임의(1~6)
            	int red = (int)(Math.random()*6+1);
            	int blue = (int)(Math.random()*6+1);
            	String rs = red>blue?"홍승":(blue>red?"청승":"무승부");
            	sbf.append(cnt+"\t"+red+"\t"+blue+"\t"+rs+"\n");
            4) 반복문 후, 출력
            	sbf.toString();
              */
//			 정답
			String tlt = "no\t홍\t청\t결과\n";
			StringBuffer sbf = new StringBuffer(tlt);
			for(int cnt=1;cnt<=10;cnt++) {
				int red = (int)(Math.random()*6+1);
            	int blue = (int)(Math.random()*6+1);
            	String rs = red>blue?"홍승":(blue>red?"청승":"무승부"); // stack영역에 메모리 3개만 사용하여서 선언.
            	sbf.append(cnt+"\t"+red+"\t"+blue+"\t"+rs+"\n");
			}
			System.out.println(sbf.toString());
			
	
			/*
		StringBuffer game = new StringBuffer("no\t홍\t청\t결과\n");
		for(int no =1;no<=10;no++) {
			int hongIdx =(int)(Math.random()*6+1);
			int chungIdx =(int)(Math.random()*6+1);
			game.append(no+"\t"+hongIdx+"\t"+chungIdx+"\t"+(hongIdx>chungIdx?"홍승":((hongIdx<chungIdx)?"청승":"무"))+"\n");
		}
		System.out.println(game.toString());
		*/
		/*
		 13. Scanner nextLine()으로 문자열로 두개의 수를 입력 받아서 Boxing으로
		  Wrapper객체를 만든 후, 다시 Unboxing으로 합산된 결과를 출력하세요.
		 	1) Scanner 객체 생성
		 	2) 입력문자열1, 입력문자열2
		 	3) Wrapper Integer num01Obj, num02Obj 할당
		 		(Boxing처리) 숫자형문자열 ==> Wrapper 객체
		 	4) AutoUnboxing
		 		int num01 = num01Obj;
		 		int num02 = num02Obj;
		 	5) 합산출력
		 		num01 + num02;
		 		Integer.intValue
		 */
//			정답
//			Scanner sc = new Scanner(System.in);
//			System.out.print("첫번째 수를 입력:");
//			String str1 = sc.nextLine();
//			System.out.print("두번째 수를 입력:");
//			String str2 = sc.nextLine();
//			// boxing으로 데이터 할당.
//			Integer num01Obj = Integer.valueOf(str1);
//			Integer num02Obj = Integer.valueOf(str2);
//			// autoUnboxing
//			int num01 = num01Obj;
//			int num02 = num02Obj;
//			System.out.println("합산값:"+(num01+num02));
			
			/*
		Scanner sc = new Scanner(System.in);
		System.out.println("합산할 숫자를 입력해주세요.");
		double inputNumber1 = sc.nextDouble();
		
		Scanner sc2 = new Scanner(System.in);
		System.out.println("합산할 숫자를 마저 입력해주세요.");
		double inputNumber2 = sc2.nextDouble();
		
		Double boxNum1 = Double.valueOf(inputNumber1);
		Double boxNum2 = Double.valueOf(inputNumber2);
		System.out.println("두개의 숫자를 boxing: "+boxNum1+","+boxNum2);
		
		double unboxNum01 = boxNum1.doubleValue();
		double unboxNum02 = boxNum2.doubleValue();
		System.out.println("unboxing 후 합산값: "+(unboxNum01+unboxNum02));
		*/
		/*
		14. ArrayList로 임의의 수학점수(0~100) 정수형데이터 반복문에 의해 5개 데이터를 나오게 한후, 
		autoBoxing에 의해 할당처리하세요.
		*/
//			정답
			// 기본 정수 ==> autoboxing에 의해 Wrapper할당.
			Integer numObj = (int)(Math.random()*101);
			System.out.println("Auto Boxing:"+numObj);
			ArrayList<Integer> iList = new ArrayList<Integer>();
			
			// Integer형태의 객체가 ArrayList로 만들어진 구조
			// int num01 = (int)(Math.random()*101); 정수
			// iList.add(new Integer( num01 ) ); Boxing
			// 이렇게 해서 
			
			for(int cnt=1;cnt<=5;cnt++) {
				iList.add((int)(Math.random()*101));
				System.out.println(iList);
			}
			/*
		for(int idx=0;idx<=4;idx++) {
		ArrayList score = new ArrayList();
		score.add((int)(Math.random()*100));
//		System.out.println("수학점수"+score+"점");
		ArrayList boxScore =score; //autoBoxing
		System.out.println("수학점수"+boxScore+"점");
		}
		 */
		/*
		 15. Random 클래스를 이용해서 3과목의 점수를 임의로 출력하세요.
		 
			Random kor = new Random();
			Random math = new Random();
			Random eng = new Random();
			System.out.println("국어점수:"+kor.nextInt(100)+"점");
			System.out.println("수학점수:"+math.nextInt(100)+"점");
			System.out.println("영어점수:"+eng.nextInt(100)+"점");
			 */
			/*
1. 문자열을 검색할 때, 검색하는 형식이 틀린 것은
    1) 
    	// 배열안에 있는 검색을 전체를 하여 결과를 처리해야 되기에 
    	// {"홍길동","신길동","김길동"} : members
    	// "홍" : schStr
    	// 전역변수로 검색 결과 선언..
        boolean hasData=false;
        for(String mem : members){
            if(mem.indexOf(schStr) !=-1){ // 비슷한 글자
                hasData=true;
            }
        }
        // 하나라도 검색이 되면 hasData=true;
    2) 
        boolean hasData=false;
        for(String mem : members){
            if(mem.equals(schStr)){ // 동일한 문자열 있을 때.
                hasData=true;
            }
        }
    3) 
    	// {"홍길동","신길동","김길동"} : members
    	// "홍" : schStr
        for(String mem : members){
            String result="";	
            // for안에 들어 갔을때 가서 초기값 설정..
            // 외부에서 for문에서 검색된 결과를 볼 수 없을 뿐만 아니라, 
            // 반복문을 통해 다시 ""으로 초기화가 되어 배열 중에 한개 검색된 내용을 
            // 정상적 처리가 되지 않는다.
            if(mem.indexOf(schStr) !=-1){
                result="검색됨";
            }
        }
    4)  String result="";
        for(String mem : members){
            if(mem.equals(schStr) ){
                result="검색됨";
            }
        }
			 */
			
	}	
}
