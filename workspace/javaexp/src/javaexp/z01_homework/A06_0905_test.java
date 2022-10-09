package javaexp.z01_homework;

import java.util.Scanner;

public class A06_0905_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	/*
	2. 정수형 배열(arr05)로 물건의 가격을 3개 할당하고, 새로운 배열 변수(arr06)에 물건의 
		가격 변수(arry05)를 할당하고 arr06에 중간데이터를 변경 후 두 변수를
		 비교시 동일한 데이터가 나오는 이유를 기술하세요.
      
		int [] arr05 = {3000, 5000, 6000};
		int arr06[] = arr05;
		System.out.println(arr05+":"+arr06);
		arr06[1] = 7000;
		
		System.out.println(arr05+":"+arr06);
		System.out.println(arr05[0]+":"+arr06[0]);
		System.out.println(arr05[1]+":"+arr06[1]);
		System.out.println(arr05[2]+":"+arr06[2]);
		
		
		// 비교연산자의 비교
		// 기본 유형의 비교는 할당된 실제 데이터를 비교.
		System.out.println("#객체(배열) 비교#");
		System.out.println("arr05 == arr06:"+(arr05 == arr06));
		 */
		/*
		 5. 유럽챔피언스리그 팀과 성적을 배열로 선언하고 출력하세요.
		 */
		/*
		Scanner sc = new Scanner(System.in);
		System.out.println("궁금한 순위는(00위)?");
		int order = Integer.parseInt(sc. nextLine());
		
		String [] soccer = new String[order];
		System.out.println("입력하신 순위:");
		*/
		/*
		String[] soccer = {"아스널","맨체스터 시티","토트넘",
				"브라이튼 앤 호브 알비온", " 맨체스터 유나이티드","첼시", "리버풀",
				"브렌트포드","리즈 유나이티드","풀럼","뉴캐슬 유나이티드", "사우샘프턴",
				"AFC 본머스", "울버햄튼", "크리스탈팰리스", "에버턴","아스톤빌라",
				"웨스트햄","노팅엄","레스터시티"};
		int[] soccerrg = new int[20] ;
		for(int idx=0;idx<soccer.length;idx++) {
			System.out.println(idx+1+"위 팀 : "+soccer[idx]);
			*/
		
			/* 6. 학생3명의 이름과 국어 점수를 배열로 선언하고 Scanner로 입력한 후, 출력하세요.
			 
		Scanner sc = new Scanner(System.in);
		System.out.println("등록할 학생의 수를 입력하세요.");
		int stuCnt = Integer.parseInt(sc. nextLine());
		
		String []name = new String[stuCnt];
		System.out.println("# "+stuCnt+" 명의 학생의 이름과 국어성적을 차례에 맞게 입력하세요. #");
		int []koreaPT = new int[stuCnt];
		
		for(int idx=0;idx<name.length;idx++) {
				System.out.print(idx+1+"번째 학생이름 :");
				name[idx] = sc.nextLine();
				}
		for(int idx=0;idx<koreaPT.length;idx++) {
		System.out.print(idx+1+"번째 학생의 국어점수 :");
		koreaPT[idx] = sc.nextInt();
		}	
		System.out.println("입력순서\t\t이름\t\t국어성적");
		for(int idx=0;idx<name.length;idx++) {
			System.out.println(idx+1+"번째\t\t"+name[idx]+"\t\t"+koreaPT[idx]);
		
		}
		*/
		/*
		7. 임시비번에 사용할 임의의 데이터를 입력후(갯수 입력 후 문자입력), 문자 5개로 구성된 임시 비밀번호를 생성출력하세요.
	*/
//		String passwd[] = {"1","2","3","4","5"}; //생략한 자릿수(헷갈림방지를 위해)
		String passwd[] = {"","","","",""};
		String eng[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
						"R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h",
						"i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y",
						"z"};
		String Cnt[] = new String[260];
		int CntIdx=0;
		for(int passIdx=0;passIdx<passwd.length;passIdx++) {
			for(int engIdx=0;engIdx<eng.length;engIdx++) {
				Cnt[CntIdx]=passwd[passIdx]+""+eng[engIdx];
				System.out.print(Cnt[CntIdx]+",");
				CntIdx++;
			}
		}
		System.out.println();
		System.out.println("# 임의의 비밀번호 #");
		for(int cnt=1;cnt<=5;cnt++) {
			int rIdx = (int)(Math.random()*Cnt.length);
//			System.out.print("("+Cnt[rIdx]+")"); //한자리(숫자+문자)씩 헷갈림 방지를 위해 한문자당 ()표시
			System.out.print(Cnt[rIdx]);
			}
//		System.out.println("\n숫자+문자가 1문자"); // (숫자+문자)를 한문자로 알리기위해
			
	}
}

