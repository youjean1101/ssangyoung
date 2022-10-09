package javaexp.a10_api;

public class A08_StringBuffer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # String 객체의 메모리 문제
		 1. String 문자열은 +를 통해서 새롭게 heap영역에 만들어지기에
		 	반복문을 활용하면 많은 객체가 만들어 지게 된다.
		 2. 가능한한 문자열은 +를 통해서 만들면 새로운 메모리가 만들어지므로
		 	특히, 반복문 안에서 사용하는 것은 자제하여야 한다.
		 */
		String name = "홍";
		for(int idx=0;idx<100;idx++) {
			name+=idx;
			// ** 주의
			// + 를 통해서 하나의 메모리 name에 문자열 추가하는 것이 아님
			// 새로운 메모리를 만들어 name이란 이름으로 처리되기에 
			// 반복문에 문자열 + 연산자를 쓰는 것은 메모리 효율화에 위험하다.
			
			System.out.println(idx+":"+name.hashCode()+":"+name);
								//번호:메모리사용량:출력
		}
		/*
		 # StringBuffer(멀티쓰레드환경일때무조건사용), StringBuilder
		 1. 버퍼(buffer:데이터를 임시로 저장하는 메모리)에 문자열 저장
		 2. 버퍼 내부에서 추가, 수정, 삭제 작업 가능
		 3. 멀티 쓰레드 환경 : StringBuffer사용
		 	1초 0.0~0.1 ==> 사용자1
		 	1초 0.1~0.2 ==> 사용자2
		 	1초 0.2~0.3 ==> 사용자3
		 	2초 1.0~1.1 ==> 사용자1
		 	순서확보를 정확하게 할 수 없다.
		 	그렇지만 한번에 여러 사용자를 처리가 가능하다.
		 	// CPU 코어가 많아야 빠름
		 	
		 4. 단일 쓰레드 환경 : StringBuilder 사용
		 	1초 사용자1가 모든 다 처리할 떄까지 기다리고
		 	2초 사용자2..
		 	순서확보를 정확하게 할수 있으나 한번에 한 사용자만 사용하여, 
		 	비효율적으로 처리된다.
		 5. 주요 메서드
		 	1) append(...) : 기본적으로 해당 초기 문자열의 가장 뒤에 추가 처리된다.
		 	2) insert(int offset,...)
		 	3) delete(int start, int end) : 범위를 정해서 삭제
		 	4) deleteCharAt(int index) : 특정한 위치 문자 삭제
		 	5) replace(int start, int end, String str) : 특정한 문자 위치를 대체
		 		"안녕하세요 hi! 반갑습니다. hi!"
		 		첫번째 hi!를 "안녕"으로 바꿀 때..
		 	6) reverse() : 문자열을 뒤집어 사용
		 	7) setCharAt(int index, char ch) : 특정한 위치에 문자 대체
		 		"안녕하세요 hi! 반갑습니다. hi!"
		 		h ==> g 특정한 위치 index 문자하나(replace(범위)의 차이)로 변경..
		 */
		System.out.println("# StringBuffer #");
		StringBuffer sbf = new StringBuffer("안녕하세요!!");
		for(int idx=0;idx<100;idx++) {
			sbf.append(""+idx);
			System.out.println(idx+":"+sbf.hashCode()+":"+sbf.toString());
		}
		System.out.println(sbf.reverse().toString());
		
		// ex) 배열 가위/바위/보를 문자열로 선언하고, 반복문으로 1~100회 임의의 가위 바위 보를 
		//		추가하여 StringBuffer에 할당하여 출력하세요.
		String[] games = {"가위","바위","보"};
		StringBuffer sbfex = new StringBuffer("# 가위, 바위, 보 100회 #\n");
		for(int cnt=1;cnt<=100;cnt++) {
			int rIdx = (int)(Math.random()*games.length);
			sbfex.append(cnt+"\t"+games[rIdx]+"\n");
		}
		System.out.println(sbfex.toString());
		
		
//		System.out.println("# 가위/바위/보 #");
//		StringBuffer game = new StringBuffer("가위/바위/보".split("/"));
		
////		int rangame = (int)(Math.random()*3+1);
//		for(int idx=1;idx<=100;idx++) {
//			game.append(""+idx);
//			System.out.println(idx+":"+game.toString());		
//		}
	}
}
