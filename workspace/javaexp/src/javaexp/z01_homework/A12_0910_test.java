package javaexp.z01_homework;

public class A12_0910_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		1. 배열과 반복문의 관계를 기술하고, 학생 30명을 임의의 점수(0~100)로 배열에 할당/출력하세요.
		*/
		int[] stuCnt = new int[30];
//		int student = (int)(Math.random()*100);
		
		for(int idx=0;idx<=stuCnt.length;idx++) {
			int student = (int)(Math.random()*100);
			stuCnt[idx] = student ; 
			System.out.print(idx+1+"번 학생 : ");
			System.out.println(stuCnt[idx]);
		}
	
		
		
		/*
		 2. 무지개 색상을 배열로 선언하고, 이 중에서 임의의 색상 3개를 출력하세요
		String random[]= {"","",""};
			String rainbow[] = {"빨강색","주황색","노랑색","초록색","파랑색","남색","보라색"};
			String color[] = new String[21];
			int cidx = 0;
			for(int idx=0;idx<random.length;idx++) {
				for(int jdx=0;jdx<rainbow.length;jdx++) {
					color[cidx]=random[idx]+""+rainbow[jdx];
					System.out.print(color[cidx]+",");
					cidx++;
				}
			}
			System.out.println();
			System.out.println("# 임의의 3가지 색상 추출 #");
			for(int cnt=1;cnt<=3;cnt++) {
				int ridx = (int)(Math.random()*color.length);
				System.out.print(color[ridx]+",");
						
			}
			 */
		/*
		 3. 클래스와 객체의 관계를 메모리를 활용하여 설명하고, 주소값을 출력하세요..
		 
		Address a1 = new Address("추석","0910","즐거운 한가위 보내세요.");
		System.out.println("a1 주소값 :"+a1);
		Address a2 = new Address("설날","0122","새해 복 많이 받으세요.");
		System.out.println("a2 주소값 :"+a2);
	}

}
class Address{
	String day;
	String date;
	String talking;
	Address(String inputday,String inputdate,String inputtalking){
		this.day = inputday;
		this.date = inputdate;
		this.talking=inputtalking;
	}
	
}
*/
		/*
		 5. 아래와 같이 여러가지 생성자를 초기화하고 출력하세요.
          1) Singer 클래스를 선언하고 매개변수로 이름, 소속사, 메인곡을 선언하고, 생성자를 통해서 초기화 하고 출력하세요.
          2) Game 클래스를 선언하고 출시회사, 비용, 인기순
		 
		System.out.println("# 가수 이름, 소속사, 메인곡 출력 #");
		Singer s1 = new Singer("블랙핑크","YG엔터테인먼트","Pink Venom");
		System.out.println("가수이름:"+s1.name+" 소속사:"+s1.entertainment+" 메인곡:"+s1.song);
		Singer s2 = new Singer();
		Singer s3 = new Singer("뉴진스", "new jeans");
		System.out.println("가수이름:"+s3.name+" 메인곡:"+s3.song);
		
		System.out.println();
		System.out.println("# 게임 출시회사, 비용, 인기순 출력 #");
		Game g1 = new Game(1000000000,"넥슨");
		System.out.println("출시회사:"+g1.company +" 비용:"+g1.price);
		Game g2 = new Game("크래프톤",3000000000L,"배틀그라운드, 뉴스테이트 모바일, 테라 ...");
		System.out.println("출시회사:"+g2.company+" 비용:"+g2.price+" 인기순:"+g2.popopul);
	}
}
class Singer{
	String name;
	String entertainment;
	String song;
	Singer(){
		System.out.println("입력값 없음.");
	}
	Singer(String inputname){
		this.name = inputname;
	}
	Singer(String inputname,String inputsong){
		this.name = inputname;
		this.song = inputsong;
	}
	Singer(String inputname,String inputenter,String inputsong){
		this.name = inputname;
		this.entertainment = inputenter;
		this.song = inputsong;
	}
}
class Game {
	String company;
	long price;
	String popopul;
	Game(){
		System.out.println("입력값 없음.");
	}
	Game(String inputCompa) {
		this.company = inputCompa;
		}
	Game(String inputCompa,long inputPrice) {
		this.company = inputCompa;
		this.price = inputPrice;
		}
	Game(long inputPrice,String inputCompa) {
		this.company = inputCompa;
		this.price = inputPrice;
		}
	
	Game(String inputCompa,long inputPrice,String inputPop) {
	this.company = inputCompa;
	this.price = inputPrice;
	this.popopul = inputPop;
	}
}*/
	}
}