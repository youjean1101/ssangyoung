package javaexp.z01_homework;

public class A03_0831_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2. Scanner객체를 활용하여 타율계산방법을 확인(검색)하고, 
		 선수명과 함께 입력데이터를 입력 받아 해당 타자의 타율을 출력하세요.
		 타율 계산은 (안타)÷(타수). 예를 들어 7타수 2안타는 2÷7=0.2857, 반올림시 0.286으로 할수있다.
		
		Scanner sc = new Scanner(System.in);
		System.out.println("야구선수 이름이 뭔가요?");
		String name = sc.nextLine();
		System.out.println("몇 타수를 쳤나요?");
		int bat = sc.nextInt();
		System.out.println("안타를 몇번 쳤나요?");
		int hit = sc.nextInt();
		System.out.println(name+"의 타율"+(double)hit/bat);
		*/
		
		/*
		4. args로 물건1 가격1 갯수1 물건2 가격2 갯수2로 입력받아 계산서를 출력하세요.
		 
		 args로 물건명 가격 갯수를 매개별수로 입력받아 가격 갯수를 형변환 처리하여 총비용을 출력하세요.
		// java A04_StringTypeEXP 오렌지		2000 	7
		// java A04_StringTypeEXP args[0] args[1] args[2] 
		 
		String name1 = args[0]; 
		int price1 = Integer.parseInt(args[1]);
		int cnt1 = Integer.parseInt(args[2]);
		int sum1 = price1 * cnt1;
				
		String name2 = args[3]; 
		int price2 = Integer.parseInt(args[4]);
		int cnt2 = Integer.parseInt(args[5]);
		int sum2 = price2 * cnt2;
				
		System.out.println("# 계산서 #");
		System.out.println("물건명\t가격\t갯수\t합계");
		System.out.println(name1+"\t"+price1+"\t"+cnt1+"\t"+sum1);
		System.out.println(name2+"\t"+price2+"\t"+cnt2+"\t"+sum2);
		System.out.print("총계:"+(sum1+sum2));
		*/
		/*6. 방어율 계산 방법을 찾아보고, 해당 항목을 입력받아 방어율을 출력하세요.
		자책점 * 9 / 이닝 =방어율
		자책점 : 투수가 책임을 져야 할 실점
		이닝 : 양 팀이 교대로 공격과 수비를 하면서 생기는 경기의 구분 단위 (한 회(回))
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("자책점?");
		int earun = sc.nextInt();
		System.out.println("이닝?");
		int inning = sc.nextInt();
		System.out.println("방어율(자책점*9/이닝):"+earun*9/inning+"%");
		*/
		/*
		 8. 아래와 같은 일일 가계부를 처리할려고 한다. 초기 잔액 10000
	          Scanner를 통해 입력에 필요한 연산식을 만들고 아래 형식으로 출력하세요
		      날짜   내용   입금액    출금액     잔액
		      8/31  용돈   30000    0        40000
		      9/1   식사       0    5000     35000
		      
			Scanner sc = new Scanner(System.in);
			
				System.out.print("날짜(00/00) :\t");
				String day = sc.nextLine();
				System.out.print("내용 : \t");
				String data = sc.nextLine();
				System.out.print("입금액 : \t");
				int enter = sc.nextInt();
				System.out.print("출금액 : \t");
				int use = sc.nextInt();
				int seed = 10000;
				int balance = seed+enter-use;
				System.out.print("잔액 :"+ balance);
				System.out.println(" ");
				
				Scanner sc2 = new Scanner(System.in);
				
				System.out.print("날짜(00/00) : \t");
				String day2 = sc2.nextLine();
				System.out.print("내용 : \t");
				String data2 = sc2.nextLine();
				System.out.print("입금액 : \t");
				int enter2 = sc2.nextInt();
				System.out.print("출금액 : \t");
				int use2 = sc2.nextInt();
				int balance2 = balance+enter2-use2;
				System.out.println("잔액 :"+ balance2);
				System.out.println("날짜\t내용\t입금액\t출금액\t잔액");
				System.out.println(day+"\t"+data+"\t"+use+"\t"+enter+"\t"+balance);
				System.out.println(day2+"\t"+data2+"\t"+use2+"\t"+enter2+"\t"+balance2);
				*/
		/*
		 9.구매하는 김밥의 갯수를 선언하고, 1씩 증가하여 김밥의 단가(2500) 아래와 같이 출력
		      김밥 1개 구매  2500 
		      김밥 2개 구매  5000
		      김밥 3개 구매  10000
		 
		int gimbap = 0;
		int gimbapcost = 2500;
		System.out.println("김밥"+(gimbap+=1) +"개 구매 :" +"\t"+gimbap*gimbapcost);
		System.out.println("김밥"+(gimbap+=1) +"개 구매 :" +"\t"+gimbap*gimbapcost);
		System.out.println("김밥"+(gimbap+=1) +"개 구매 :" +"\t"+gimbap*gimbapcost);
		*/
		
		int num01 = 25;
		int num02 = 5;
		System.out.println("#비교 연산 결과#");
		System.out.println(num01+" == "+num02+" = "+(num01==num02));
		System.out.println(num01+" != "+num02+" = "+(num01!=num02));
		System.out.println(num01+" >= "+num02+" = "+(num01>=num02));
		System.out.println(num01+" <= "+num02+" = "+(num01<=num02));
		System.out.println(num01+" > "+num02+" = "+(num01>num02));
		System.out.println(num01+" < "+num02+" = "+(num01<num02));
	}

}
