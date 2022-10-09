package javaexp.a09_exception;

public class A07_ForceException {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
		System.out.println("1");
		System.out.println("2");
		// 특정한 라인에서 예외 던지기
		throw new Exception("예외 막 던지기"); //throw 강제예외
//		System.out.println("3");
//		System.out.println("4");
		}catch(Exception e) {
			System.out.println("예외 내용:"+e.getMessage());
		}
		try {
			System.out.println("1");
			System.out.println("2");
			// 특정한 조건에서 예외 던지기
			for(int cnt=1;cnt<=10;cnt++) {
				System.out.println("번호:"+cnt);
				if(cnt==5)
				throw new Exception("예외 막 던지기2");
			}
//		System.out.println("3");
//		System.out.println("4");
		}catch(Exception e) {
			System.out.println("예외 내용:"+e.getMessage());
		}
	}
}
/*
# 강제 예외 발생시키기
1. 프로그램적으로 특정한 경우에
 	조건/반복문/특정프로세스 안에서 강제로 예외를 발생하여 처리하는 경우를 
 	말한다.
2. 기본 형식
	# 기본 예외 처리 내용
	예외 나올만한 코드(api)=프로그램적으로 처리
	==> 에러가 발생시 throw new 예외를 생성해서 던진다.
	catch(던져진예외 참조){
	 	처리..
	 }
	 # 강제 예외 처리
	 throws new 내장된()/사용자 정의 예외 던지는 처리.
 */
