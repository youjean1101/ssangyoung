package javaexp.z01_homework;

import java.util.Scanner;

public class A11_0909_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
 		1. 짜장면(5000), 짬뽕(6000)의 가격으로 되었을 때, 증감 연산자를 활용해서
            1~3, 1~5까지의 총비용을 출력하세요.
		int bnPrice = 5000;
		int rnPrice = 6000;
		int bnPriceTot = 0;
		int rnPriceTot = 0;
		System.out.println("짜장면");
		for(int blackNuddle=1;blackNuddle<=3;blackNuddle++) {
			int tot = blackNuddle*bnPrice;
			System.out.println(blackNuddle+"개"+tot+"원");
			bnPriceTot += tot;
		}
		System.out.println("짜장면 총비용 : "+bnPriceTot+"원");
		
		System.out.println();
		System.out.println("짬뽕");
		for(int redNuddle=1;redNuddle<=5;redNuddle++) {
			int tot = redNuddle*rnPrice;
			System.out.println(redNuddle+"개"+tot+"원");
			rnPriceTot +=tot;
		}
		System.out.println("짬뽕 총비용 : " + rnPriceTot+"원");
		System.out.println();
		System.out.println("총비용:"+(bnPriceTot+rnPriceTot)+"원");
		*/
		/*
		 3. 100에서 1/4로  4회 누적해서 나눈 값을 아래의 형식으로 출력 하세요
                 초기데이터 100
                 1회  25 
                 2회  6.2..
                 3회  1.54...
                   4회  0.38..
		
			int cnt = 1;
			int begin = 100;
			double tot = begin/4;
			System.out.println("초기데이터 " + begin);
			System.out.println(cnt+++"회 " + tot);
			System.out.println(cnt+++"회 " + tot/4);
			System.out.println(cnt+++"회 " + (tot/4)/4);
			System.out.println(cnt+++"회 " + ((tot/4)/4)/4);
//			for(int cnt=1;cnt<=4;cnt++) {
//				int tot = begin/4;
//				System.out.println(cnt+"회 "+ tot/4); 
//				}
//				for(int division=100;division<=0;devision) {
//					System.out.println(cnt+"회 "+ division);
//				}
//			}
			*/
			
		/*
		  4. [continue 활용]1~12월까지 마지막일수*10으로 월급여 산정하되,
            31일만 있는 월만 산정해서 출력하고 나머지 월(30일, 28일까지 있는 달)은 산정 처리하지 않고 총 급여을 아래와 같이 출력하세요
                      월  일수   월급여 누적연봉      
                      1월 31일  310만 310만원
                      3월 31일  310만 620만원
                      5월 31일  310만 930만원
                      ..
                      12 31일  ..
		
		int pay = 3100000;
		int tot = 0;
		System.out.println("월\t일수\t월급여\t\t누적연봉");
		for(int month=1;month<=12;month++) {
				if(month == 2) continue;
				if(month == 4) continue;
				if(month == 6) continue;
				if(month == 9) continue;
				if(month == 11) continue;
				tot += pay;
				System.out.println(month+"월\t"+"31일\t"+pay+"원\t"+tot+"원");
		}
	
		*/
			
			
		/*
		 5. 두명(컴퓨터vs컴퓨터)의 구슬 홀짝게임 : 한명이 구슬 10개를 가지고 임의의로 쥐게 하여, 
          다른 한명이 이것을 맞추었는지 여부에 따라 승/패로 출력하게 하세요.
          
		int ComCnt = (int)(Math.random()*10+1);
 		System.out.println("# 홀/짝 게임 #");
 		int ComCnt2 = (int)(Math.random()*2+1);
 		String holjjac;
 		System.out.println("컴퓨터1의 구슬 갯수:"+ComCnt);
 		if(ComCnt2==1) {
 			holjjac="홀";
 		}else{
 			holjjac="짝";
 		}
 		System.out.println("컴퓨터2의 홀짝 선택:"+holjjac);
 		String comCh = "홀"; 
 		if(ComCnt%2==0) comCh = "짝";
 		if (holjjac==comCh) { 
 			System.out.println("컴퓨터2의 승!!");
 		}else {
 			System.out.println("컴퓨터1의 승!!");	
 		}
 		*/
		/*
		 6. 두 팀(홍/청-컴퓨터vs컴퓨터)이 주사위를 던져 홍팀의 결과를 출력하세요(승/무/패)
		*/
		System.out.println("# 주사위 게임 #");
		int player01Dice = (int)(Math.random()*6+1);
		int player02Dice = (int)(Math.random()*6+1);
		System.out.println("홍팀:"+player01Dice);
		System.out.println("청팀:"+player02Dice);
		String rs = player01Dice>player02Dice?
				"승리":(player01Dice<player02Dice?"패배":"무승부");
		System.out.println("홍팀의 결과:"+rs);
		
		
		/* 7. while문 숫자 맞추기 게임, 컴퓨터가 임의로 1~100범위의 숫자를 저장하면,
         while문을 통해서 해당 숫자를 입력한다. 비교해서 동일하면 종료,
		 
			Scanner sc = new Scanner(System.in);
			int comnumber = (int)(Math.random()*100+1);
			System.out.println("컴퓨터지정숫자(테스트를 위한 출력) :"+comnumber);

			while (true) {
				System.out.println("숫자를 맞춰보세요.(1~100)");
				if(sc.nextInt()==comnumber) {
					break;
				}
			}
			System.out.println("정답!");
			*/
 		
		/*
		 9. Music 클래스를 선언하고, 해당 m01, m02 참조변수를 선언하고, 비교하세요.
					System.out.println("# m01 참조변수 #");
					Music m01 = new Music();
					m01.name = "비가 오는 날엔";
					System.out.println(m01.name);
				
					System.out.println("# m02 참조변수 #");
					Music m02 = new Music();
					m02.name = "가족사진";
					m02.singer = "Sg워너비";
					System.out.println(m02.name);
					System.out.println(m02.singer);
	}
}
class Music{
	String name;
	String singer;
	Music(){
	}
	Music(String inputname){
		String name = inputname;
	}
	Music(String inputname,String inputsinger){
		String name = inputname;
		String singer = inputsinger;
	}
}
*/
	}
}
