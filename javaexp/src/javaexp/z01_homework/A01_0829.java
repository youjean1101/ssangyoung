package javaexp.z01_homework;

public class A01_0829 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
# 아래 과제 결과를 카톡 text복사해서 메시지로 전달 : 양현수 
2020829 과제 : 마감 ~21:00
1. 코드 처리(메시지)
	1) 자바의 컴파일과 실행과정을 A01_0829.java를 통해서 설명하세요.
		javac A01_0829.java 컴파일
		==> A01_0829.class 기계어생성
		이 클래스에 main()메서드가 포함되어 있을 때.
		java A01_0829
		를 통해서 메모리에 로딩 및 실행 처리된다.

	2) 아래 내용을 설명하세요
		- 문자열 선언 방법 : 
		String 변수명;
		ex) String name = "홍길동";
		변수명을 name으로 문자열을 선언하고, 동시에 데이터 "홍길동"
		할당 처리
		- 정수형/실수형 선언과 할당
		int num01 = 25;
		int 형은 정수형의 대표적인 데이터 유형, 데이터를 25할당.
		double num02 = 3.15;
		double 형은 실수형의 대표적인 데이터 유형
	3) 변수명을 아래와 같이 선언하고 출력하세요
		- 이름, 나이, 키 
		- 좋아하는 음악명, 발매연도
		- 오늘 지출금액 목록과 비용, 합산
		
2. ppt 자료 작성 : 파일로(~0831)
	1) 자바 기본 환경 설정 ppt 자료로 작성하여 전달해 주세요.
 */
		String name01 = "마길동";
		int age = 25;
		double height = 178.2;
		System.out.println("이름:"+name01);
		System.out.println("나이:"+age+"살");
		System.out.println("키:"+height+"cm");
		String music = "사계";
		int pubYear = 1821;	
		System.out.println("# 좋아하는 음악 #");
		System.out.println("이름:"+music);
		System.out.println("발매연도:"+pubYear);
		/*
		오늘 지출금액 목록과 비용, 합산 
		 */
		String pay01 = "버스비";
		int payPrice01 = 2000;
		String pay02 = "점심식사";
		int payPrice02 = 7000;
		String pay03 = "지하철";
		int payPrice03 = 1500;
		int totPay = payPrice01 + payPrice02 
					+ payPrice03;
		System.out.println("# 오늘 지출 목록 #");
		System.out.println("목록1:"+pay01);
		System.out.println("목록1의 비용:"+payPrice01);
		System.out.println("목록2:"+pay02);
		System.out.println("목록3의 비용:"+payPrice02);
		System.out.println("목록3:"+pay03);
		System.out.println("목록3의 비용:"+payPrice03);
		System.out.println("총 비용:"+totPay);
	}

}
