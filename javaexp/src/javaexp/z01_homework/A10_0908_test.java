package javaexp.z01_homework;

public class A10_0908_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 3. Counter 클래스를 만들고, 생성자를 통해 시작, 마지막변수를 입력하고,  
		 메서드를 통해서 해담 범위 내용 출력하고, 누적합을 리턴 처리하게 하세요.
		
		Counter c1 = new Counter();
		int mkCounter = c1.mkCounter(1, 10);
		System.out.println("누적 합:"+mkCounter);
	}

}
class Counter {
	int mkCounter(int start,int end) {
		int tot =0;
		for(int cnt=start;cnt<=end;cnt++) {
			System.out.println(cnt+(cnt!=end?""+"":"\n"));
			tot += cnt;
		}
		return tot;
	}
}
*/
		/*
4. Car 클래스의 필드 차종,색상,현재속도를 선언하고, 이 중 생성자를 통한 초기값 설정과 메서드를 통한 
	설정을 분리하여 생성자, 메서드(속도증가,속도감소,현재속도확인)를 구현하여 처리하세요.

		Car c1 = new Car();
		c1.speedlist(30);
		System.out.println(c1.result());
		Car c2 = new Car();
		c2.speedlist(80);
		c2.pushspeed(true);
		System.out.println(c2.result());
		Car c3 = new Car();
		c3.speedlist(60);
		System.out.println(c3.result());
		Car c4 = new Car();
		c4.speedlist(40);
		System.out.println(c4.result());
		
	}
}
class Car{
	String kind;
	String color;
	int kmh;
	int currentkmh;
	boolean speedOper;
	
	Car(){
		this.kmh=60;
	}	//생성자
	
	void speedlist(int currentkmh) {
		System.out.println("현재속도:"+ currentkmh);
	}
	void pushspeed(boolean plus_or_minus) {
		speedOper = plus_or_minus;
	}
	
	String result() {
		System.out.print("속도측정: ");
		return speedOper?"속도증가":"속도감소";
	}
	
}

 */
		
		/*
		5. 1차원 배열로 회원의 이름 5명을 선언하고 할당 출력하세요
        2차원 배열로 위 회원이름에 추가하여 나이와 사는 곳을 만들어 할당하고 출력하세요
		*/
		
		String[] members = {"홍길동","김길동","이길동","정길동","남궁길동"};
		System.out.println("회원 5명");
		for(int idx=0;idx<members.length;idx++) {
			System.out.println(idx+1+")"+members[idx]);
		}
		System.out.println();
		
		String[][] members2 = {
								{"23살","서울"},
								{"25살","군산"},
								{"28살","인천"},
								{"27살","천안"},
								{"30살","부산"}
								};
			for(int idx=0;idx<members2.length;idx++) {
				System.out.println(idx+1+") 나이,사는곳");
				for(int jdx=0;jdx<members2[idx].length;jdx++) {
					System.out.println(members2[idx][jdx]+"\t");
			}
		}
	}
}
			
