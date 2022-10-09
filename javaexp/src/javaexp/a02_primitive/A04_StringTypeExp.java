package javaexp.a02_primitive;


public class A04_StringTypeExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// ex) A04_StringTypeExp.java
		//	args로 물건명 가격 갯수를 매개별수로 입력받아 가격 갯수를 형변환 처리하여 총비용을 출력하세요.
		// java A04_StringTypeEXP 오렌지		2000 	7
		// java A04_StringTypeEXP args[0] args[1] args[2] 
		System.out.println("# 물건 구매 처리 #");
		String pname = args[0]; //물건명 데이터 입력
		int price = Integer.parseInt(args[1]);
		int cnt = Integer.parseInt(args[2]);
		System.out.println("물건명:"+pname);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		System.out.println("총계:"+price*cnt);
		/*
		Scanner sc = new Scanner(System.in);
		System.out.println("물건명: "+sc);
		String name = sc.nextLine();
		System.out.println("가격: "+sc);
		String price = sc.nextLine();
		System.out.println("갯수: "+sc);
		String Cnt = sc.nextLine();
		
		
		System.out.println("입력한 과일명:"+favFruit);
		System.out.println("입력한 과일명:"+favFruit);
		System.out.println("입력한 과일명:"+favFruit);
		
		 */
		
		


	}

}
