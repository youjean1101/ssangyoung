package javaexp.a01_begin;

import java.util.Scanner;

public class A11_InputScanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 좋아하는 과일명 입력 :
		// 입력..
		// 과일명:@@@
		Scanner sc = new Scanner(System.in);
		System.out.println("좋아하는 과일명 입력을 입력하세요.");
		String favFruit = sc.nextLine();
		System.out.println("과일명:"+favFruit);

	}

}
