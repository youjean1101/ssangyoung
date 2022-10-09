package javaexp.a04_process;

import java.util.Scanner;

public class A04_For {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 반복문
		 1. 중괄호 블럭 내용을 반복적으로 실행할 때 사용한다.
		 2. 종류 : for문, while문, do-while문
		 3. for문 : 반복 횟수를 알고 있을 때, 주로 사용된다.
		 		for(초기값설정1;반복조건2;증/감연산자4){
		 			반복처리할 내용..3
		 			}
		 			1) 처리 순서
		 			1, 2, 3, 4, 2, 3, 4, 2, 3, 4 ...
		 			for(;조건;){
		 			} // =while문
					for(;;){} //무한반복
		 */
		/*
		System.out.println("반복문(카운트1~10)");
		for(int cnt=1;cnt<=10;cnt++) {
			System.out.println(cnt+"번째 안녕하세요!!");
		}
		System.out.println("디스카운트(10~1)");
		for(int cnt=10;cnt>=1;cnt--) {
			System.out.println("카운트 다운:"+cnt);
		}
		System.out.println("10부터 2개씩 증가");
		for(int cnt=10;cnt<=50;cnt+=2) {
			System.out.println("번호:"+cnt);
		}
		*/
		// ex1> 0부터 20까지 출력
		// ex2> 100부터 80까지 출력
		// ex3> 3부터 21까지 3의 배수 출력
		
		/*
		System.out.println("반복문(카운트1~20)");
		for(int cnt=0;cnt<=20;cnt++) {
			System.out.print(cnt+"\t");
		}
		System.out.println("\n디스카운트(100~80)");
		for(int cnt=100;cnt>=80;cnt--) {
			System.out.println("카운트 다운:"+cnt);
		}
		System.out.println("3부터 3배씩 21까지 증가");
		for(int cnt=3;cnt<=21;cnt+=3) {
			System.out.println("3의 배수:"+cnt);
		}*/
		/*
		 # for문 밖 전역변수 활용
		 1. 누적된 변수를 사용해야 할 경우, 반복문 밖에 선언하여 처리한다.
		 	ex> 1~10의 총합 구하기, 문자열 연결데이터 누적처리하기
		 */
		int tot=0;
		for(int cnt=1;cnt<=10;cnt++) {
			System.out.print(cnt);
			if(cnt!=10) System.out.print(" + ");
			tot+=cnt; // cnt가 증가하면서 누적처리한다.
		}
		System.out.println(" = "+tot);
		// ex1) 김밥나라의 김밥 단가 2500 반복문 이용해서 1~20개의 단위 계를 출력하고
		// 		총 비용을 누적해서 출력하세요..
		// 		김밥 1개	2500원
		// 		김밥 2개	5000원
		// 		김밥 3개	7500원
		//		...
		//		누적 총비용 @@@@원
		/*
		int tot3 =0;
		int cost = 2500;
		for(int count=1;count<=20;count++) {
			int tot2 = cost*count;
			tot3+=tot2;
			System.out.println("김밥 "+count+" 개\t"+tot2+" 원");
		}
		System.out.println("누적 총비용 : "+ tot3 +"원 ");

	} */
		int kimBap = 2500 ;
		int totPay = 0;
		for(int cnt1=1;cnt1<=20;cnt1++) {
				System.out.println("김밥 " +cnt1+"개"+kimBap*cnt1+"원");
				totPay+=kimBap*cnt1;
		}
		System.out.println("누적 총비용:"+totPay);
		// 구구단의 단을 입력받아서 1~9까지 곱한 결과를 출력하세요
				//	단 X 1 =@@
				//	단 X 2 =@@
				//	단 X 3 =@@
				//	단 X . =@@
				//	1) 1 ~ 9 까지 출력
				//  2) grade 데이터 scanner입력
				//		단을 출력
				//	3)단*cnt
			
			Scanner sc = new Scanner(System.in);
			System.out.println("원하는 구구단 숫자를 입력하세요.");
			int gugu = sc.nextInt();
			System.out.println("## "+gugu+"단 ##");
			for(int cnt2=1;cnt2<=9;cnt2++) {
				System.out.println(gugu+"단 X \n"+cnt2+" = "+ gugu*cnt2);
				}
			
			
			// ex> 전역변수 + 반복step 연습 (증감연산자)
			// 1~50까지 중에 홀수의 합을 출력하세요
			// 1 3 5 7 .....49
			// 합 : @@@
			int hap = 0;
			for(int step=1;step<=50;step+=2) {
				System.out.println(step);
				hap += hap+step;
			}
			System.out.println("합 :"+hap);
			
			int oddTot = 0;
			for(int cnt=1;cnt<=50;cnt+=2) {
				System.out.println(cnt+" ");
				oddTot += cnt;
			}
			System.out.println();
			System.out.println("합:"+oddTot);
			}
			
	}
		
