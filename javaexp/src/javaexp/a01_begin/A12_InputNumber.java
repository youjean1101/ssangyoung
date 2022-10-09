package javaexp.a01_begin;

import java.util.Scanner;

public class A12_InputNumber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ex> A12_InputNumber.java
		// 구매한 사과의 갯수
		// 구매한 바나나의 갯수
		// 총 과일의 갯수 : @@@
		Scanner sc = new Scanner(System.in);
		
		System.out.println("구매한 사과의 갯수를 입력하세요.");
		int appleCnt = sc.nextInt();
		System.out.println("구매한 바나나의 갯수를 입력하세요.");
		int bananaCnt = sc.nextInt();
		int tot = appleCnt + bananaCnt;
		System.out.println("총 과일의 갯수:"+tot+"개");
		}

	}

