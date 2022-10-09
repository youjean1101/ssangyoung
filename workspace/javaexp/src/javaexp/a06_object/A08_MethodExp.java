package javaexp.a06_object;

public class A08_MethodExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 기능 메서드의 혼합예제 처리..
		 1. 메서드의 리턴 처리, 매개변수 데이터
		 	프로세스처리, 실제 리턴 값 처리를 기준으로 복합 내용을 사용하는 기능이 많다.
		 2. 매개변수로 시작번호, 끝번호를 입력하여 해당 데이터의 총합을 return 처리
		 	int totAl(int start, int end){
		 		int tot=0;
		 		for(int cnt=start;cnt<=end;cnt++){
		 		System.out.println(cnt+"+");
		 		tot+=cnt;
		 		}
		 		return tot;
		 	}
		 
		 */
		MethodCompo mc = new MethodCompo();
		int totAll = mc.totAll(1, 10);
		System.out.println("총계:"+totAll);
		
		// ex> 매개변수를 통해서 구구단의 단을 입력하여 해당 단의 내용을 처리하는 메서드 구현
		
		mc.gugu(5);
		mc.gugu(7);
		mc.gugu(19);
		
		
		// ex2> 물건명, 단가(4000), 갯수(4)를 입력하여 
//				@@@ 1개 @@@원
//				@@@ 2개 @@@원
//				@@@ 3개 @@@원
//				@@@ 4개 16000원
//				마지막 총계 (16000)을 리턴하는 메서드 구현
//				() : 예제..
				
		int lastTot=mc.prodCalcu("사과", 1200, 15);
		System.out.println("마지막 계:"+lastTot);
		// ex> 삼각형의 면적(밑면, 높이) 리턴으로 면적
		//		밑면*높이*1/2
		mc.getTriDem(3,7);
		System.out.println("면적:"+mc.getTriDem(7,8));
	}
}
class MethodCompo{
	/*
		void getTriDem(double under,double height) {
		double area=under*height*1/2;
		System.out.println("삼각형면적 : "+(double)area);
		
	}*/
	int getTriDem(int num01,int num02) {
		System.out.println("# 삼각형의 면적 #");
		System.out.println("밑변:"+num01);
		System.out.println("높이:"+num02);
		return num01*num02/2;
	}
	
	int prodCalcu(String name,int price,int end) {
		int tot=price*end;
		for(int cnt=1;cnt<=end;cnt++) {
			System.out.print(name+"\t");
			System.out.print(cnt+"\t");
			System.out.print(price*cnt+"\n");
		}
		return tot;
	}
	void gugu(int grade) {
		System.out.println(" # "+grade+"단 #");
		for(int cnt=1;cnt<=9;cnt++) {
			System.out.println(grade+"X"+cnt+"="+grade*cnt);
		}
	}
	int totAll(int start, int end) {
		int tot =0;
		for(int cnt=start;cnt<=end;cnt++) {
			System.out.print(cnt+(cnt!=end?" + ":"\n"));
			tot +=cnt;
		}
		return tot;
	}
}
