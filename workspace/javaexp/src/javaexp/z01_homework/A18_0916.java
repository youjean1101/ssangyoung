package javaexp.z01_homework;

import java.util.ArrayList;

public class A18_0916 {
//	static void call01() throws ArrayIndexOutOfBoundsException {
//		int[] c1 = {1,2,3};
//		System.out.println(c1[3]);
//	}
//	static void call02() throws ArrayIndexOutOfBoundsException {
//		int[] c2 = new int[1];
//		System.out.println(c2[5]);
//	}
	static void call01() throws ArrayIndexOutOfBoundsException {
		int[] arry = new int[3];	// 0,1,2
		System.out.println(arry[3]);
	}
	static void call02() throws ArrayIndexOutOfBoundsException {
		int[] arry = new int[3];	// 0,1,2
		System.out.println(arry[4]);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 2. 다각형이라는 추상클래스(필드-종류,실제메서드 도화지를 가져오다(), 추상메서드 drawing() @@을 그리다)를 
		 	생성하고 상속받은 실제 클래스(삼각형,사각형,오각형)을 처리하세요.
		
		Polygon pg1= new Triangle();
		Polygon pg2= new Square();
		Polygon pg3= new Pentagon();
		pg1.draw();pg1.drawing();
		pg2.draw();pg2.drawing();
		pg3.draw();pg3.drawing();

		}
}
abstract class Polygon{
	private String kind;

	public Polygon(String kind) {
		this.kind = kind;
	}
	public void draw() {
		System.out.println("도화지를 가져오다");
	}

	public String getKind() {
		return kind;
	}
	public abstract void drawing();
}
class Triangle extends Polygon{
	public Triangle() {
		super("삼각형");
	}
	public void drawing() {
		System.out.println(getKind()+"을 그리다.");	
	}
}
class Square extends Polygon{
	public Square() {
		super("사각형");
	}
	public void drawing() {
		System.out.println(getKind()+"을 그리다.");	
	}
}
class Pentagon extends Polygon{
	public Pentagon() {
		super("오각형");
	}
	public void drawing() {
		System.out.println(getKind()+"을 그리다.");	
	}
}*/
		
/*
 * 4. 인터페이스 PaintWay를 선언(추상메서드 paint() @@ 색칠을 하다) 상속받은 실제
      클래스(빨강색, 파랑색, 노랑색)을 처리하세요.
      
		Paint p01 = new Paint();
		p01.paint();
		p01.setPaintway(new Blue());
		p01.paint();
		p01.setPaintway(new Red());
		p01.paint();
		p01.setPaintway(new Yellow());
		p01.paint();
	}
}
interface PaintWay{
	void paint();
	
}
class Red implements PaintWay{
	
	public void paint() {
		System.out.print("빨강색");
	}
}
class Blue implements PaintWay{
	
	public void paint() {
		System.out.print("파랑색");
	}
}
class Yellow implements PaintWay{
	
	public void paint() {
		System.out.print("노랑색");
	}
}
class Paint{
	private PaintWay paintway;

	public void setPaintway(PaintWay paintway) {
		this.paintway = paintway;
	}
	
	public void paint() {
		if(this.paintway!=null) {
			this.paintway.paint();
			System.out.println("을 색칠을 하다");
		}else {
			System.out.println("색칠되지 않았습니다.");
		}
	}
}
*/
/*
6. args를 통해서 나올 수 있는 예외를 아래에 하나씩 처리하세요
1) args값을 입력 하지 않았을 때. 
2) Integer.parseInt(args[0]) 첫번째 매개문자가 숫자형이아닐 때 발생 에러 확인 후 처리.

//		1) args값을 입력 하지 않았을 때. 
		try {
			System.out.println(args[0]);
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("1)예외발생: "+e.getMessage());
		}finally {
			System.out.println("예외처리");
		}
		
//		2) Integer.parseInt(args[0]) 첫번째 매개문자가 숫자형이아닐 때 발생 에러 확인 후 처리.
		
		String[] a = {"문","1","2"};
//		System.out.println(Integer.parseInt(args[0]));
		try {
			System.out.println(Integer.parseInt(args[0]));
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("2)예외발생: "+e.getMessage());
		}finally {
			System.out.println("예외처리");
		}
	}
}
*/
/*	9.  call01(), call02()에 배열의 범위를 벗어났을 때, 
 	예외를 위임하는 예제를 처리해보세요.
 	
 	# 위임 예외 처리 순서
 	1. 해당 예외 내용 파악과 실제 나타날 상황 코드 생성
 		및 예외 copy
 		배열의 범위를 벗어났을 때
 		System.out.println(args[1]);
 		ArrayIndexOutOfBoundsException
 	2. 위임할 기능메서드 선언.
 		해당 예외와 비슷하게 발생할 내용을 구현..
 	3. 위임할 예외 내용 throws 위임 예외
 	4. 호출하는 곳에서 try{}catch문으로 예외 처리.
 	*/
// 정답	
//		System.out.println(args[1]);
		try {
		call01();
		call02();
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 범위를 벗어남:");
			System.out.println(e.getMessage());
		}
		
	
	}
}
 /*
	String name=null;
	try {
	 	call01();
	 	call02();
 	}catch (ArrayIndexOutOfBoundsException e) {
 			System.out.println("call01 예외 : "+e.getMessage());
 			System.out.println("call02 예외 : "+e.getMessage());
 		}
	}
}
*/

