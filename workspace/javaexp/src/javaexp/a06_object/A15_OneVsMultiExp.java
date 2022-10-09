package javaexp.a06_object;

import java.util.ArrayList;

public class A15_OneVsMultiExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		SchClass stInfo = new SchClass(2);
//		stInfo.showStuAllList();
//		stInfo.addStudent(new SchStudent(29, "정유진"));
//		stInfo.showStuAllList();
//		stInfo.addStudent(new SchStudent(13, "홍길동"));
//		stInfo.addStudent(new SchStudent(01, "김길동"));
//		stInfo.showStuAllList();
		
		SchClass sc = new SchClass("1~5");
		sc.addStudent(new SchStudent("홍길동"));
		sc.addStudent(new SchStudent("신길동"));
		sc.addStudent(new SchStudent("김길동"));
		
		ArrayList<SchStudent> list = new ArrayList<SchStudent>();
		list.add(new SchStudent("진길동"));
		list.add(new SchStudent("김길동"));
		list.add(new SchStudent("박길동"));
		sc.addStuAll(list);
		sc.showList();
		
	}

}
// ex) SchClass(반/ArrayList<SchStudent>)-,	SchStudent(번호,이름) 1:다 관계를 설정하여 출력 처리하세요.
class SchClass{
	private String classnumber;
	private ArrayList<SchStudent> slist;
	public SchClass(String classnumber) {
		this.classnumber = classnumber;
		this.slist = new ArrayList<SchStudent>();
	}
	public void addStudent(SchStudent s) {
		// 현재 데이터 크기에서 하나씩 증가 시켜 번호로 등록
		s.setNumber(slist.size()+1); // 배열 1부터 선언하고 정보는 안받아도 됨.
		this.slist.add(s);
		System.out.println(s.getName()+"학생이 추가 되었습니다.");
	}
	public void addStuAll(ArrayList<SchStudent> alist) {
//		this.slist.addAll(alist);
		for(SchStudent st:alist) {
			st.setNumber(alist.size()+1);
			this.addStudent(st); // 기존에 선언한 기능 메서드 활용.
		}
		System.out.println(slist.size()+"명 학생 추가");
	}
	public void showList() {
		System.out.println("#"+classnumber+"반 학생 정보 #");
		if(slist.size()>0) {
			for(SchStudent ss:slist) {
				System.out.print(ss.getNumber()+"\t");
				System.out.println(ss.getName());
			}
			}else {
				System.out.println("학생 등록 준비중~");
				}
		}
	}
class SchStudent{
	private int number;
	private String name;
	public SchStudent(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}