package javaexp.z01_homework;

import java.util.Scanner;

public class A07_0906 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
[1단계:개념] 1. 문자열 객체 생성 형식 2가지를 기술하고, heap영역 사용의 차이점을 기술하세요.
[3단계:코드] 2. 문자열 배열로 5개의 회원아이디를 선언/할당 하고, Scanner를 통해서 등록된 아이디가 있는지 여부를 확인하는 프로그램을 처리하세요
              - 온라인에서 회원등록시, 동일한 회원 아이디 등록여부 check
              ex) 회원아이디입력:@@@ 
                  등록된 아이디가 있습니다..
                  등록 가능한 아이디입니다.
            # 처리순서
            1. 등록된 회원아이디가 있는 배열 선언.
            2. Scanner 선언
            3. 반복적으로 등록 가능한 아이디입니다. 나올 때까지 반복 
            	while(true){}
            4. 등록된 회원아이디의 배열 내용을 모두 check해서 한개이상 아이디가 
            	있으면 등록된 아이디가 있습니다.
            	
            	inputId = sc.nextLine();
            	boolean hasId = false; // 초기에 없는 것
            	for(int idx=0;idx<members.length;idx++){
            		if(inputId.equals(members[idx]){
            			hasId = true; // 하나라도 있으면 true
            		}
            	}
            	
            5. 등록된 아이디가 없을 반복문으로 종료 처리
            	3 while문을 break처리
            	if( !hasId ){ // not hasId : 등록된 아이디가 없을때..
            		System.out.println("입력된 아이디로 등록 가능합니다.");
            		break;
            	}else{
            		System.out.println("입력된 아이디는 등록되었습니다.");
            		System.out.println("다시 아이디 입력하세요.");
            	}
            	
            6. 등록 가능한 아이디입니다.를 출력..
                 */
			String[] mems = {"himan","higirl","goodman","badgirl","goodgirl"};
			Scanner sc = new Scanner(System.in);
			while(true) {
				System.out.println("등록할 아이디 입력:");
				String inputId = sc.nextLine(); // 입력한 id
				boolean hasId = false; // 아이디가 없는 것을 초기로 설정
				for(int idx=0;idx<mems.length;idx++) {
					// 배열 내용을 check해서 하나라도 있으면
					// hadId를 true로 처리..
					if(inputId.equals(mems[idx])) {
						hasId = true;
					}
				}
				if(hasId) {
					System.out.println("입력한 아이디는 등록 가능합니다.");
					break; // 반복을 종료
				}else {
					System.out.println("등록된 아이디가 있습니다.\n다시 아이디 입력해주세요!");
				}
				
			}
			
				/*
[1단계:개념] 3. 클래스와 객체의 개념와 차이점을 예제와 함께 기술하세요.
[1단계:개념] 4. 클래스의 구성요소를 각각의 기능과 내용을 예제를 통해서 기술하세요
[1단계:코드] 5. 좋아하는 운동선수의 이름과 성적을 처리할 수 있는 클래스를 선언하고, 객체 3개를 생성하여 선수의 정보를 할당/출력(main()에서)하게 하세요.
[1단계:개념] 6. default 생성자란 무엇이며, 사라지는 시점은 언제인가 기술하세요.
[1단계:코드] 7. 생성자를 여러 개 선언할 수 있는 규칙이 무엇이라 하고, 이것이 가능한 이유를 예제를 통해 기술하세요.
[1단계:코드] 8. 아래의 클래스를 생성자를 통해서 초기값을 할당하고 필드를 출력하세요(단계별로 선언, 초기값-->main할당-->1개 매개 생성자할당-->여러개 매개 생성자할당)
               1) 볼펜(제조사,심두께), 음식(종류,가격), 산(이름, 위치,해발고도)
 */
	}

}
