package javaexp.z01_homework;

import java.util.Scanner;

public class A04_0901_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* 1. 증감연산식의 앞에 ++, 뒤에 ++의 차이점을 예제를 통하여 기술하세요.
		int A = 0;
		System.out.println("뒤에 ++");
		System.out.println(A++);
		System.out.println(A++);
		System.out.println(A++);
		
		int B = 0;
		System.out.println("앞에 ++");
		System.out.println(++B);
		System.out.println(++B);
		System.out.println(++B);
		*/
		// 2. Math.random()을 통해 임의의 정수를 처리하는 공식을 예제를 통해 기술하세요.
		// 과제를 1~20개중 몇개를 낼지 램덤으로 돌려라.
		/*
		int homework = (int)(Math.random()*20+1); // 20가지의 경우의수와 시작점1
		System.out.println("오늘 낼 과제의 갯수는 : "+homework+"개");
		*/
		
		/*3. 임의의 점수(0~100)처리하고 아래와 같이 비교 연산식을 이용하여 boolean(true/false) 처리하세요
   			1) 점수를 지정하여 A학점(90이상 경우) 여부를 출력하세요
   			2) 점수를 지정하여 60점 미만인 경우 과락이면, 과락여부를 출력
		 
		int homework = (int)(Math.random()*101); // 101가지의 경우의수와 시작점 0
		System.out.println("임의의 정수 :"+homework);
				
		boolean ex1 = (homework>=90);
			System.out.println("A학점 대상 여부 : "+ex1);
			
		boolean ex2 = (homework<60);
			System.out.println("과락여부 : "+ex2);
			*/

			/* 5. 삼항연산자를 이용하여 놀이공원에 입장료가 50000원 일 때, 나이가 6미만이거나 65세 이상일 때는 무료,
			14~17일 때는 청소년 요금으로 20%할인이 된다. 나이에 따라 무료여부와, 청소년요금제 여부를 처리하고, 
				총비용을 출력하세요 
			
			int age, age02; 
			//age = (int)(Math.random()*100+1);
			//age02 = (int)(Math.random()*100+1);
			age = 14;
			age02 = 67;
			System.out.print("A 나이: "+age+"세\t\t");
			System.out.println("B 나이: "+age02+"세");
			
			int pay =50000;
			int pay02 =50000;
			
			String result = (age<6 || age>=65)? "무료":"유료";
			String result02 = (age02<6 || age02>=65)? "무료":"유료";
			System.out.print("A 입장료 무료여부:"+result+"\t");
			System.out.println("B 입장료 무료여부:"+result02);
					
			double result03 = 14<=age && age <=17? 0.2:0;
			double result04 = 14<=age02 && age02 <=17? 0.2:0;
			pay -= (int)(pay*result03);
			pay02 -= (int)(pay*result04);	
			
			System.out.print("A 청소년요금제 여부:"+(int)(result03*100)+"%\t");
			System.out.println("B 청소년요금제 여부:"+(int)(result04*100)+"%");
			System.out.println("총비용 :"+(pay+pay02));
			*/
		/* 7. 컴퓨터로 하여금 구슬을 1~7개를 임의로 쥐게 하고, 내가 Scanner를 통해 홀/짝을 입력하여,
	      맞으면 승, 틀리면 패로 처리하세요. 
		 
		int game = (int)(Math.random()*7+1);
		Scanner sc = new Scanner(System.in);
		System.out.println("홀/짝을 입력하세요.");
		String game2 = sc.nextLine();
		String com;
	
		if(game%2==0) { 
			System.out.println("짝!!");
			com = "짝";
		}else {	
			System.out.println("홀!!");	
			com = "홀"; 
		}
		if(game2.equals(com)) {
			System.out.println("승 ^_^");
		}else {
			System.out.println("패 ㅠ_ㅠ");
		}
		System.out.println("구슬 몇 개 :"+game);

				
		*/
		/*
		8. 두명의 친구(이름입력)가 주사위 2개로 게임을 진행하였다. 결과를 표시하세요
		
		Scanner sc = new Scanner(System.in);
		System.out.println("자신의 이름을 입력하세요.");
		String name01 = sc.nextLine();
		System.out.println("상대방의 이름을 입력하세요.");
		String name02 = sc.nextLine();
		
		int game01 = (int)(Math.random()*6+1);
		int game02 = (int)(Math.random()*6+1);
		System.out.println(name01+" : "+game01);
		System.out.println(name02+" : "+game02);
		System.out.println("▼");
		
		if(game01>game02){
			System.out.println(name01+" 님 승리!! \n"+name01+" 님 축하드려요 ^_^ ");
		}else if(game01==game02){
			System.out.println(name01+" 님과 "+name02+" 님은 비겼습니다.\n 다시 한번 도전하세요!");
		}else {
			System.out.println(name02+" 님 승리!! \n"+name02+" 님 축하드려요 ^_^");	
		}
		*/
		/*
		 9. 컴퓨터가 가위, 바위, 보를 내게 하고, 내가 가위 바위 보를 Scanner을 냈을 때, 승/무/패가
      되게 조건 처리하세요.

		 */
		Scanner sc = new Scanner(System.in);
		System.out.println("가위(0) / 바위(1) / 보(2)을 숫자로 내세요.");
		int me = sc.nextInt();

		int com= (int)(Math.random()*3);
		
		System.out.println("# 가위 / 바위 / 보 결과 #");
		System.out.println("나 : "+(me==0?"가위":(me==1)?"바위":"보")+"\t"
		+"컴퓨터 : "+(com==0?"가위":(com==1)?"바위":"보"));
		
		
		if((com==0 & me==2)) {
			System.out.println("안타깝게도 컴퓨터가 승리하였습니다.");
		}else if(com==1 & me==0) {
			System.out.println("안타깝게도 컴퓨터가 승리하였습니다.");
		}else if(com==2 & me==1) {
			System.out.println("안타깝게도 컴퓨터가 승리하였습니다.");
		}else if((com==2 & me==0)) {
			System.out.println("손님이 승리하셨습니다. 축하드려요 ^_^");
		}else if(com==0 & me==1) {
			System.out.println("손님이 승리하셨습니다. 축하드려요 ^_^");
		}else if(com==1 & me==2) {
			System.out.println("손님이 승리하셨습니다. 축하드려요 ^_^");
		}else if(com==me){
			System.out.println("비겼습니다. 다시 한번 도전하세요!");
		}else{
			System.out.println("0~2 범위 내로 내세요.");
		}
		
		/*
		switch( result ) {
		case 1:com = me;
			System.out.println("비겼습니다. 다시 한번 도전하세요!");
			break;
		case 2: com == 1 & me == 2
			System.out.println(me+" 님이 승리하셨습니다. 축하드려요 ^_^");
			break;
		case 3:
			System.out.println("안타깝게도 컴퓨터가 승리하였습니다.");
			break;
		default:
			System.out.println("해당 버튼은 사용하지 않습니다.");
			break;
		
		//ex2> 가위, 바위, 보를 위한 0,1,2가 임의로 나오게 하세요.
				// 경우의 수 3가지, 시작 0
*/
	}

}
