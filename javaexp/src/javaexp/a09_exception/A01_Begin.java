package javaexp.a09_exception;

public class A01_Begin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num01=0;
		try {
//		int num01=1;
		String str = null;
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		// 객체 생성하지 않았는데 객체.메서드 호출
		System.out.println("코드:"+str.toString());
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		}catch(NullPointerException e) {
			System.out.println("예외가 발생 했습니다.");
			//e.getMessage() : 예외의 내용을 처리한다.
		}finally {
			System.out.println("예외 발생 없이 처리할 코드");
		}
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		System.out.println("번호:"+(++num01));
		/*
		 # 예외 처리 순서
		 1. 기본 코드 내용 실행
		 2. 예외가 발생했을 때, 예외 처리 복사.
		 3. try{}catch(예외 클래스 내용 선언){}finally{}
		 	catch 매개변수에 발생한 예외 처리 내용 선언.
		 	하위 {} 블럭에 예외 발생시 내용 기술
		 	finally{} 예외 발생 상관 없이 처리할 내용 처리
		 	기타 이후 처리할 내용 기술..
		 	
		 */
	}

}
/*
 # 예외와 예외 클래스
 1. 오류의 종류
 	1) 에러
 		- 하드웨어의 잘못된 동작 또는 고장으로 인한 오류
 		- 에러가 발생되면 프로그램 종료
 		- 정상 실행상태로 돌아갈 수 없음.
 	2) 예외(Exception) *
 		- 사용자의 잘못된 조작 또는 개발자의 잘못된 코딩으로 인한 오류
 		- 예외가 발생되면 프로그램 종료
 		- 예외 처리 추가하면 정상 실행 상태로 돌아갈 수 있음.
 		==> 예외처리를 통해, 에러의 내용을 파악하거나, 
 		에러가 나더라도 프로그램을 멈추지 않고 정상적인 처리를 할 수 있게 해준다.
 		
  	3) 구분
  		- 일반(컴파일 체크) 예외
  			예외 처리 코드 없으면 컴파일 오류 발생
  			eclipse툴에서는 자동으로 이에 대한 소스를 자동으로 생성되게 하여, 예외에 대한 처리를 해준다.
  			ex) 메모리 로딩(Class,forName()), 
  				IO(stream을 통한 데이터 전송), DB 처리시
  		- 실행(RuntimeException) 예외
  			예외 처리 코드를 생략하더라도 컴파일이 되는 예외
  			경험 따라 예외 처리 코드 작성 필요
  			실행 후, 실행되어 처리되는 데이터에 따라서 예외를 발생하는 경우.
  			ex) NullPointerException(주소값이 없는 데이터)
  			 		해당 객체가 Heap영역에 생성하지 않았는데, 
  			 		종속된 멤버가 호출하였을 때, 발생.
  				ArrayIndexOutOfBoundsException(배열의 index범위 초과)
  				ArithMethicException(/0처리 예외)
  				NumberFormatException(숫자형 문자열이 아닐때)
  				
  2. 예외 클래스(계층구조)
   Exception
   
   		ClassNotFoundException InterruptedException
   			- 일반(컴파일체크) 예외
   		
   		RuntimeException (실행 예외)
   			NullPointerException
   			NumberFormatException
   3. 실행 예외
   		1) NullPointerException
   			- 객체 참조가 없는 상태
   			null값 갖는 참조변수로 객체 접근 연산자인 도트(.)
   			사용했을 때 발생
   			String data = null;
   			System.out.println(data.toString());
   			
   4. 예외 처리 코드
   		1) 예외 발생시 프로그램 종료를 막고, 정상 실행 유지할 수 있도록 처리.
   			- 일반 예외 : 반드시 작성해야 컴파일 가능
   			- 실행 예외 : 컴파일러가 체크해주지 않으면 개발자 경험에 의해 작성
   		2) 기본 형식
 			try{
 				// 예외 발생 가능 코드1
 				// 예외 발생 가능 코드2ㄴ
 				// 예외 발생 가능 코드3
 				// 예외가 발생하는 코드라인에서 바로 예외를 catch block에 throws한다.
 				// 예외 발생 가능 코드4
 				 
 			}catch(하위예외클래스 선언 e){
 				던져진 예외 객체를 이 블럭에서 받아서 처리
 				예외 처리
 				
 			}catch(상위예외클래스선언){
 			
 			}finally{
 				예외 상관없이 처리.
			}
		3) 예외 위임(throws)
			기능메서드 단위로 각각의 메서드 안에서 예외를 처리하기보다 
			예외를 위임하여 공통적으로 처리하는 곳에서 한번에 처리하는 것을 말한다.
			메서드1() throws 예외클래스{
			
			}
			메서드2() throws 예외클래스{
			
			}
			# 호출하여 처리하는 곳..
			
			try{
				메서드1();
				메서드2();
			}catch(예외클래스){
			
			}
		4) 강제 예외 처리(throw new 예외처리클래스())
			코드상 특정 조건이나 특정 위치에서 개발자가 사용자 정의 또는 내장된 예외를 직접적으로 던지고, 
			해당 예외를 catch구문으로 처리하는 것을 말한다.
			try{
			if(cnt==5){
				throw new Exception("5 곱하기 예외");
			}
			}catch(Exception e){
				예외 처리 내용..
			}
 				 */
