package javaexp.a04_process;

import java.util.Scanner;

public class A08_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # while문 : 조건에 따라 반복을 계속할지 결정할 떄 사용
		 1. 형식
		 	while(반복조건){
		 		조건이 true일 떄
		 		반복 처리..
		 	}
		 */
		/*
		int cnt =1;
		while(cnt<=10) { 
			System.out.println((cnt++)+" 번째");
		}
		*/
		/*
		cnt = 1;
		Scanner sc = new Scanner(System.in);
		while(true) { // 무한 loop
			System.out.println("카운트 : "+(cnt++));
			System.out.println("계속하실려면 Y");
			String isCon = sc.nextLine();
			if( !isCon.equals("Y")) {
				break; // 반복중단 처리..
			}
			System.out.println("프로그램 종료!!");
		}
		*/
		// ex) while문을 이용해서 100부터 90까지 출력하세요.
		System.out.println();
		int cnt2 =100;
		while(cnt2>=90) { 
			System.out.println("카운트다운:"+cnt2--);
		}
		// ex2> 사과의 단가가 1200원일 때, 더 구매하겠습니까? Y일때, 
		// @@개 구매 @@@ 원 누적출력 처리
		
		Scanner sc = new Scanner(System.in);
		int appPrice = 1200;
		int appCnt = 1;
		while(true) { // 무한 loop - break; 만나기 전까지
			System.out.println(appCnt+"개 구매 "+appPrice*appCnt+" 원");
			System.out.println("구매를 중단하겠습니까?");
			//입력받은 데이터를 바로 "Y" 여부를 boolean 확인
			if(sc.nextLine().equals("Y")) {  
			//break는 for/while 반복문에 다 사용
			//반복을 중단
				break;
			}
			appCnt++;
		}
		System.out.println("구매 종료!!");
		}

}
