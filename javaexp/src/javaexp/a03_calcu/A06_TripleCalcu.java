package javaexp.a03_calcu;

public class A06_TripleCalcu {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 # 삼항연산자
		 1. 세개의 피연산자를 필요로 하는 연산식
		 2. 앞의 조건식 결과에 따라 콜론 앞 뒤의 피연산자를 선택
		 	==> 조건 연산식
		 3. 형식
		 	(비교연산자, 논리연산자)? true일때:false일때
		 	cf)
		 	조건1?처리1:(조건2?처리2:(조건3?처리3:그외처리))
		 	ex) point>=90?"A":(point>=80?"B":(point>=70?"C"(point>=60:"D":"F"))) 
		 	//괄호는 필수가 아니라 가독성을 위해
		 */
		int point = 80;
		String result = (point>=60)? "합격":"불합격";
		System.out.println("결과 : "+result);
		System.out.println("결과 : "+((point>=60)?"합격":"불합격"));
		// ex1> 나이가 4미만, 65이상이면 무료, 그외는 유료를 처리하여 나이에 따른 입장료 무료/유료를 출력하세요.
		int age = 10;
		String result2 = (age<4 && age>=65)? "무료":"유료";
		System.out.println("입장료 여부:"+result2);
		System.out.println("입장료 여부:"+((age<4 && age>=65)? "무료":"유료"));
		
		int age3 = 75;
		System.out.println("입장료?"+(age3<4||age3>=65?"무료":"유료"));
		
		//ex2> 위에서 입장료가 50000원 일떄, 4세 미만, 65세이상 80% 할인하여 할인된 금액, 
		//그외는 20% 할인하여 할인된 금액을 출력하세요.
		/*
		int cost = 50000;
		int age2 = 30;
		String result3 = (age2<4 && age2>=65)? (cost-cost*0.8):(cost-cost*0.2);
		System.out.println("입장료 여부:"+result3);
		*/
		int pay =50000;
		double disRatio = age<4||age>=65?0.8:0.2;
		//pay = pay-(int)(pay*disRatio);
		pay -= (int)(pay*disRatio);
		System.out.println("나이:"+age);
		System.out.println("할인율:"+(int)(disRatio*100)+"%");
		System.out.println("최종입장료:"+pay);
	
	}

}
