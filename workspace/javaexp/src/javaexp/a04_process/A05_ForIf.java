package javaexp.a04_process;

public class A05_ForIf {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # for문과 if의 사용
		 1. for문을 통한 변수는 조건문으로 여러가지 처리를 할 수 있다.
		 2. 처리 형식
		 	1) 출력 형식 변경 처리
		 		조건문에 따라 탭간격 또는 줄바꿈 처리
		 		연산자의 형태 처리
		 */
		// 3의 단위로 출력하기
		for(int cnt=1;cnt<=9;cnt++) {
			System.out.print(cnt+" ");
			if(cnt%3==0) {
				System.out.println();
			}
		}
		// 3, 6, 9 단위로 짝 출력하기
		// 1 2 짝 4 5 짝 7 8 짝 10 11 12 짝 14 15 짝 17 18 짝 20
		// ...
		// 30단 짝 짝 짝 짝짝
		//	  30 31 32 33
		for(int cnt=1;cnt<=20;cnt++) {
			System.out.print(cnt+" ");
			if(cnt%3==0) {
				System.out.println("짝 ");
			}else {
				System.out.println(cnt+" ");
			}
		}
		// ex1> 1~100출력하되 5개 단위로 줄바꿈 처리로 출력하세요
		for(int cnt=1;cnt<=100;cnt++) {
			System.out.print(cnt+" ");
			if(cnt%5==0) {
				System.out.println("");
			}
		}
		// ex> 위 내용을 처리하면서 홀수의 총합과 짝수의 총합을 하단에 출력하세요.
		/*for(int cnt4=1;cnt4<=100;cnt4++) {
			System.out.print(cnt4+" ");
			if(cnt4%2==0) {
				int sum = cnt4+sum;
				System.out.print("짝 : "+sum);
			}else {
				System.out.print("홀  :");
			}
		} */
		int oddTot=0;
		int evnTot=0;
		for(int cnt=1;cnt<=100;cnt++) {
			System.out.print(cnt+(cnt%5==0?"\n":"\t"));
			if(cnt%2==0) {
				evnTot=cnt;
			}else {
				oddTot+=cnt;
			}
		}
		System.out.println("홀수의 총계 : "+oddTot);
		System.out.println("짝수의 총계 : "+evnTot);
	}

}
