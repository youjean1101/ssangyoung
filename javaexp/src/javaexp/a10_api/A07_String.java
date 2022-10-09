package javaexp.a10_api;

import java.util.Scanner;
import java.util.StringTokenizer;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class A07_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # String 기능 메서드
		 1. replace("찾는문자열","변경할문자열")
		 */
		String target = "자바는 객체지향프로그램입니다.\n"+
						"자바는 풍부한 API를 지원합니다~~";
		String newStr = target.replace("자바","JAVA");
		System.out.println("기존 문자열:");
		System.out.println(target);
		System.out.println("변경할 문자열:");
		System.out.println(newStr);
		/*
		 2. substring("추출할시작위치(0~), 추출할마지막위치(1~)")
		 	특정한 문자열에서 문자열을 추출하여 문자를 만들 때, 사용한다.
		 */
		String subStr = target.substring(0,3); // index 1부터 3까지
		System.out.println("추출한 문자열");
		System.out.println(subStr);
		// ex) 주민번호 앞자리를 입력받아(2000년도 전 생일기준)
		//		@@@년 @@월 @@일생
		
//		System.out.print("주민번호 앞자리를 입력하세요(YYMMDD):");
//		Scanner sc = new Scanner(System.in);
//		String numberID = sc.nextLine();
//		if(numberID.length()==6) {
//			String yyyy ="19"+numberID.substring(0, 2);
//			String mm =numberID.substring(2, 4);
//			String dd =numberID.substring(4, 6);
//			System.out.println(yyyy+"년 "+mm+"월 "+dd+"일생 입니다!!");
//		}else {
//			System.out.println("입력형식은 6자리입니다.");
//		}
//		// 내가푼거
//		String HBD = numberID.substring(0,2);
//		System.out.print("19"+HBD+"년 ");
//		String HBD1 = numberID.substring(2,4);
//		System.out.print(HBD1+"월 ");
//		String HBD2 = numberID.substring(4,6);
//		System.out.print(HBD2+"일생");
		/*
		 3. split("구분자") : 특정문자열을 구분자에 의해 구분해서 구분된 데이터를 배열로 할당 처리
		 
		 	
		 	str = "사과&3000&2@바나나&4000&3@오렌지&2000&4"
		 	==> 리스트 
		 	사과		3000 2
		 	바나나	4000 3
		 	오렌지	2000 4
		 	1) 1단계 @구분자로 데이터 split 처리
		 		사과&3000&2
		 		바나나&4000&3
		 		오렌지&2000&4
		 		문자열 배열로 설정
		 	2) 2단계 & 구분자로 데이터 split 처리
		 		사과	3000	2
		 		==> 1단계 2단계로 처리하려면 2중 for문을 활용하여 처리한다.
		 			String[] lev01 = str.split("@");
		 			for(String lvStr:lev01){
		 				String[] lev02 = lvStr.split("&");
		 				for(String lv2Str:lev02){
		 					lv2Str + "\t"
		 				}
		 				System.out.println();
		 			}
		 			
		 */
		String[] fruits ="사과&바나나&딸기".split("&");
		// {"사과","바나나","딸기"}
		System.out.println("# 과일 #");
		for(String fruit : fruits) {
			System.out.println(fruit);
		}
		// ex) 서울-대전-대구-부산 과 같이 나열된 문자열을 split 구문을 이용해서 배열로 만들어
		//		향상된 for을 통해서 출력하세요.
		String data02 = "서울-대전-대구-부산";
		String [] locs = data02.split("-");
		System.out.println(" #지역 #");
		for(String loc:locs) {
			System.out.println(loc);
		}
		//내가한거
		String[] fromTo = "서울-대전-대구-부산".split("-");
		System.out.print("기차 경유지: ");
		for(String destini:fromTo) {
			System.out.print(destini+"-");
		}
		/*
		 # StringTokenizer("문자열","구분자") 객체 활용
		 1. 기능 메서드
		 	countToken() : 구분자를 통해 나온 데이터의 건수
		 	nextToken() : 구분자를 통해서 나온 각 데이터 하나씩, 호출시마다 하나씩 데이터를 가져온다.
		 		메서드를 호출하는 순간, 저장되어 있는 데이터가 하나씩 사라진다.
		 	hashMoreToken() : 해당 데이터가 있을 때 True
		 		while()문 등에서 위에 처리한 nextToken()이후에
		 		데이터가 있느지 여부를 boolean으로 나타낸다.
		 */
		StringTokenizer st = new StringTokenizer("오렌지&수박&딸기","&");
		int count = st.countTokens();
		System.out.println("# token #");
		for(int cnt=1;cnt<=count;cnt++) {
			String token = st.nextToken();
			System.out.println(token);
		}
		System.out.println("# while문 활용 #");
		st = new StringTokenizer("홍길동/김길동/신길동","/");
		while(st.hasMoreTokens()) { //데이터가 있습니까??
			System.out.println(st.nextToken());	// 있으면 찍어서 출력
		}
		// ex) StringTokenizer 객체를 이용하여 사과@3000@2 개를 for/while문 하나씩
		//		예제를 통하여 출력하세요.
		StringTokenizer ex = new StringTokenizer("사과@3000@2","@");
		System.out.println("토큰갯수:"+ex.countTokens());
		int len = ex.countTokens();
		// 토큰(구분자)에 의해 구분된 데이터 건수
		System.out.println("# for문 #");
		for(int cnt=1;cnt<=ex.countTokens();cnt++) {
			// 바로 입력시, countTokens() 갯수가 줄어 들어
			// 3번까지 반복을 처리 못함.
			System.out.println(cnt+":"+ex.nextToken());
		}
		// 데이터를 초기화 처리가 필요하다.
		ex = new StringTokenizer("사과@3000@2","@");
		System.out.println("# while문 #");
		while(ex.hasMoreTokens()) {
			System.out.println(ex.nextToken());
		}
	}
}
