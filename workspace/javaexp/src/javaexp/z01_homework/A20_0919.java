package javaexp.z01_homework;

public class A20_0919 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 2. User03Exception을 통해 생성자를 매개변수로 문자열을 넘기고, 
		 getMessage()를 재정의하여 [사용자정의]라는 문자열을 포함하여, 
		 이 사용자 정의 예외가 11~20 반복문에서 짝수일 때, 처리되게 하세요
		 */
		/*
		// 정답
		for(int cnt =11;cnt<=20;cnt++) {
			try {
			if(cnt%2==0) {
				throw new User03Exception(cnt+"번 예외발생");
			}
			}catch(User03Exception e) {
				System.out.println("예외처리 block:"+e.getMessage());
			}finally {
				System.out.println("예외 처리(상관없이)");
			}
			
		}
	}
}

// # 사용자 정의 클래스
// 1. extends Exception
// 2. 생성자 매개변수 처리
// 3. 재정의 메서드 선언.
// 4. 상황에 맞게 해당 객체 강제 예외 처리 throw new 사용자정의 예외클래스 생성자();
// 	try{
// 		throw new User03Exception("예외메시지내용");
// 	}catch(User03Exception e){
// 		System.out.println("예외 메시지:"+e.getMessage());
// 	}catch(Exception e){
// 		System.out.println("최상위 예외")
// 	}finally{
// 		System.out.println("예외 상관없이 처리할 내용");
// 	}
 

class User03Exception extends Exception{
	// 매개변수로 getMessage()를 통해서 나타나는 문자열 전달 가능하게 처리.
	public User03Exception(String message) {
		super(message);
	}

	@Override
	public String getMessage() {
		return"[재정의된 메서드]"+ super.getMessage();
	}
}
*/
		/*
		for (int cnt=11;cnt<=20;cnt++) {
			try {
				if(cnt%2==0) {
					throw new User03Exception(cnt+"(짝수예외)");
				}
			}catch(User03Exception e) {
				System.out.println("메시지:"+e.getMessage());
			}
		}
	}
}
class User03Exception extends Exception{

	public User03Exception(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "[사용자정의]"+super.getMessage();
	}
	
}
*/
		/*
		 4. 같은 클래스의 두개 객체의 속성값이 같으면 hashCode가 동일하게 처리할려고 한다.  
		 Bus(번호,행선지)를 기준으로 처리하세요.
		
		Bus03 b1 = new Bus03(1500, "홍대입구역");
		Bus03 b2 = new Bus03(1500, "홍대입구역");
		System.out.println("b1 hashcode값:"+b1.hashCode());
		System.out.println("b2 hashcode값:"+b2.hashCode());
		System.out.println("b1,b2 속성값 같은가? :"+(b1.hashCode()==b2.hashCode()));
		
		
	}
}
class Bus03{
	private int no;
	private String destination;
	public Bus03(int no, String destination) {
		this.no = no;
		this.destination = destination;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		int code = this.no+this.destination.hashCode();
		return code;
	}
	
}
*/
/*
  5. 특정 프로그램의 실행 시간을 확인할려고 한다. 해당 코드의 메서드와 결과를 설명하세요.
  	1) 시작시간을 check해서 가져오고
  	2) 프로그램 수행
  	3) 마지막시간을 check
  	4) 시작시간과 마지막시간 차이 확인

//  정답
	long start = System.currentTimeMillis();
	long end = System.currentTimeMillis();
	long time = end-start;
	System.out.println("걸린시간:"+(time/1000.0)+"초");
	}
}
*/
/*
 
		long start = System.currentTimeMillis();
		System.out.println("시작시간:"+start);
		long sum = 0;
		for(long cnt = 1;cnt<(long)100000;cnt++) {
			sum+=cnt;
			System.out.println(cnt+":"+sum);
		}
		long end = System.currentTimeMillis();
		System.out.println("종료시간:"+end);
		long time = end-start;
		System.out.println("누적 덧셈 프로그램 결과:"+sum);
		System.out.println("누적 덧셈 프로그램 실행시간: "+(long)time/1000+"초");
	}
}  
*/
/*
 6. 문자열로 대문자/소문자/특수문자를 선언하고, 이 중에서 8자를 추출하여 비번호를 처리할려고 한다. charAt를 활용하여 처리하세요.
 */
		String pass = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*(";
		System.out.print("비밀번호: ");
		String result = " ";
		for(int idx=0;idx<=7;idx++) {
			int ranPass = (int)(Math.random()*pass.length());
			result += pass.charAt(ranPass);
		}
		System.out.println(result);

//		System.out.print(pass.charAt(0));
//		System.out.print(pass.charAt(12));
//		System.out.print(pass.charAt(3));
//		System.out.print(pass.charAt(21));
//		System.out.print(pass.charAt(26));
//		System.out.print(pass.charAt(18));
//		System.out.print(pass.charAt(19));
//		System.out.print(pass.charAt(7));
	}
}

