package javaexp.a06_object.review;

public class A01_Field {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 필드
		 1. 클래스의 전역 변수역할을 하며, 객체로 만들었을 때, 주로 저장할 내용을
		 	지정하여 처리한다.
		 2. 일반적으로 클래스명 밑에 선언하여 처리한다.
		 3. 생성자에 의해 초기화 되거나 메서드에 의해 값을 변경 저장하는 경우가 많다.
		 # 생성자
		 1. 클래스에서 객체로 생성할 때, 필드로 초기값을 설정이 필요한 경우에 보통 활용된다.
		 2. default 생성자는 생성자를 선언하지 않을 때, 컴파일 과정에서 자동으로 생성되는 것을 
		 	말하고, 추가적인 생성자를 코드를 직접 입력하는 순간 사라진다.
		 */
		Person p01 = new Person();
		p01.name = "홍길동";
		p01.visiInfo = "가을의 파란하늘";
		p01.audioInfo = "좋아하는 가을 음악";
		System.out.println(p01.name);
		System.out.println(p01.visiInfo);
		System.out.println(p01.audioInfo);
		// ex> 학생 클래스 선언하고, 이름, 국어, 영어, 수학 필드를 선언하고 할당하고
		//		출력(총점/평균포함)하세요.
		Student s1 = new Student();
		s1.name = "정유진";
		s1.korPt = 60;
		s1.engPt = 75;
		s1.mathPt = 90;
		int tot = s1.korPt+s1.engPt+s1.mathPt;
//		double avg = tot/3;
		System.out.println("이름 : "+s1.name+ "\n국어점수:"+s1.korPt+"\n영어점수:"+s1.engPt+"\n수학점수:"+s1.mathPt);
		System.out.println("총점:"+tot);
		System.out.println("평균:"+(double)tot/3);
//		System.out.println("평균:"+avg);
		Person p02 = new Person();
		System.out.println("# 초기화된 생성자 #");
		System.out.println("이름:"+p02.name);
		Person p03 = new Person("홍길동");
		System.out.println("이름 : "+p03.name);
	
	}
}
class Student{
	String name;
	int korPt;
	int engPt;
	int mathPt;
} // 생성자가 없는 클래스지만, 데이터는 저장하여 보여줌 (default 생성자는 생성자를 선언하지 않을 때, 
//컴파일 과정에서 자동으로 생성되는 것을 말하고, 추가적인 생성자를 코드를 직접 입력하는 순간 사라진다.)

class Person{
	String name;
	String visiInfo; // 시각 정보
	String audioInfo; // 청각 정보
	Person(){ // 생성자
		this.name = "익명"; // 초기화를 위해 사용한다.
	}
	Person(String name){
		this(); // 선언된 생성자를 호출..
		this.name = name;
	}
}
