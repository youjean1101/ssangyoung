package javaexp.z01_homework;

import java.util.Scanner;

public class A04_0901 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		[1단계:개념] 1. 증감연산식의 앞에 ++, 뒤에 ++의 차이점을 예제를 통하여 기술하세요.
			해당 프로세스에서 ++에서 바로 증가를 처리해서 나타나느냐?
			다른 호출시 나타나는냐?
			int cnt = 1;
			System.out.println(++cnt); //2 출력
			int cnt1 = 1;
			System.out.println(cnt1++); //1 출력
			System.out.println(cnt1); //2 출력
			
		[1단계:개념] 2. Math.random()을 통해 임의의 정수를 처리하는 공식을 예제를 통해 기술하세요.
			0.0 <= Math.random() < 1.0
			정수의 범위를 임의로 처리하는 공식
			(int)(Math.random()*경우의수 + 시작수)
			
		[1단계:코드] 3. 임의의 점수(0~100)처리하고 아래와 같이 비교 연산식을 이용하여 boolean(true/false) 처리하세요
		 
		   1) 점수를 지정하여 A학점(90이상 경우) 여부를 출력하세요
		   2) 점수를 지정하여 60점 미만인 경우 과락이면, 과락여부를 출력
		   	int pt = (int)(Math.random()*101);
			System.out.println("점수"+pt);
			System.out.println("A학점여부:"+(pt>=90));
			System.out.println("과락여부:"+(pt<60));
		 
		[1단계:개념] 4. 단항연산자, 이항연산자, 삼항 연산자의 차이점을 개념과 예제를 통해 기술하세요.
				연산자의 갯수에 따른 구분을 말한다.
				단항연산자 : +25, -25, -num01
							++cnt, cnt--, cnt+=2 (피연산자가 1개)
				이항연산자 : 25 + 3, num01 + num02 (피연산자가 2개)
				삼항연산자 : 조건?true일때: false일때
							point>=60?"합격":"불합격"
							
		[2단계:코드] 5. 삼항연산자를 이용하여 놀이공원에 입장료가 50000원 일 때, 나이가 6미만이거나 65세 이상일 때는 무료,
		      14~17일 때는 청소년 요금으로 20%할인이 된다. 나이에 따라 무료여부와, 청소년요금제 여부를
		      처리하고, 총비용을 출력하세요
		      
			
			int pay = 50000;
			int age = (int)(Math.random()*80+1);
			System.out.println("나이:"+age);
			System.out.println(age<6||age>=65?"무료":"유료");
			System.out.println(age>=14&&age<18?"청소년요금":"기타요금");
			double disRatio = age<6||age>=65?1.0:(age>=14&&age<18?0.2:0.0);
			System.out.println("할인율:"+(int)(disRatio+100)+"%");
			// pay = pay-(int)(pay*disRatio);
			pay -=(int)(pay*disRatio);
			System.out.println("총비용:"+pay);
			 
		[1단계:개념] 6. main()에서 데이터의 기본 흐름 방향을 기술하고, 조건문이 처리되는 형식에 따른
		            플로우를 설명하세요.
		            
		          기본 플로우 위에서 아래로, 왼쪽에서 오른쪽으로 흐름을 처리된다.
		          단, 대입연산자는 데이터가 오른쪽에서 왼쪽으로 대입이 된다. 
		          조건문인 경우에는 해당 조건이 true인 경우에 플로우가 진행 처리된다.
		          cf) 반복문인 경우에는 반복 조건이 true인 경우에만 반복을 수행 처리한다.
		          
		[1단계:코드] 7. 컴퓨터로 하여금 구슬을 1~7개를 임의로 쥐게 하고, 내가 Scanner를 통해 홀/짝을 입력하여,
		      맞으면 승, 틀리면 패로 처리하세요. 
		    
		 		int ComCnt = (int)(Math.random()*7+1);
		 		Scanner sc = new Scanner(System.in);
		 		System.out.println("# 홀/짝 게임 #");
		 		System.out.println("홀/짝을 선택하세요:");
		 		String myCh = sc.nextLine();
		 		System.out.println("컴퓨터의 구슬 갯수:"+ComCnt);
		 		String comCh = "홀"; //컴퓨터의 값을 초기로 홀
		 		if(ComCnt%2==0) comCh = "짝";
		 	//	String comCh = ComCnt%2 ==0?"짝":"홀";
		 		if (myCh.equals(comCh)) { // 문자열비교시 java.equals() (자바에서만)
		 			System.out.println("나의 승!!");
		 		}else {
		 			System.out.println("컴퓨터의 승!!");	
		 		}
		 		
		
		[3단계:코드] 8. 두명의 친구(이름입력)가 주사위 2개로 게임을 진행하였다. 결과를 표시하세요 
	
			Scanner sc1 = new Scanner(System.in);
			System.out.println("# 주사위 게임 #");
			System.out.println("첫번째 선수입장 이름입력:");
			String player01 = sc1.nextLine();
			System.out.println("두번째 선수입장 이름입력:");
			String player02 = sc1.nextLine();
			int player01Dice = (int)(Math.random()*6+1);
			int player02Dice = (int)(Math.random()*6+1);
			System.out.println(player01+":"+player01Dice);
			System.out.println(player02+":"+player02Dice);
			String rs = player01Dice>player02Dice?
					player01+"승":(player01Dice>player02Dice?player02+"승":"무승부");
			System.out.println("결과:"+rs);
		
		[1단계:코드] 9. 컴퓨터가 가위, 바위, 보를 내게 하고, 내가 가위 바위 보를 Scanner을 냈을 때, 승/무/패가
		      되게 조건 처리하세요.
		      가위 0
		      바위 1
		      보 2
		      	  승
		      0 1 1
		      1 2 2
		      2 0 0
		      idx++
		      0 1 2 3 4 5 ..
		      idx++%3
		      0 1 2 0 1 2 ...
		      첫번째 사람이 가위 - 0
		      두번쨰 사람이 바위 - 1
		      	바위가 승리
		      	첫번째 사람의 idx보다 1개 더 많으면 뒤에 사람이 승
		      첫번째 사람이 바위 - 1
		      두번쨰 사람이 보 - 2
		      	보가 승리
		      	첫번째 사람의 idx보다 1개 더 많으면 뒤에 사람이 승
		      첫번째 사람이 보 - 2
		      두번쨰 사람이 가위; - 0
		      	보가 승리
		      	첫번째 사람의 idx%3보다 1개 더 많으면 뒤에 사람이 승
		      	2다음이 3인데 3을 %3으로 처리하면 0이 된다.
		      	비기는 조건 idx가 동일
		      	그외는 첫번째 사람이 이기는 처리     	
		      */
			int comIdx = (int)(Math.random()*3); //0,1,2
			System.out.println("컴idx:"+comIdx);
			Scanner sc2 = new Scanner(System.in);
			System.out.println("#컴퓨터와 함께하는 가위/바위/보#");
			System.out.println("내가 선택한 가위/바위/보로 선택하세요!");
			String myChStr = sc2.nextLine();
			int myIdx = myChStr.equals("가위")?0:
							(myChStr.equals("바위")?1:2);
			String comChStr = comIdx==0?"가위":
								(comIdx==1?"바위":"보");
			System.out.println("컴의 선택:"+comChStr);
			System.out.println("나의 선택:"+myChStr);
			if(comIdx==myIdx) {
				System.out.println("무승부");
			}else if(comIdx++%3==myIdx) {
				System.out.println("나의 승");
			}else {
				System.out.println("컴퓨터 승");
			}
				
	}

}
