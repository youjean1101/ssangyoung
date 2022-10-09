package javaexp.z01_homework;

import java.util.Scanner;

public class A07_0906_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2. 문자열 배열로 5개의 회원아이디를 선언/할당 하고, Scanner를 통해서 등록된 아이디가 있는지 여부를 확인하는 프로그램을 처리하세요
              - 온라인에서 회원등록시, 동일한 회원 아이디 등록여부 check
              ex) 회원아이디입력:@@@ 
                  등록된 아이디가 있습니다..
                  등록 가능한 아이디입니다.
                  */

		
//		 System.out.println("# 문자열 객체 생성 결과 #");
		 Login lo01= new Login();
		 lo01.id = "admin01";
		 lo01.passwd = "1234"; 
//		 System.out.println("첫번째 아이디:"+lo01.id);
//		 System.out.println("첫번째 비밀번호:"+lo01.passwd);
//		 System.out.println();
		 
		 Login lo02= new Login();
		 lo02.id = "admin02";
		 lo02.passwd = "5678"; 
//		 System.out.println("두번째 아이디:"+lo02.id);
//		 System.out.println("두번째 비밀번호:"+lo02.passwd);
//		 System.out.println();
		 
		 Login lo03= new Login();
		 lo03.id = "admin03";
		 lo03.passwd = "9101"; 
//		 System.out.println("세번째 아이디:"+lo03.id);
//		 System.out.println("세번째 비밀번호:"+lo03.passwd);
//		 System.out.println();
		 
		 Login lo04= new Login();
		 lo04.id = "admin04";
		 lo04.passwd = "1121"; 
//		 System.out.println("네번째 아이디:"+lo04.id);
//		 System.out.println("네번째 비밀번호:"+lo04.passwd);
//		 System.out.println();
		 
		 Login lo05= new Login();
		 lo05.id = "admin05";
		 lo05.passwd = "3141"; 
//		 System.out.println("다섯번째 아이디:"+lo05.id);
//		 System.out.println("다섯번째 비밀번호:"+lo05.passwd);
//		 System.out.println();
		 
		 Scanner sc = new Scanner(System.in);
			System.out.println("# 로그인 #");
			System.out.println("아이디를 입력하세요:");
			String inputId = sc.nextLine();
			System.out.println("패스워드를 입력하세요:");
			String inputPass = sc.nextLine();
			
			System.out.println("# eqals 비교 #");
			System.out.println("lo01.id.equals(inputId):"+((lo01.id).equals(inputId)));
			System.out.println("lo01.passwd.equals(inputPass):"+((lo01.passwd).equals(inputPass)));
			System.out.println("lo02.id.equals(inputId):"+((lo02.id).equals(inputId)));
			System.out.println("lo02.passwd.equals(inputPass):"+((lo02.passwd).equals(inputPass)));
			System.out.println("lo03.id.equals(inputId):"+((lo03.id).equals(inputId)));
			System.out.println("lo03.passwd.equals(inputPass):"+((lo03.passwd).equals(inputPass)));
			System.out.println("lo04.id.equals(inputId):"+((lo04.id).equals(inputId)));
			System.out.println("lo04.passwd.equals(inputPass):"+((lo04.passwd).equals(inputPass)));
			System.out.println("lo05.id.equals(inputId):"+((lo05.id).equals(inputId)));
			System.out.println("lo05.passwd.equals(inputPass):"+((lo05.passwd).equals(inputPass)));
			
		
			if((lo01.id).equals(inputId) && lo01.passwd.equals(inputPass)) {
				System.out.println("# 등록된 계정입니다. #");
			}else if((lo02.id).equals(inputId) && lo02.passwd.equals(inputPass)){
				System.out.println("# 등록된 계정입니다. #");
			}else if((lo03.id).equals(inputId) && lo03.passwd.equals(inputPass)){
				System.out.println("# 등록된 계정입니다. #");
			}else if((lo04.id).equals(inputId) && lo04.passwd.equals(inputPass)){
				System.out.println("# 등록된 계정입니다. #");
			}else if((lo05.id).equals(inputId) && lo05.passwd.equals(inputPass)){
				System.out.println("# 등록된 계정입니다. #");
			}else {
				System.out.println("# 등록되지 않은 계정입니다. #");
				}

	}

}
class Login{
	String id;
	String passwd;
	Login() { }
	Login(String id,String passwd) {
		this.id = id;
		this.passwd =passwd;
		}
	}

		/*
		 * 5. 좋아하는 운동선수의 이름과 성적을 처리할 수 있는 클래스를 선언하고, 
		 	객체 3개를 생성하여 선수의 정보를 할당/출력(main()에서)하게 하세요.
		
		Play human1 = new Play();
		human1.name = "손흥민";human1.PT="2021-22 EPL 득점왕 1등";
		System.out.println("좋아하는 운동선수이름: "+human1.name+"\t\t성적: "+human1.PT);
		Play human2 = new Play();
		human2.name = "살라";human2.PT="2021-22 EPL 득점왕 2등";
		System.out.println("좋아하는 운동선수이름: "+human2.name+"\t\t성적: "+human2.PT);
		Play human3 = new Play();
		human3.name = "해리 케인";human3.PT="2021-22 EPL 득점왕 4등";
		System.out.println("좋아하는 운동선수이름: "+human3.name+"\t성적: "+human3.PT);
	}
}
class Play{
	String name;
	String PT;
	Play(){}
	Play(String name,String PT){
		this.name = name;
		this.PT = PT;
		}
	}
	*/
		/*
		 * 7. 생성자를 여러 개 선언할 수 있는 규칙이 무엇이라 하고, 이것이 가능한 이유를 예제를 통해 기술하세요.
		
		Company c1 = new Company();
		Company c2 = new Company("오리온전자");
		Company c4 = new Company(40000);
		Company c3 = new Company("하이닉스", 30000,100000000);	
		Company c5 = new Company(40000,"오리온전자"); 
		// 매개변수를 통해 다른 생성자가 호출되는 것이 구분함
		Company c6 = new Company("오리온 전자",40000);
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		System.out.println(c4);
		System.out.println(c5);
		System.out.println(c6);
		
		
	}
}
class Company{
	String name;
	int empNum;
	int earMoney;
	Company(){}
//	Company(){} 같은 타입변수선언이 중복으로 못가짐 
	Company(String name){ // 변수 name만 선언
		this.name = name;
	}
	Company(String name,int empNum){ // 변수 name, empNum 2가지 선언
		this.name = name;
		this.empNum = empNum;
	}

	Company(int earMoney){ // 변수 earMooney만 선언
		this.earMoney = earMoney;
	}
	Company( int earMoney,String name){ //변수 earMoney,name 2가지 선언
		this.earMoney = earMoney;
		this.name = name;
	}
	Company(String name, int empNum, int earMoney){ // 변수 name, empNum,earMoney 3가지 선언
		this.name = name;
		this.empNum = empNum;
		this.earMoney = earMoney;
	}
} // 외부값이 어떤 파입으로 몇개가 제공될지 모르기 때문에 생성자도 다양화(타입,순서,갯수등)할 수 있다.	 
	*/
