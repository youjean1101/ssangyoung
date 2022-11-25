package javaexp.z01_teamproject3;

import java.util.Scanner;

public class MovieScreening {

	//public static void main(String[] args) {
		// TODO Auto-generated method stub
		public void movieScreening(String sAuthMenu, String id) {
			Movie movieDao = new Movie();
			//System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			Scanner sc = new Scanner(System.in);
			//String sAuthMenu = sc.nextLine();
			
			if(sAuthMenu.equals("관리자")) {
				boolean managerScreenWhile = true;
				while(managerScreenWhile) {
					System.out.println("☞ 상영등록 메뉴를 선택해주세요.");
					System.out.println("1:상영시간표 등록");
					System.out.println("2:영화별 예매조회");
					System.out.println("3:영화정보조회");
					System.out.println("4:뒤로가기");
					int iScreenMenuChoice = sc.nextInt();
					sc.nextLine();
					
					switch(iScreenMenuChoice) {
						case 1:
							System.out.println("상영시간표등록");
							break;
							
						case 2:
							System.out.println("영화별예매조회");
							break;
							
						case 3:
							movieDao.movieInfo("관리자", "mgryujin");
							break;
							
						case 4:
							managerScreenWhile = false;
							break;
							
						default:
							System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
							break;
					}
				}
				
				
			}else if(sAuthMenu.equals("사용자")){
				boolean userReserVationWhile = true;
				while(userReserVationWhile) {
					System.out.println("☞ 예매하기 메뉴를 선택해주세요.");
					System.out.println("1:영화정보보기");
					System.out.println("2:지역별 CGV 상영시간표 조회 ");
					System.out.println("3:예매하기");
					System.out.println("4:나의예매조회");
					System.out.println("5:뒤로가기");
					int reservationMenuChoice = sc.nextInt();
					sc.nextLine();
					
					switch(reservationMenuChoice) {
						case 1:
							movieDao.movieInfo("사용자", "yujin");
							break;
						case 2:
							System.out.println("지역별 CGV 상영시간표조회");
							break;
							
						case 3:
							System.out.println("예매하기");
							break;
							
						case 4:
							System.out.println("나의예매조회");
							break;
							
						case 5:
							userReserVationWhile = false;
							break;
							
						default:
							System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
							break;
					}
				}
			}else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
			}
	}
}
