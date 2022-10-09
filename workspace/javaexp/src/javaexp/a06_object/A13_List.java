package javaexp.a06_object;

import java.util.ArrayList;

public class A13_List {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 객체형 배열
		 1. 고정된 배열안에 객체를 담는 처리
		 2. 크기가 고정되어서 추가나 삭제 불가능
		 */
		
		int[] arry = {1000,2000,3000};
		Food01[] obArray = {new Food01("짜장면",6000),
						  	new Food01("짬뽕",7000),
						  	new Food01("탕수육",15000)
							};
		// cf) 참조변수, 메서드명, 일반변수는 소문자로 시작하되, 합성어 구분자로 대문자
		//		중간에 추가한다.
		for(int idx=0;idx<arry.length;idx++) {
			System.out.println(idx+":"+arry[idx]); //stack 영역 데이터
		}
		for(int idx=0;idx<obArray.length;idx++) {
			Food01 f01 = obArray[idx]; //주소를 찾아가서 
			System.out.println(idx+":"+f01+":"); //stack영역 데이터
//			Food01 f01 = obArray[idx];
			System.out.println(f01.getName()+":"+f01.getPrice()); //해당주소에 객체를 넣어라
		} 


		// ex) Student 이름 국어 영어 속성 생성자, set/get
		//		Student[] 선언하고 학생 정보 3명을 할당.
		// for문을 통해서 이름, 국어,영어 출력
		/*
		 1. 클래스 선언
		 	필드, 생성, get/set
		 2. 객체형 배열 선언 및 할당
		 3. for 배열처리 기본형식
		 	for(int idx=0;idx<배열명.length;idx++)
		 4. for문 안에 단위 객체 할당.
		 	객체 참조변수 = 배열명[idx]
		 5. 객체의 get메서드 호출 및 출력 처리.
		 	
		 */

		Student01[] Stu= {new Student01("홍길동",70,60),
							new Student01("이길동",90,60),
							new Student01("김길동",80,90),
							};
		for(int idx=0;idx<Stu.length;idx++) {
			System.out.println(idx+":"+Stu[idx]+":"); // 배열 위치 알려줌(해당배열에 객체가 들어감)
			Student01 s01 = Stu[idx];
			System.out.println("이름 :"+s01.getSname()+"\n국어점수:"+s01.getKor()+"\n영어점수:"+s01.getEng());
		} 

		/*
		 # 객체형 동적배열
		 1. 데이터타입이 List, ArrayList선형 형식으로 선언된다.
		 2. 크기가 동적으로 변경이 가능하다.
		 */
		ArrayList list = new ArrayList(); //java.util.ArrayList
		//object
		Object ob; // 자바의 모든 객체의 상속 관계 최상위 객체
		// 모든 객체를 할당할 수 있다.
		ob = "홍길동";
		ob = new Student01("홍길동",70,80);
		//ArrayList<Object> list; default로 된거나 다름없음.
		//.add(추가할 데이터)
		list.add("사과");
		list.add("바나나");
		list.add("딸기");
		System.out.println("크기:"+list.size());
		//.size(); 동적배열의 크기
		for(int idx=0;idx<list.size();idx++) {
			//list.get(인덱스)
			System.out.println(idx+":"+list.get(idx));
		}
		list.add("오렌지");
		for(int idx=0;idx<list.size();idx++) {
			//list.get(인덱스)
			System.out.println(idx+":"+list.get(idx));
		}
		for(Object fruit:list){
			System.out.println(fruit);
		}
		

		// ex) 좋아하는 노래3곡명을 ArrayList를 선언하고 추가하여 반복문으 통해서 출력하세요.
		
			ArrayList fmusics = new ArrayList();
			fmusics.add("비가 오는 날엔");
			//
			fmusics.add("가라사대");
			// 삭제처리
			fmusics.remove(0); // 첫번째 데이터 삭제
			fmusics.add("가족사진");
			for(int idx=0;idx<fmusics.size();idx++) {
				System.out.println("TOP"+idx+" "+fmusics.get(idx));
				}
				//add(),get(),remove()
				// 향상된 반복문
				// for(단위데이터:배열형객체)
			System.out.println("#향상된 반복문 처리#");
			//	ArrayList는 기본유형으로 object가 담긴다.
			for(Object music:fmusics) {
				System.out.println(music);
			}
			/*
			 # 동적배열(ArrayList)에 객체 할당하여 처리하기.
			 1. 유형의 선언.
			 	ArrayList list; : 기본 object형 데이터 선언.
			 2. 특정한 객체의 유형의 데이터 처리.
			 	ArrayList<클래스명> list = new
			 		ArrayList<클래스명>();
			 	<>: generic
			 		해당 유형의 동적배열을 선언한다는 의미이다.
			 */
			ArrayList<Student01> stList = new ArrayList<Student01>();
			stList.add(new Student01("홍길동",70,80));
			stList.add(new Student01("김길동",90,60));
			stList.add(new Student01("신길동",50,70));
			for(int idx=0;idx<stList.size();idx++) {
				Student01 st = stList.get(idx);
				System.out.println(idx+":"+st);
				System.out.print(" "+st.getSname());
				System.out.print(" "+st.getKor());
				System.out.println(" "+st.getEng()); // 중요함!!!!!!DB까지 씀.
			}
			// ex) Food01 클래스를 ArrayList<타입>으로 할당하고
			//		for문을 통해서 출력하세요.
			ArrayList<Food01> foList = new ArrayList<Food01>();
			foList.add(new Food01("김밥",4000));
			foList.add(new Food01("떡볶이",5500));
			foList.add(new Food01("돈까스",8000));
//			foList.remove(2); // 2번째 배열에 들어가있는 데이터 삭제.
			/*for(int idx=0;idx<foList.size();idx++) {
				Food01 fo01 = foList.get(idx);
				System.out.println(idx+":"+fo01);
				System.out.println("음식: "+fo01.getName());
				System.out.println("가격: "+fo01.getPrice()+"원");
			}*/
			for(Food01 food:foList) {
				System.out.print(food.getName()+"\t");
				System.out.println(food.getPrice());
			}
	}
}

class Student01{
	private String sname;
	private int kor;
	private int eng;
	public Student01(String sname, int kor, int eng) {
		this.sname = sname;
		this.kor = kor;
		this.eng = eng;
	}
	//필드값을 호출할 때(간접적)
	public String getSname() {
		return sname;
	}
	//필드값을 저장할 때(간접적)
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	
}
class Food01{
	private String name;
	private int price;
	
	public Food01(String name, int price) {
		this.name = name;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
