package javaexp.a01_begin;

public class A03_executeCode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 기본명령어 처리순서
		1. 변수 처리
			변수 선언, 값 저장, 메소드 호출, 세미콜론
		
		 * */
		int num01 = 10; // num01이라는 이름으로 정수형으로 선언하고,
		var num02 = 20; // java의 버전에 따라, 데이터를 할당하는 num02의 타입을 지정.
		// var = 데이터를 할당하는 순간 타입이 선언 됨
		var str01 = "안녕하세요";
//		num02 = "반갑습니다"; 
//		프로그램에 따라 type까지 바뀌어 지는 경우도 있으나 자바에서는 타입이 한번 결정되면 변경되지 않는다. 
		// 데이터10을 할당, 세미콜론으로 종료
		System.out.println("저장된 데이터:"+num01);
		// 저장된 데이터를 출력 처리..
		// ex) num02에 데이터 15를 할당하고,
		//    화면에 num02? @@@ 형식으로 출력하세요.
		int num03 = 15;
		System.out.println("num03?"+num03);
		
	}

}
