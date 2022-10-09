package javaexp.a06_object;

public class A12_ObjVsObjExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex1) 1:1관계연습 Student(이름,ElementSch), ElementSch(학교명,졸업연도) 
//		 1) ElementSch - 필드와 기본 정보 출력
//		2) Student - 이름, ElementSch, 생성자, ElementSch 추가메서드, 출력 메서드
//		
		Student st01 = new Student("이철수");
		st01.showInfo();
//		System.out.println(st01); // toString()선언 메서드 호출
		st01.setEleSchol(new ElementSch("홍대부속초등학교", 2000));
		st01.showInfo();
		
//		Student st01 = new Student("이철수");
//		st01.graduateInfo();
////		System.out.println(st01); // toString()선언 메서드 호출
//		st01.setElementSch(new ElementSch(2000,"홍대부속초등학교"));
//		st01.graduateInfo();
	}
}

class ElementSch{
	private String sname;
	private int gradYear;
	public ElementSch(String sname, int gradYear) {
		this.sname = sname;
		this.gradYear = gradYear;
	}
	@Override
	public String toString() {
		return "초등학교 [학교명=" + sname + ", 졸업연도=" + gradYear + "년]";
	}
}
class Student{
	private String name;
	private ElementSch eleSchol;
	public Student(String name) {
		this.name = name;
	}
	public void setEleSchol(ElementSch eleSchol) {
		this.eleSchol = eleSchol;
//		System.out.println(name+"님의"+this.eleSchol+"할당");
	}
	public void showInfo() {
		System.out.println("## "+name+"의 초등학교 ##");
		if(this.eleSchol==null) {
			System.out.println("초등학교 정보가 없습니다.");
		}else {
			System.out.println(this.eleSchol);
		}
	}
	
}


/*
class ElementSch{
	private String elementSch;
	private int graduate;
	public ElementSch(int graduate,String elementSch) {
		this.graduate = graduate;
		this.elementSch = elementSch;
	}
	

	@Override
	public String toString() {
		return "졸업정보[학교명=" + elementSch + ", 졸업년도=" + graduate + "]";
	}
}
class Student {
	private String name;
	private ElementSch eleSchool;
	public Student(String name) {
		this.name = name;
	}
	public void setElementSch(ElementSch eleSchool) {
		this.eleSchool = eleSchool;
		System.out.println(this.name+"의 학교는"+this.eleSchool+"입니다.");
	}
	public void graduateInfo() {
	System.out.println("이름 :"+this.name);
	if(this.eleSchool!=null) {
		System.out.println(this.name+"님의 학교는 없습니다.");
	}else {
				System.out.println(this.eleSchool);
			}


	}
}
*/
