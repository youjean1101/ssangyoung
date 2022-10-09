package javaexp.a06_object;

public class A06_ConstructorExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Fruit f1 = new Fruit("수박", 3);
		Book02 b1 = new Book02("자바기초","자바맨");
		Mouse m1 = new Mouse("휠마우스","삼성");
		Taxi t1 = new Taxi("서울경기","그랜저");
	
	}

}
/*
# 아래의 필드 값을 초기화하는 생성자를 선언하고, 생성자안에서 필드값을 출력하는 클래스를 정의 및 호출하세요.
	과일(종류,갯수), 도서(도서명, 출판사), 마우스(이름, 제조사), 택시(지역, 차종)
 */
class Fruit{
	String type;
	int fruitCnt;
	Fruit(String type, int fruitCnt){
		this.type = type;
		this.fruitCnt = fruitCnt;
		System.out.println("# 과일 객체 생성#");
		System.out.println("과일 종류: "+type+"\t 과일 갯수: "+fruitCnt);
	}
}
class Book02{
	String title;
	String create;
	Book02(String title, String create){
		this.title = title;
		this.create = create;
		System.out.println("# 도서 객체 생성 #");
		System.out.println("도서명: "+title+"\t 출판사: "+create);
	}
}
class Mouse{
	String name;
	String mouseCreate;
	Mouse(String name, String mouseCreate){
		this.name = name;
		this.mouseCreate = mouseCreate;
		System.out.println("# 마우스 객체 생성#");
	System.out.println("마우스 이름: "+name+"\t 마우스 제조사: "+mouseCreate);
	}
}
class Taxi{
	String area;
	String car;
	Taxi(String area, String car){
		this.area = area;
		this.car = car;
	System.out.println("# 택시 객체 생성 #");
	System.out.println("운행 지역 :"+area+"\t  차종: "+car);
	}
}
