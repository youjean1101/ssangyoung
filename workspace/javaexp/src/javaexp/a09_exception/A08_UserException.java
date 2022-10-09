package javaexp.a09_exception;
class UserExp extends Exception{

	public UserExp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserExp(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return super.getMessage();
	}

	@Override
	public void printStackTrace() {
		// TODO Auto-generated method stub
		super.printStackTrace();
	}

	@Override
	public StackTraceElement[] getStackTrace() {
		// TODO Auto-generated method stub
		return super.getStackTrace();
	}
	
}
public class A08_UserException {
	/*
	 # 사용자 정의 예외
	 1. 자바 표준 api에서 제공하지 않는 예외를 선언하여 사용
	 2. 애플리케이션 서비스와 관련된 예외
	 	ex) 잔고 부족 예외, 계좌이체 실패 예외, 회원가입 실패 예외
	 # 사용자 정의 예외 클래스 선언 방법
	 1. 형식
	 	public class XXXException extends [Exception|RuntimeException]{
	 		public XXXException(){}
	 		public XXXException(String message){
	 			super(message);
	 			}
	 		}
	 		// Exception에서 선언된 메서드 재정의해서 사용
	 		 // 위 생성자로 넘긴 message 내용을 getMessage()에서 처리되어 나타난다.
	 		 public String getMessage(){
	 		  	return "[사용자 정의 예외 발생]"+ super.getMessage();
	 		  }
	 # 예외 발생 시키기
	 1. 코드에서 예외 발생시키는 법
	 
	 	1) 예외 발생 처리 (throw)
	 	throw new XXXException()
	 	throw new XXXException("메시지")
	 	2) 예외 위임 처리 (throws)
	 	public void method throws XXXException{
	 		throw new XXXException("메시지");
	 	}
	 2. 호출된 곳에서 발생한 예외를 처리하도록 한다.
	 try{
	 	throw new XXXException("에러발생");
	 }catch(XXXException e){
	 	System.out.println(e.getMessage());
	 	// 에러발생을 받아서 처리..
	 }
	 # 예외 정보 (Exception 클래스에 있는 재정의하는 메서드)
	 1. getMessage() : 예외 발생시킬 때, 생성자 매개밧으로 사용한 메시지 리턴
	 	throw new XXXException("예외 메시지")
	 	원인 세분화하기 위해 예외 코드 포함
	 	catch()절에서 활용
	 	}catch(Exception e){
	 		String msg = e.getMessage();
	 	}
	 2. printStackTrace()
	 	예외 발생 코드 추적한 내용을 모두 콘솔에 출력
	 	프로그램 테스트하면서 오류 찾을 때 유용하게 활용.
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int cnt=1;cnt<=10;cnt++) {
			try {
			if(cnt%3==0) {
				throw new UserException(cnt+"번호 예외 던짐");
			}
		}catch(UserException e){
			System.out.println("# 예외 잡기 #");
			System.out.println("참조변수 호출:"+e);
			System.out.println("메시지:"+e.getMessage());
			e.printStackTrace();
			}
		}
		//1~100반복문 수행 %5로 0일 때, User01Exception 처리
		for(int cnt=1;cnt<=100;cnt++) {
			try {
				if(cnt%5==0) {
					throw new User01Exception("번호: "+cnt);
				}
			}catch(User01Exception e01) {
				System.out.println("예외 발생");
				System.out.println(e01.getMessage());
				// "번호:"+cnt 로 넘겨서 상위 생성자 super(문자열)
				// 넘긴 내용을 처리
			}
		}
	}
}
// ex1) User01Exception로 생성자 매개1개, 매개2개를 선언.
//			메서드 getMessage() 재정의로 반갑습니다. 예외 입니다. 문자열 출력.
class User01Exception extends Exception{

	public User01Exception(String message) {
		super(message);
	}
	public User01Exception(String message,String name) {
		super(message+": 예외명 -"+name);
	}
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "반갑습니다. 예외입니다!"+super.getMessage();
	}

}
class UserException extends Exception{
	// 생성자
	public UserException() {
		super();
	}

	public UserException(String message) {
		super(message);
	}
	
	// 기능메서드 재정의 선언. 
	@Override
	public String getMessage() {
		return "[재정의 메시지]"+super.getMessage();
	}

	@Override
	public String toString() {
		return "[재정의 참조값]"+super.toString();
	}

	@Override
	public void printStackTrace() {
		System.out.println("# 재정의 출력 #");
		super.printStackTrace();
	}
	
}
