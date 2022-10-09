package javaexp.a04_process;

import java.util.Scanner;

public class A03_Switch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # switch문과 if문의 차이점
		 1. 매개값 ()에 들어가 데이터가 변수와 boolean값으로 구별한다.
		 2. 조건문은 boolean에 의해서 데이터의 범위를 지정할 수 있다.
		 	하지만 switch문은 단일한 데이터를 지정하여 처리할 때
		 	주로 활용된다.
		 # switch 문
		 1. 변수나 연산식의 값에 따라 실행문을 선택할 때, 사용된다.
		 2. 기본형식
		 	switch(변수){
		 		case 값1:
		 			처리할 내용
		 			break;
		 		case 값2:
		 			처리할 내용
		 			break;
		 		....
		 		default:
		 			처리할 내용 : 위에 선언된 case가 아닐 때.
		 		}
		 		3. switch 문에서 break;
		 		break를 만나야지 switch문을 벗어난다.
		 		break를 만나지 않으면 하위 프로세스를 처리한다.
		 */
		int chBtnNum = (int)(Math.random()*5); //0~4
		switch( chBtnNum ) {
			case 1:
				System.out.println("A쪽 구역에 불이 켜졌습니다.");
				break;
			case 2:
				System.out.println("B쪽 구역에 불이 켜졌습니다.");
				break;
			case 3:
				System.out.println("C쪽 구역에 불이 켜졌습니다.");
				break;
			default:
				System.out.println("해당 버튼은 사용하지 않습니다.");
				break;
		}
		// ex> 4지선다 문제 정답을 입력하고, 
		//	정답일 경우만 정답 표시, 그외의 오답표시처리하세요.
		//	1, 2, 3, 4 case표시
		/*
		Scanner sc = new Scanner(System.in);
		System.out.println("정답을 입력하세요(1~4)");
		int chNum = sc.nextInt();
		System.out.println("입력한 번호:"+chNum);
		*/
	/*	switch( chNum ) {
			case 1: 
				System.out.println("정답입니다.");
				break;
			case 2:
				System.out.println("오답입니다.");
				break;
			case 3:
				System.out.println("오답입니다.");
				break;
			case 4:
				System.out.println("오답입니다.");
				break;
			default:
				System.out.println("입력범위는"+ "숫자는 1~4까지 입니다.");
				break;
		}
		*/
		/*
		switch( chNum ) {
		case 1: 
		case 2: //break가 없기에 프로세스가 밑으로 진행
		case 4:
			System.out.println("오답입니다.");
			break;
		case 3:
			System.out.println("정답입니다.");
			break;
		default:
			System.out.println("입력범위는"+ "숫자는 1~4까지 입니다.");
			break;
		} 
		*/
		//ex> break 생략활용 예제, 월을 입력하여
		// 		해당 월의 마지막 날짜를 출력 처리하세요.
		//		예외처리 : 1~12 범위로 입력 메시지 출력
		// 		30, 31,28 switch문 활용 출력 처리..
		/*
		Scanner sc1 = new Scanner(System.in);
		System.out.println("월을 입력하세요.(1~12)");
		int month = sc1.nextInt();
		System.out.println("입력한 월:"+month);
	
		switch(month) {
		case 1: 
		case 3: //break가 없기에 프로세스가 밑으로 진행
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			System.out.println("입력한 월의 마지막 날짜: 31");
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			System.out.println("입력한 월의 마지막 날짜: 30");
			break;
		case 2:
			System.out.println("입력한 월의 마지막 날짜: 28");
			break;
		default:
			System.out.println("입력범위는"+ "숫자는 1~12까지 입니다.");
			break;
		}
		*/
		// 31 : 1, 3, 5, 7,  8, 10, 12
		// 30 : 4, 6, 9, 11
		// 28 : 2
		int chMonth = (int)(Math.random()*15); //0~14
		System.out.println("월 :"+chMonth);
		switch(chMonth) {
			case 1:
				case 3:
					case 5:
						case 7:
							case 8:
								case 10:
									case 12:
			System.out.println("31일이 마지막 날");
				break;
		case 4:
			case 6:
				case 9:
					case11:
			System.out.println("30일이 마지막 날");
		break;
		case 2:
			System.out.println("28일이 마지막 날");
			break;
		default:
			System.out.println("입력범위는"+ "숫자는 1~12까지 입니다.");
			break;
			}
	}
}
