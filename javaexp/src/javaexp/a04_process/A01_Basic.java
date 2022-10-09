package javaexp.a04_process;

public class A01_Basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 코드 실행 흐름 제어
		 1. 정상적인 코드 실행 제어
		 	1) main() 메소드의 시작인 중괄호 {에서 
		 	끝 중괄호 } 까지 위 ==> 아래로 방향으로 실행된다.
		 		- 코드는 기본적으로 위에서 아래로, 왼쪽에서 오른쪽으로 흐름 처리가 된다.
		 		- 단, 대입연산자를 통한 처리는 오른쪽에 있는 데이터가 왼쪽에 변수로 할당 처리된다.
		 2. 제어문의 역할
		 	코드 실행 흐름을 개발자가 원하는 방향으로 변결할 수 있도록 도와준다.
		 # 제어문의 종류
		 1. 조건문
		 	if, switch문
		 	if(비교연산식/논리연산식){
		 		위 연산식이 true일 때, 처리할 구문...
		 	}
		 	switch(기준 데이터){
		 		case 데이터1 :
		 			처리 프로세스
		 			break;
		 		case 데이터2 : 
		 			처리 프로세스
		 			break;
		 		...
		 		default : 
		 			위에서 해당하는 case의 데이터에 해당하지 않을 때..
		 	}
		 2. 반복문
		 	for문, while문, do-while문
		 	for(초기값;반복조건;증감연산자){
		 		반복처리할 block;
		 	}
		 3. break : 해당 반복문 처리를 중단 시켜 준다.
		 	continue : 해당 반복 step을 중단하고, 다음 step은 계속 진행한다. 
		 	* continue문 이하의 코드 내용은 수행되지 않는다.
		 	for(int cnt = 1; cnt<=9; cnt++){
		 		if(cnt == 5){
		 			continue; // 하단 내용을 출력 처리하지 않는다.
		 			}
		 			System.out.println(grade+" X " + cnt + " = " = grade);
		 		if(cnt == 7){
		 			continue; // 하단 내용이 없기에 의미가 없음.
		 			}
		 			
		 	
		 # 제어문의 중첩
		 1. 제어문의 중괄호 내부에 다른 제어문 작성이 가능하다.
		 	1) 다양한 흐름 발생 기능
		 2. 유형 : 아래아 같이 여러가지 중첩적으로 제어문을 만들어서 처리할 수 있다.
		 			조건문
		 				조건문
		 			반복문
		 				반복문

		 ## if문
		 1. 조건문 결과 따라 중괄호{}블럭을 실행할지 여부 결정할 때, 사용한다.
		 2. 조건식
		 	true/false값을 산출할 수 있는 연산자
		 	boolean 변수
		 	조건식이 true리면 블럭 실행하고, false이면 블록 실행하지 않음.
		 	
		 */
			int cnt = 1;
			
			System.out.println("flow진행:"+(cnt++)); //2
			System.out.println("flow진행:"+(cnt++));//3
			
			
			if(cnt==3)
				System.out.println();
			if(cnt==3)
				System.out.println();
			if(cnt==3)
				System.out.println();
			if(cnt==3)
				System.out.println();
//			※주의 (가독성이 떨어짐. 계층별로 분류 불가, 중괄호**)
			
			if(cnt==3) { //해당 조건 일때만, 처리
				System.out.println("# cnt가 3일때 #");
				System.out.println("flow 진행"+(cnt++));
				System.out.println("# 조건 중단 #");
			} //파이썬은 중괄호가 없음
			System.out.println("flow진행:"+(cnt++));
			if(cnt==5) System.out.println("단일행 조건 블럭 처리1");
				//{} 중괄호 블럭이 없는 경우 옆에 한라인 적용
			if(cnt==5) System.out.println("단일행 조건 블럭 처리2");
			// 밑에 한라인 적용...
			System.out.println("flow진행:"+(cnt++));
			
			/*
			 ex> 과일의 갯수를 2개씩 증가시켜서 출력하기 위해 변수를 선언하여 처리할 떄, 
			 		1) 4일때, 조건 블럭(중괄호)블럭처리
					2) 10일때, 바로 옆에 조건 프로세스 처리
					3) 14일때, 바로밑에 조건 프로세스 처리
				곰동이가 사과를 @@개 먹었다...
				곰동이가 사과를 @@개 먹었다(중괄호)
				곰동이가 사과를 @@개 먹었다...
				곰동이가 사과를 @@개 먹었다(바로옆)...
				곰동이가 사과를 @@개 먹었다...
				곰동이가 사과를 @@개 먹었다...
				곰동이가 사과를 @@개 먹었다...
				곰동이가 사과를 @@개 먹었다(바로밑)...
				
			 */
			/*
			int bear = 0;
			System.out.println("flow진행:"+(bear++));
			System.out.println("flow진행:"+(bear++));
			System.out.println("곰돌이가 사과를"+(bear+=2)+"개 먹었다.");
			if(bear==4) { //해당 조건 일때만, 처리
				System.out.println("곰돌이가 사과를"+bear+"개를 먹었다.");
				System.out.println("flow 진행"+(cnt+=2));
				System.out.println("# 조건 중단 #");
			}
			if(bear==10) { //해당 조건 일때만, 처리
				System.out.println("곰돌이가 사과를"+bear+"개를 먹었다.");
				System.out.println("flow 진행"+(bear+=2));
				System.out.println("# 조건 중단 #");
			}
			if(bear==14) { //해당 조건 일때만, 처리
				System.out.println("곰돌이가 사과를"+bear+"개를 먹었다.");
				System.out.println("flow 진행"+(bear+=2));
				System.out.println("# 조건 중단 #");
			}		
			*/
			int appCnt = 0;
			System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개를 먹었다.");
			System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개를 먹었다.");
			if(appCnt==4) {
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다(중괄호)");
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다(중괄호)");
			}

				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다.");
				if(appCnt==10) System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다(바로옆)");
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다");
				if(appCnt==14) System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다(바로밑)");
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다");
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다");
				System.out.println("곰돌이가 사과를"+(appCnt+=2)+"개 먹었다");
			
	}
}

