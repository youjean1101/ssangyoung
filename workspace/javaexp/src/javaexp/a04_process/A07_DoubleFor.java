package javaexp.a04_process;

public class A07_DoubleFor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 중첩 반복문
		 1. 반복문 안에 반복을 처리하여, 단위 데이터를 계층적으로 처리할 떄, 사용된다.
		 2. 형식
		 	for(;;){ // 상위 단계 반복
		 		for(;;){
		 		// 상위 단계 각 데이터별 하위 데이터 처리
		 		 	}
		 		 }
		 */
		// 출력
		/*
		for(int row=1;row<=5;row++) {
			System.out.print(row+"\t");
			for(int col=1;col<=row;col++) {
				System.out.print("* ");
			}
			System.out.println();
		}
		int cnt=1;
		for(int row=1;row<=5;row++) {
			System.out.print(row+"\t");
			for(int col=1;col<=5;col++) {
				System.out.print(cnt+++"\t");
			}
			System.out.println();
		}
		// ex> 구구단 2중 for	2~9단까지..
		// 		밖 for grade, 안 for
		// @@ * @@ = @@
		
		System.out.println("#구구단 2#");
		for(int gugu=1;gugu<=9;gugu++) {
			for(int cnt2=2;cnt2<=2;cnt2+=2) {
				System.out.println(cnt2+" * "+gugu+" = "+ gugu*cnt2);
			}
		}
		for(int grade=2;grade<=9;grade++) {
			System.out.println("# "+ grade + "단 #");
			for(int cnt1=1;cnt1<=9;cnt1++) {
				System.out.println(grade +" * "+ cnt1 + " = "+(grade*cnt1));
			}
		}
		*/
		// 구구단을 옆으로 처리할려면 
		// ? 빨리 반복되는 부분가 천천히 반복되는 부분
		// 		단			 1~9
		// 행단위로 화면에 출력이 되기때문이다.
		for(int cnt1=1;cnt1<=9;cnt1++) {
//			System.out.print(2+" X "+ cnt1+" = " +2*cnt1+"\t");
			for(int grade1=2;grade1<=9;grade1++) {
				System.out.print(grade1 +" X "+cnt1+" = "+ grade1*cnt1+"\t");
			}
			System.out.println();
		}
	}
}
