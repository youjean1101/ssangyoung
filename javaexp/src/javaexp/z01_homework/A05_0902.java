package javaexp.z01_homework;

import java.util.Scanner;

public class A05_0902 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		[1단계:개념] 1. switch case에 break문의 특징을 기술하세요.
		[1단계:코드] 2. switch case문을 이용하여 1990~2010년생의 띠를 출력하세요
		[1단계:개념] 3. for문의 기본 구성요소를 기본 예제를 통하여 특징을 기술하세요.
		[1단계:코드] 4. for(기본) - 200에서 3씩 차감하여 100까지 차감된 데이터를 출력하세요
		[1단계:코드] 5. for(지역/전역) - 곰돌이가 하루 빵을 2개씩 증가해서 먹어(첫째날 2개, 둘째날 4개, 셋째날 6개 ...) 총 10일 동안 먹은 빵의 갯수를 누적하여 아래와 같이 출력하세요
               # 출력 형식
               1일차 2개 2개
               2일차 4개 6개
               3일차 6개 12개
               
         */
		int dBCnt = 2; // 하루의 먹는 빵
		int tot = 0; // 누적된 빵의 갯수
		for(int dCnt=1;dCnt<=10;dCnt++) {
				tot+=dBCnt*dCnt;
				System.out.println(dCnt+"일차 "+dBCnt*dCnt+"개 "+tot+"개 ");
		}
		
		/*
		[1단계:코드] 6. for을 이용하여 3,6,9게임을 출력하세요(20까지)- 3의 배수가 아닌 3의 배수란 말이 포함될 때.
		*/
		/*
		for (int cnt=1;cnt<=20;cnt++) {
			
			// 10 ==0
			// 11 ==1
			// 12 ==2
			// 13 ==0
			if(cnt%10!=0 && cnt%10%3==0) {
			System.out.print("짝,");
			}else {
				System.out.println(cnt+",");
			}
			
			System.out.print((cnt%10!=0 && cnt%10%3==0?"짝":cnt)+","); //최소코드
			
			}
			*/
		
		/*
		[1단계:개념] 7. 반복문에서 break와 continue의 차이점을 기본 예제를 통하여 기술하세요
		[1단계:개념] 8. while문의 기본 형식을 예제를 통해 설명하세요.
		[3단계:코드] 9. while문을 이용해서 학생의 점수를 등록하고 총점과 평균을 
               출력하되, 등록을 종료시 -1를 입력해서 처리하세요.
                   
			Scanner sc = new Scanner(System.in);
			int sno = 0; // 과목수, 평균처리시 필요
			int tot = 0; // 과목의 점수를 누적
			while(true) {
				System.out.println(++sno+"번째 과목의 점수를 입력(중단시 -1):");
				
				int pt = sc.nextInt();
				if (pt==-1) { // 중단 처리시
					sno--; // 입력된 과목 증가 취소 처리
					break;
				}
				System.out.println("입력한 점수:"+pt);
				tot += pt;
			}
			System.out.println("입력한 과목수:"+sno);
			System.out.println("총점수:"+tot);
			System.out.println("평균:"+tot/(double)sno);
*/
	}
}

