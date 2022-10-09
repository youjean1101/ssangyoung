package javaexp.z01_homework;

import java.util.Scanner;

public class A05_0902_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2. switch case문을 이용하여 1990~2010년생의 띠를 출력하세요
		int homework = (int)(Math.random()*21+1990); 
		System.out.print(homework+"년생은 ");
		switch( homework ) {
			case 1990:
			case 2002:
				System.out.println("말띠 입니다.");
				break;
			case 1991:
			case 2003:
				System.out.println("양띠 입니다.");
				break;
			case 1992:
			case 2004:
				System.out.println("원숭이띠 입니다.");
				break;
			case 1993:
			case 2005:
				System.out.println("닭띠 입니다.");
				break;
			case 1994:
			case 2006:
				System.out.println("개띠 입니다.");
				break;
			case 1995:
			case 2007:
				System.out.println("돼지띠 입니다.");
				break;
			case 1996:
			case 2008:
				System.out.println("쥐띠 입니다.");
				break;
			case 1997:
			case 2009:
				System.out.println("소띠 입니다.");
				break;
			case 1998:
			case 2010:
				System.out.println("호랑이띠 입니다.");
				break;
			case 1999:
				System.out.println("토끼띠 입니다.");
				break;
			case 2000:
				System.out.println("용띠 입니다.");
				break;
			case 2001:
				System.out.println("뱀띠 입니다.");
				break;
			default:
				System.out.println("범위 밖에 나이입니다.");
				break;
		}
		*/
		/* 3. for문의 기본 구성요소를 기본 예제를 통하여 특징을 기술하세요.
		System.out.println("for 반복문과제 1~10");
		for(int cnt=1;cnt<=10;cnt++) {
			System.out.println(cnt+"번째 안녕하세요!!");
		}
		*/
		/* 4. for(기본) - 200에서 3씩 차감하여 100까지 차감된 데이터를 출력하세요
			System.out.println(" # 200에서 100까지 3씩 감소 #");
			for(int cnt=200;cnt>=100;cnt-=3) {
					System.out.println(cnt+"\t");
				}
			*/
		/* 5. for(지역/전역) - 곰돌이가 하루 빵을 2개씩 증가해서 먹어
		 (첫째날 2개, 둘째날 4개, 셋째날 6개 ...) 총 10일 동안 먹은 빵의 갯수를 누적하여 아래와 같이 출력하세요
               # 출력 형식
               1일차 2개 2개
               2일차 4개 6개
               3일차 6개 12개
		 
		int day=1;
		int sum=0;
		for(int bread=2;day<=10;bread+=2) {
			sum += bread;
			System.out.println(day+" 일차\t"+ bread+"개\t"+sum+"개");
			day++;
		}
		*/
		/* 6. for을 이용하여 3,6,9게임을 출력하세요(20까지)- 3의 배수가 아닌 3의 배수란 말이 포함될 때.
		*/
			System.out.println("## 369 게임(20까지) ##");
			for(int cnt=1;cnt<=20;cnt++) {
				if(cnt%10==3 || cnt%10==6 || cnt%10==9){
						System.out.println("박수!!");
				}else {
					System.out.println(cnt);
				}
			}
			
			/* 7. 반복문에서 break와 continue의 차이점을 기본 예제를 통하여 기술하세요
				for(int cnt=1;cnt<=10;cnt++) {
					if(cnt==5) break; // 5에서 중단해라
					System.out.print(cnt+" ");
					}
					System.out.println();

				for(int cnt=1;cnt<=10;cnt++) {
					if(cnt==5) continue; //5에서 중단하고 ,6부터 처리해라
					System.out.print(cnt+" ");
					}
				*/
		/*  5. while문의 기본 형식을 예제를 통해 설명하세요.
		int cnt =1;
		while(cnt<=10) { 
			System.out.print((cnt++)+" ");
		}
		*/
		
		/* 6. while문을 이용해서 학생의 점수를 등록하고 총점과 평균을 
        출력하되, 등록을 종료시 -1를 입력해서 처리하세요.
        
		
		System.out.println("학생의 점수를 입력하세요.(0~100점)");
		Scanner sc = new Scanner(System.in);
		int sum = 1;
		int cnt = 1;
		while(true) {
			int PT = sc.nextInt();
			sum += PT;
			System.out.println("점수 입력을 그만하려면 -1을 입력하세요.");
	
			if(PT==-1) { 
				break;
			}
			cnt++;
		}
		double avg = (double)sum/(cnt-1);
		System.out.println(" ## 계산종료 ## ");
		System.out.println("총점 :"+sum+"\t평균:"+avg);
		*/
	}	
}	
	

