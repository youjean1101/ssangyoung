package javaexp.a05_restore;

public class A01_Start {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 우리가 방에 물건을 저장할때, 효율적인 방법??
		 1. 작은 물건? 큰 물건? 적재
		 2. 하나의 공간(작은공간)	- stack영역
		 	1) 작은 물건  - primitive data type(크기가 일정)
		 	2) 큰 물건들이 있는 위치 정리 (해당 heap영역의 주소를 저장)
		 	 - 크기가 일정치 않음 ( 객체형 데이터 - 배열, 내강 객체, 사용자 정의 객체)
		 	 ex) 도서관/서점에서 물건 검색하는 단말기 : 해당 도서의 위치가르켜 준다. 
		 3. 두번째 공간(큰 공간 - 방1, 방2 ...) - heap영역
		 	1) 실제 큰 물건들이 있는 공간
		 		ex) 단말기로 통해 지정한 위치를 찾아가서 실제 도서가 있는 것을 확인. 
		  
 		# 자바의 데이터 타입 분류
 		1. 기본 타입
 		2. 참조 타입
 		- 자바는 정수/실수/boolean형을 바로 선언하여 사용하는 기본형 타입과,
 		객체형타입(배열/열거/클래스/인터페이스)에 의해 특정한 메모리를 참조하는 참조타입으로 크게 분류할 수 있다.
		# 변수의 메모리 사용
		1. 기본 타입 변수 - 실제 값을 변수 안에 저장
			cf) stack영역에 선언하고 실제 데이터를 할당
		2. 참조 타입 변수 - 주소를 통해 객체 참조
			cf) heap 영역에 저장하고 이 heap영역의 주소값을 stack영역에 저장한다.
			
		 */
		int num01 = 15; // stack영역에 15할당.
		int num02 = 15; // ex) 여기에 바나나가 있습니다. 바나나를 위치 시킴
		int[] arr01 = {10}; // heap 영역에 주소를 stack영역에서 arr01 
		// - 자동차가 있습니다. 자동차가 있는 위치 주차구역1 12자리
		int[] arr02 = {10}; // heap 영역에 주소를 stack영역에서 arr02
		// stack영역과 heap영역 할당..
		System.out.println(num01+":"+num02);
		// 1. 동일한 데이터이므로 동일한 데이터 할당.
		System.out.println(arr01+":"+arr02);
		// 2. 동일한 데이터이지만 heap영역의 주소값이 다르기에 다른 데이터가 나타난다.
		int num03 = num01; // num01의 데이터를 num03 할당. 
		// ex) 여기에 바나나3가 있습니다. 바나나라고 저장된 실제 바나나를 할당
		System.out.println(num01+":"+num03);
		num03 = 20; // 바나나3라고 이름 붙인 곳에 바나나 주스를 위치 시킴..
		System.out.println(num01+":"+num03);
		// 객체의 경우..
		int[] arr03 = arr01; //메모리 주소를 할당하기  
		// 자동차3가 있습니다. 여기에 자동차가 있습니다. 라고 적힌 곳의 위치 정보를 복사해서 할당
		// 이 정보가 주차구역1 12자리 자동차3에 할당.
		
		//ex> 같은 위치에 있는 집에 홍길동(아버지)의 집,
		// 					  이영자(어머니)의 집
		System.out.println(arr03+":"+arr01);
		System.out.println(arr03[0]+":"+arr01[0]);
		arr03[0] = 20; // 해당 위치에 있는 자동차 사과 1박스를 트렁크에 위치 시킴..
		System.out.println(arr03[0]+":"+arr01[0]);
		// 같은 주소에 있는 데이터를 이름만 달리하고 호출하기에 데이터를 동일하게 가지고 있다.
		// 비교연산자의 비교
		// 기본 유형의 비교는 할당된 실제 데이터를 비교.
		// * 자바의 데이터의 비교 연산자는 stack영역으 데이터를 비교하는 것이다
		// 1. 기본데이터 유형 - 실제 데이터를 확인해서 true/false
		// 2. 객체 유형 - heap영역의 주소가 같은지 여부를 확인.
		
		System.out.println("#기본 유형 데이터 비교#");
		System.out.println("num01 == num02:"+(num01 == num02));
		System.out.println("num01 == num03:"+(num01 == num03));
		System.out.println("#객체(배열) 비교#");
		System.out.println("arr01 == arr02:"+(arr01 == arr02));
		System.out.println("arr01 == arr03:"+(arr01 == arr03));
		// ex1> 나이1, 나이2, 나이3 정수형으로 선언하고, 
		// 		나이1과 나이2에 각각 25를 할당하고, 나이3은
		//		나이1 데이터를 할당하여, 각각의 데이터를 비교하세요.
		int age1, age2, age3;
			age1 = age2 =25;
			age3 = age1;
			System.out.println(age1);
			System.out.println(age2);
			System.out.println(age3);
			age3 = 30;
			System.out.println(age1);
			System.out.println(age2);
			System.out.println(age3);
		
		// ex2> int train1[]={3}을 3개 train1, train2 
//			선언 후, train3은 train1에서 할당한 후 
//			train1에 데이터를 변경 후, train3의 데이터를 확인하세요. 
			int[] train1, train2, train3;
			train1= new int[] {3,3,2};
			train2= new int[] {3,3,2};
			train3 = train1;
				System.out.println(train1);
				System.out.println(train2);
				System.out.println(train3);
				train3[0] = 10;
				System.out.println(train1[0]);
				System.out.println(train2[0]);
				System.out.println(train3[0]);
			
	}
}
