package javaexp.a04_process;

import java.util.Scanner;

public class A02_If_else {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # if else 구문
		 1. 여러가지 조건이 있을 때, 처리하는 구문
		 	1) 2가지 조건
		 		if(조건1){
		 			조건에 해당할 때, 
		 		}else{
		 			조건에 해당하지 않을 때,
		 		}
		 		
		 	2) 3가지 이상 조건
		 		if(조건1){
		 		
		 		}else if(조건2){
					조건1을 제외하고 조건2일 때..
		 		}else if(조건3){

		 		}else{
		 			위에 나열된 조건이 아닐때..
		 		}
		 */
		/*
		int gIdx1 = (int)(Math.random()*2);
		Scanner sc = new Scanner(System.in);
		System.out.println("게임시작 홀/짝 선택하세요:");
		String ch = sc.nextLine(); // 홀/짝 선택
		String com = ""; // 초기화를 위해서 ""를 써줌. String com; 써도 됌.
		System.out.println("컴퓨터의 선택");
		if(gIdx1==0) { // 위에 임의 값이 0
			System.out.println("짝!!");
			com = "짝"; // com이 짝
		}else {	//임의 값이 1
			System.out.println("홀!!");
			com = "홀"; // com 홀
		}
		if(ch.equals(com)) {
				System.out.println("당신이 이겼습니다.");
		}else {
			System.out.println("당신이 졌습니다.");
		}
		*/
		// ex> 나이를 임의로 1~70까지 나오게 하고, 
		// if else 이용하여 나이가 14세이상 18세미만이면
		//청소년 출력, 청소년 아님(어린이/성인)~
		int rAge = (int)(Math.random()*70+1);
		System.out.println("임의의 나이:"+rAge);
		if(rAge>=14 && rAge<=18) { 
			System.out.println("청소년");
		}else {	
			System.out.println("청소년 아님(어린이/성인)");
		}
		int point = (int)(Math.random()*51+50);//50~100
		System.out.println("획득 점수:"+point);
		if(point>=90) {
			System.out.println("A등급");
		}else if(point>=80) { //주의-앞에 90이상 제외하고 - else
			System.out.println("B등급");
		}else if(point>=70) {
			System.out.println("C등급");
		}else if(point>=60) {
			System.out.println("D등급");
		}else {
			System.out.println("F등급");
			}
		
		// ex> 0,1,2가 임의로 나오게 하여 컴퓨터가 가위/바위/보를 출력하게 하세요.
		int game=(int)(Math.random()*3);
				System.out.println("임의로 출력된 숫자:"+game);
		if(game==0){
			System.out.println("가위");
		}else if(game==1) {
			System.out.println("바위");
		}else {
			System.out.println("보");
		}
		/* 
		 * # 중첩조건문
		 	if(조건1){
		 		if(조건2){
		 		
		 		}else{
		 		
		 		}
		 	}else{
		 	
		 	}
		 */
		String gender="남";
		int age = 25;
		if(age>=18) {
			if(gender.equals("남")) {
				System.out.println("신사입니다.");
			}else {
				System.out.println("숙녀입니다.");
			}
		}else {
			if(gender.equals("남")) {
				System.out.println("소년입니다.");
			}else {
				System.out.println("소녀입니다.");
			}
		}
			
	}
		
}

