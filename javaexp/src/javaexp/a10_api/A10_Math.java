package javaexp.a10_api;

public class A10_Math {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # API 내용
		 class Math
		 static double	abs(double a)
		 static : 객체 생성없이 클래스명으로 사용가능
		 	ex) Math.abs(1.14)
		 double : 이 메서드를 호출할 때, 결과값으로 어떤 유형
		 abs(double) : 매개변수가 어떤 유형을 입력 가능한지를 선언..
		 
		 */
		
		/*
		 # Math클래스
		 1. 수학 계산에 사용할 수 있는 정적 메소드 제공
		 */
		// int 		abs(int a)
		// 리턴값유형	메서드명(매개변수 유형)
		System.out.println("Math.random():"+Math.random());
		int v01 = Math.abs(-5);
		System.out.println("Math.abs(-5):"+v01);
		// double abs(double a); // 절댓값
		System.out.println("Math.abs(-3.14):"+Math.abs(-3.14));
		// double ceil(double a) : 올림값 처리
		System.out.println("Math.ceil(5.3):"+Math.ceil(5.3));
		// double floor(double a) : 내림값 처리
		System.out.println("Math.floor(5.9):"+Math.floor(5.9));
		// ex) ceil/floor()는 리턴값이 실수형이기에 정수값으로 활용할 때는 typecasting이 필요하다.
		// int max(int a, int b) : 둘중에 최대값 리턴
		System.out.println("Math.max(3,9):"+Math.max(3, 9));
		//double min(double a, double b) : 둘 중에 최소값 리턴
		System.out.println("Math.min(3,5):"+Math.min(3, 5));
		// double rint(double 1) : 가까운 정수의 실수값(반올림)
		System.out.println("Math.rint(5.5):"+Math.rint(5.5));
		System.out.println("Math.rint(5.45):"+Math.rint(5.45));
		// long round(double 1) : 반올림값 // 정수값
		System.out.println("Math.round(5.45):"+Math.round(5.45));
		System.out.println("Math.round(5.5):"+Math.round(5.5));
		// ex) 1.1~10.0(정수도 가능)까지의 임의의 수를 2개 발생해서 큰 수를 출력하세요.
		//		위 함수 활용.
//				11.0		100.0
//				11			100
//				11/10.0		100/10.0
		double num01 = ((int)(Math.random()*90+11))/10.0;
		double num02 = ((int)(Math.random()*90+11))/10.0;
		System.out.println("임의의 수:"+num01);
		System.out.println("임의의 수:"+num02);
		System.out.println("큰수:"+Math.max(num01, num02));
		//내가 한거
		double ex = (double)(Math.random()*10.0+1.1);
		System.out.println("램덤수 2개 중 큰수 출력 :"+Math.rint(Math.max(ex, ex)));
	}
}
