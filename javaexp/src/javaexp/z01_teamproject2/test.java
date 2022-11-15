package javaexp.z01_teamproject2;

import java.util.List;
import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		// TODO Auto-generated method stub
		System.out.println("☞ 메뉴를 선택해주세요.");
		System.out.println("1: 회원가입");
		System.out.println("2: 로그인");
		System.out.println("3: 아이디 찾기");
		System.out.println("4: 도서관 찾기");
		
		int iHome = sc.nextInt();
		sc.nextLine(); // int 입력 초기화
		
		switch(iHome) {
		case 1 : //회원가입
//			signUp(); // 회원가입 함수 선언
			break;
			
		case 2 : //로그인
			
//			System.out.print("아이디: ");
//			String id = sc.nextLine();
//			System.out.print("패스워드: ");
//			String passwd = sc.nextLine();
//			
//			String sLoginDiv = null;
//			String sLoginUserno = null;
//			
//			List<SignUp> loginList = dao.login(new SignUp(id,passwd));
//			for(SignUp lo:loginList) {
//				System.out.println("[안내메시지]"+lo.getDiv()+"인 \""+lo.getUname()+"\"님이 정상적으로 로그인 되었습니다.\n");
//				sLoginDiv = lo.getDiv();
//				sLoginUserno = lo.getUserno();
//			}
//			if(sLoginout.equals("in")) {
//				if(sLoginDiv.equals("manager")) {
//
//					while(true) {
//						System.out.println("#관리자#");
//						System.out.println("1: 도서 조회/등록/수정/삭제");
//						System.out.println("2: 주간프로그램 조회/등록/수정/삭제");
//						System.out.println("3: 상담답변하기");
//						System.out.println("4: 대여/배달/연체자 조회");
//						System.out.println("5: 로그아웃");
//						
//						int iManagerMenu = sc.nextInt();
//						sc.nextLine();
//						switch(iManagerMenu) {
//							case 1:
//								//도서
//								book.BookMenu("관리자",sLoginUserno); 
//								break;
//								
//							case 2: 
//								//주간프로그램
//								program.ProgramMenu("관리자",sLoginUserno);
//								break;
//								
//							case 3:
//								// 상담
//								call.CallMenu("관리자",sLoginUserno);
//								break;
//								
//							case 4:
//								//대여조회
//								rental.RentalMenu("관리자",sLoginUserno);
//								break;
//								
//							case 5:
//								//로그아웃
////								while(true) {
//									System.out.println("[안내메시지] 로그아웃을 하시려면 Q!를 입력해주세요.");
//									logout = sc.nextLine();
////									if(logout.equals("Q!")) {
////										System.out.println("[안내메시지] 로그아웃되었습니다.");
////										break; // 사용자로 넘어감 -> 회원가입 메뉴로 돌아가야함
////									}
////								}
								break;
								
//							default :
//								System.out.println("[안내메시지]보기에 있는 메뉴번호를 입력해주세요");
//						}
								
		case 3 : 
			System.out.println("# 개인정보확인 #");
			System.out.print("☞ 이름 : ");
			String findIDName = sc.nextLine();
			System.out.print("☞ 전화번호:");
			String findIDCallNumber = sc.nextLine();
			break;
		
		}
	}
}
