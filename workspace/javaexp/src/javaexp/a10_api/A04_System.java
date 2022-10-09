package javaexp.a10_api;

public class A04_System {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # System 클래스
		 1. System 클래스 용도
		 	1) 운영체제의 기능 일부 이용 가능
		 	2) 프로그램 종료, 키보드로부터 입력, 모니터 출력, 메모리 정리, 현재 시간 읽기
		 	3) 시스템 프로퍼터 읽기, 환경변수 읽기
		 2. 프로그램 종료(exit)
		 	1) 기능 - 강제적 jvm 종료 System.exit(0)
		 		- int 매개값을 지정하도록 - 종료 상태값
		 			정상 종료일 경우 0, 비정상 종료일 경우 0이외 다른값 어떤 값 주더라도 종료
		 		- 만약 특정 상태 값이 입력되었을 경우에만 종료하고 싶다면?
		 			자바의 보안 관리자 설정
		 */
		// System.err : 에러에 대한 처리 내용을 console창에 출력
	try {
		int value=Integer.parseInt("열개");
		
	}catch(NumberFormatException e) {
		System.out.println("[에러 내용]");
		System.out.println(e.getMessage());
		System.err.println("[에러 내용]");
		System.err.println(e.getMessage());
		}
	// 제일 상단에 선언하고 다른 코드 진행 여부 확인.
		for(int cnt=1;cnt<=10;cnt++) {
		System.out.println("번호:"+cnt);
		if(cnt ==8) {
			System.out.println("프로세스 강제 종료");
//			System.exit(0);
		}
	}
		System.out.println("코드1");
		System.out.println("코드2");
		System.out.println("코드3");
		System.out.println("코드4");
		// 운영체제와 사용자 정의 출력
		String osName = System.getProperty("os.name");
		String  userName = System.getProperty("user.name");
		String  userHome = System.getProperty("user.Home");
		System.out.println("osName:"+osName);
		System.out.println("userName:"+userName);
		System.out.println("userHome:"+userHome);
		
		// 시간 정보
		long start = System.currentTimeMillis();
		System.out.println("시작"+start);
		long sum = 0;
		for(long cnt=1;cnt<(long)100;cnt++) {
			sum+=cnt;
			System.out.println(cnt+":"+sum);
		}
		long end = System.currentTimeMillis();
		System.out.println("종료:"+end);
		long time = end-start;
		System.out.println("결과:"+sum);
		System.out.println(time);
		System.out.println(time/1000+"초");
		System.out.println(time/1000/60+"분");
		System.out.println(time/1000/60/60+"시");
	}
}
