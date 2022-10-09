package javaexp.z01_homework;

import java.util.ArrayList;

public class A19_0917 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 3. ArrayList<Product>를 활용하여 구매할 물건 정보 3개를 추가하여 출력처리하세요.
      int tot()메서드로 내용 출력과 물건가격*물건단가를 리턴하게 하여, 물건 3개의 총비용을 
      누적 처리되게 하세요.
      */
//		정답
		ArrayList<Prod> buyList = new ArrayList<Prod>();
		buyList.add(new Prod("사과",3000,2));
		buyList.add(new Prod("바나나",4000,3));
		buyList.add(new Prod("딸기",12000,4));
		int sum=0; //누적할 변수는 상단에 전역변수
		for(int idx=0;idx<buyList.size();idx++) {
			Prod p = buyList.get(idx);
			System.out.println(p.getName()+"\t");
			System.out.println(p.getPrice()+"\t");
			System.out.println(p.getCnt()+"\t");
			int tot = p.getPrice()*p.getCnt();
			sum +=tot; // 각 단위 계를 누적해서 전체 총계 처리.
			System.out.println(tot+"\n");
		}
		System.out.println("전체 총계:"+sum);
	}
}
class Prod{
	private String name;
	private int price;
	private int cnt;
	public Prod(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
		/*

		ArrayList<Product05> proList = new ArrayList<Product05>();
		proList.add(new Product05("헤드폰 ", 330000, 4));
		proList.add(new Product05("아이패드", 1000000, 2));
		proList.add(new Product05("그램노트북", 1500000, 3));
		System.out.println("# 구매 목록 #");
		System.out.println("물건명\t가격\t갯수\t총비용");
		int totPay = 0;
		for(int idx=0;idx<proList.size();idx++) {
			Product05 p01 = proList.get(idx);
			System.out.print(p01.getName()+"\t");
			System.out.print(p01.getPrice()+"원\t");
			System.out.print(p01.getCnt()+"개\t");
			System.out.println(p01.tot()+"원");
			totPay += p01.tot();
		}
		System.out.println("지불해야할 총비용 : "+totPay+"원");
	

		
	}
}
class Product05{
	private String name;
	private int price;
	private int cnt;
	public Product05(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	int tot() {
		return this.price*this.cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
*/
	/*
	  7. 아래의 여러가지 1:다 관계 클래스를 선언하고 출력하세요.
      1) 담당교수, 수강 학생
		Professor s1 = new Professor("양현수", "자바&AWS 클라우드를 활용한 Full-Stack 개발자 양성과정");
		s1.showStuInfoAll();
		s1.addStudent(new Student02("정유진","쌍용교육", 22));
		s1.showStuInfoAll();
		s1.addStudent(new Student02("홍길동","쌍용교육", 21));
		s1.addStudent(new Student02("김아무개","쌍용교육", 20));
		s1.showStuInfoAll();
	}
}
class Professor{
	private String proName;
	private String subject;
	private ArrayList<Student02> slist;
	public Professor(String proName, String subject) {
		this.proName = proName;
		this.subject = subject;
		this.slist = new ArrayList<Student02>();
	}
	public void addStudent(Student02 s) {
		this.slist.add(s);
	}
	public void stuInfoAll(ArrayList<Student02> list) {
		this.slist = list;
		this.slist.addAll(list);
	}
	public void showStuInfoAll() {
		System.out.println("#"+this.proName+"교수님의 "+this.subject+"과목 듣는 학생 정보#");
		if(this.slist.size()>0) {
			for(Student02 s:this.slist) {
				System.out.print("이름:"+s.getStuName()+"\t");
				System.out.print("전공:"+s.getDepartment()+"학과\t");
				System.out.println("학번:"+s.getStudentID()+"학번");
			}
			System.out.println(this.subject+"과목 수강등록한 학생 수:"+this.slist.size());
		}else {
			System.out.println("등록된 학생의 정보가 없습니다.");
		}
		
	}
}
class Student02{
	private String stuName;
	private String department;
	private int StudentID;
	public Student02(String stuName, String department, int studentID) {
		this.stuName = stuName;
		this.department = department;
		StudentID = studentID;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}	
}
 2) 기차, 기차 좌석정보

		Train t1 = new Train("서울-부산", "KTX");
		t1.addSeat(new Seat(2,2));
		t1.showSeatInfo();
		t1.addSeat(new Seat(3,5));
		t1.addSeat(new Seat(2,1));
		t1.showSeatInfo();
		t1.addSeat(new Seat(1,1));
		t1.addSeat(new Seat(1,10));
		t1.showSeatInfo();
	}
}
class Train{
	private String fromTo;
	private String name;
	private int totSeat1 = 48;
	private int totSeat2 = 48;
	private int totSeat3 = 48;
	private int totSeat4 = 48;
	private int totSeat5 = 48;
	private int totSeat6 = 48;
	private int totalSeat = totSeat1+totSeat2+totSeat3+totSeat4+totSeat5+totSeat6;
	private ArrayList<Seat> slist;
	public Train(String fromTo, String name) {
		this.fromTo = fromTo;
		this.name = name;
		this.slist = new ArrayList<Seat>();
	}
	public void addSeat(Seat s) {
		this.slist.add(s);
	}
	public void showSeatInfo() {
		System.out.println("#"+this.fromTo+"으로 가는 "+name+"기차 좌석 정보#");
		if(this.slist.size()>0) {
			for(Seat s:slist) {
				s.seatInfo();
				switch(s.getSection()) {
				case 1:
					totSeat1 -= s.getCnt();
					System.out.println("1호차 잔여좌석(총 48):"+totSeat1);
					break;
				case 2:
					totSeat2 -= s.getCnt();
					System.out.println("2호차 잔여좌석(총 48):"+totSeat2);
					break;
				case 3:
					totSeat3 -= s.getCnt();
					System.out.println("3호차 잔여좌석(총 48):"+totSeat3);
					break;
				case 4:
					totSeat4 -= s.getCnt();
					System.out.println("4호차 잔여좌석(총 48):"+totSeat4);
					break;
				case 5:
					totSeat5 -= s.getCnt();
					System.out.println("5호차 잔여좌석(총 48):"+totSeat5);
					break;
				case 6:
					totSeat6 -= s.getCnt();
					System.out.println("6호차 잔여좌석(총 48):"+totSeat6);
					break;
				default:
					System.out.println("해당 호차는 없습니다.");
					break;
				}
				totalSeat -= s.getCnt();
				System.out.println(" * 총 잔여좌석:"+totalSeat);
			}
		}else {
			System.out.println("아직 좌석 예약이 되지 않았습니다.");
		}
		System.out.println();
	}
}
class Seat{
	private int section;
	private int cnt;
	public Seat(int section, int cnt) {
		this.section = section;
		this.cnt = cnt;
	}
	public void  seatInfo() {
		System.out.print("호차: "+this.section+"호차\t");
		System.out.print("예약좌석수: "+this.cnt+"개\t");
	}
	
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
	*/	

	/*
	 9. 상위로 추상 클래스 Robot 추상 메서드(attack())을 생성자로 로봇의 종류를 할당하게 하고, Dagan, Gundam을
   상속하여 해당 생성자를 통해서  호출하여 처리하고 출력되게 하세요.
  
		Robot r1 = new Dagan();
		Robot r2 = new Gundam();
		r1.lego();r1.attack();
		r2.lego();r2.attack();
		
	}
}
abstract class Robot{
	private String kind;

	public Robot(String kind) {
		this.kind = kind;
	}
	public void lego() {
		System.out.println(this.kind+"을 조립하다.");
	}
	public String getKind() {
		return kind;
	}
	public abstract void attack();
}
class Dagan extends Robot{

	public Dagan() {
		super("드래곤");
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
	}	
}
class Gundam extends Robot{
	
	public Gundam() {
		super("건담");
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		
	}
} */
