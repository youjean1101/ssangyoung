package javaexp.a04_process;

import java.util.Scanner;

public class A09_Do_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # do - while문
		 1. 조건에 따라 반복 계속할지 결정할 떄, 사용하는 것은 
		 	while문과 동일하다.
		 2. 하지만, do -while문은 적어도 1번은 반복 블럭{}의 내용을 수행시켜준다.
		 3. 기본 형식
		 	do{
		 		1번이상 반복할 구문
		 		
		 	}while(반복할조건);
		 	
		 */
		int cnt = 1;
		do { 
			System.out.println("카운트:"+cnt++);
		}while(cnt<=10);
		
		do { 
			System.out.println("두번째 do while");
			System.out.println("카운트:"+cnt++);
		}while(cnt<=10);
		
		Scanner sc = new Scanner(System.in);
		String menu="N";
		String totMenu = "";
		do {
			System.out.println("메뉴를 입력하세요! 중단하실려면 N");
			menu = sc.nextLine();
			if(!menu.equals("N")) {
				System.out.println("주문한 메뉴:"+menu);
				totMenu+=menu+"";
			}
		}while(!menu.equals("N"));
		System.out.println("주문 종료");
		System.out.println("주문하신 전체 메뉴 : "+ totMenu);
	}

}