/*
  8. 아래의 클래스를 생성자를 통해서 초기값을 할당하고 필드를 출력하세요(단계별로 선언, 초기값-->main할당-->1개 매개 생성자할당-->여러개 매개 생성자할당)
               1) 볼펜(제조사,심두께), 음식(종류,가격), 산(이름, 위치,해발고도)
                              
 
		Pen p1 = new Pen();
		p1.creat = "모나미";
		p1.mm = 3;
		System.out.println("제조사:"+p1.creat+"두께:"+p1.mm);
		System.out.println();
		
		Food f1 = new Food("자장면", 6000);
		System.out.println("음식 종류:"+f1.type+"\t가격:"+f1.price);
		Food f2 = new Food("짬뽕");
		System.out.println("음식 종류:"+f2.type+"\t가격:"+f2.price);
		Food f3 = new Food(5000);
		System.out.println("음식 종류:"+f3.type+"\t가격:"+f3.price);
		System.out.println();
		
		Mountain m1 = new Mountain("북한산","서울",836.5);
		System.out.println("산이름: "+m1.name+"\t산위치: "+m1.where+"\t산높이: "+m1.height);
		Mountain m2 = new Mountain(1216,"설악산");
		System.out.println("산이름: "+m2.name+"\t산위치: "+m2.where+"\t산높이: "+m2.height);
		System.out.println();
	}
}

class Pen{
	String creat;
	int mm;
		Pen(){}
		Pen(String creat, int mm){  
				this.creat = creat;
				this.mm = mm;
				}
			}
class Food{
	String type;
	int price;
		Food(){}
		Food(String type, int price){  
				this.type = type;
				this.price = price;
				}
		Food(int price, String type){  
			this.type = type;
			this.price = price;
		}
		Food(int price){  
				this.price = price;
				}
		Food(String type){  
			this.type = type;
			}
}
	

class Mountain{
	String name;
	String where;
	double height;
	Mountain(){}
	Mountain(String name,String where,double height){  
				this.name = name;
				this.where = where;
				this.height = height;
				}
	Mountain(double height,String name,String where){  
		this.height = height;
		this.name = name;
		this.where = where;
		}
	Mountain(String where,double heighte,String name){  
		this.where = where;
		this.height = height;
		this.name = name;
		}
	Mountain(double heighte,String name){  
		this.name = name;
		this.height = height;
		}
	Mountain(String name){  
			this.name = name;
				}
	Mountain(double height){  
		this.height = height;
		}
}
*/	

