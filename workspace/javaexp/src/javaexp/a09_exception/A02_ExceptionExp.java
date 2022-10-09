package javaexp.a09_exception;

public class A02_ExceptionExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex) 아래 코드를 예외처리하여 예외 내용 출력하고
		//		3, 4, 5, 6라인이 정상 실행하게 하세요.
		try {
		System.out.println("1");
		System.out.println("2");
		System.out.println(args[1]);
		}catch(ArrayIndexOutOfBoundsException e){
			System.out.println("에러발생:"+e.getMessage());
		}finally {
			System.out.println("예외 상관없이 처리 내용");
		}
		// 아래 코드를 예외 처리하세요.

		System.out.println("3");
		System.out.println("4");
		System.out.println("5");
		System.out.println("6");
		try {
		System.out.println(1/0);
		}catch(ArithmeticException e2) {
			System.out.println("에러발생:"+e2.getMessage());
		}finally {
			System.out.println("예외 상관없이 처리");
		}
		System.out.println("7");
		System.out.println("8");
		System.out.println("9");
		System.out.println("10");
		System.out.println("11");
		System.out.println("12");
		
	}

}
