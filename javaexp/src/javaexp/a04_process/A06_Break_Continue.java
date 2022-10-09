package javaexp.a04_process;

public class A06_Break_Continue {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # break
		 1. 반복을 중단 처리
		 # continue
		 1. 특정 step의 내용을 중단 다음 내용으로 처리
		 */
		for(int cnt=1;cnt<=10;cnt++) {
			if(cnt==5) break;
			System.out.print(cnt+", ");
		}
		System.out.println();
		for(int cnt=1;cnt<=10;cnt++) {
			if(cnt==5) continue;
			System.out.print(cnt+",");
		}
		System.out.println();
		// ex> 1~12월까지 전기 요금(120000) 출력하되, 5월은 제외하여 출력하고, 
		// 		각 월별 누적금액과 함께 출력하되, 총금액이 800000이상일 때, 중단 처리하세요.
		int elePay = 120000;
		int eleTot = 0;
		System.out.println("월\t요금\t누적금액");
		for(int mt=1;mt<=12;mt++) {
			if(mt == 5) continue; //5월만 패스
			eleTot += elePay;
			System.out.println(mt+"\t"+elePay+"\t"+eleTot);
			if(eleTot >= 800000) break; // 800000 이상일때
		}
		// ex2> 총금액이 800000 이상일떄, 충단 처리하세요.
		
	
		}
	}

