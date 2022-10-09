package javaexp.z01_homework;

public class A15_0913_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 *2. playroom패키지 선언과 내부적으로 친구1, 친구2 클래스 선언, 
		 studyroom패키지선언 학생1, 학생2 클래스 선언, 친구1, 학생1에서 private, 
		 X(default), public에 적절한 필드값을 선언하고, 상호간에 호출하세요.
		 */
		/*
		 4. ScoccerPlayer에 팀명, 팀성적, 이름, 개인성적에서 팀명과 팀성적은 static, 
		 이름과 개인성적으로 instance변수를 선언하여 데이터를 할당하세요.
		 
		SoccerPlayer.tname = "토트넘";
		SoccerPlayer.trecord = 14;
		SoccerPlayer s1 = new SoccerPlayer("쿨루셰프스키", 0);
		System.out.println("현재 "+s1.tname+"의 승점:"+s1.trecord);
		System.out.println();
		s1.showInfo();
		System.out.println();
		s1.name = "케인";
		s1.record = 1;
		s1.showInfo();
		System.out.println();
		s1.name = "손흥민";
		s1.record = 2;
		s1.showInfo();
		
	}
}
class SoccerPlayer {
	String name;
	int record;
	int totrecord;
	static String tname;
	static int trecord;
	public SoccerPlayer(String name,int record) {
		super();
		this.name = name;
		this.record = record;
	}
	void showInfo() {
		System.out.println("이름: "+this.name);
		System.out.println("개인성적: "+this.record+"골");
		System.out.println("팀이름: "+tname);
		totrecord += record;
		if(this.totrecord>=2){
			trecord +=3;
			System.out.println("#2골이상시, 승리 확률 올라가므로 팀성적(+3)#");
		}else if(this.totrecord==0){
			trecord +=0;
			System.out.println("#무골시, 패배 확률 올라가므로 팀성적(+0)#");
		}else{
			trecord +=1;
			System.out.println("#1골시, 무승부 확률 올라가므로 팀성적(+1)#");
		}
		
		System.out.println("팀성적: "+trecord+"점");
	}
}
		*/
		/*
		*6. 컴퓨터의 종류, 사양내용(cpu,ram,hdd)을 static final, static)을 
		이용하여 초기화 호출하여 출력하세요.
		
		Computer c01 = new Computer();
		c01.cpu = "Intel(R) Pentium(R) 3558U 1.7GHz";
		c01.ram = "4GB";
		c01.hdd = "SSD 128GB";
		c01.showInfo();
		c01.cpu = "i5-1155G7";
		c01.ram = "16GB";
		c01.hdd = "SSD 256GB";
		c01.showInfo();
	}
}
		
class Computer{
	static String cpu;
	static String ram;
	static String hdd;
	static final String Type = "LG그램";
	
	public void showInfo() {
		System.out.println("컴퓨터 종류: "+Type);
		System.out.println("Cpu: "+this.cpu);
		System.out.println("Ram: "+ram);
		System.out.println("Hdd: "+hdd);
		System.out.println();
	}
}
*/ 
		/* 정답
		Computer c01 = new Computer("조립식",1500000);
		c01.show();
		c01.kind = "노트북";
		Computer.comp="삼성컴퓨터";
		c01.show();
	}
}
class Computer{
	// 인스턴스 변수 : 객체별, 변경가능
	String kind;
	// final 변수 : 객체별, 객체단위로는 변경 불가
	final int cost;
	// static 변수 : 클래스 단위 변수설정, 클래스 단위로는 변경가능
	static String comp;
	// static final 상수 : 클래스 단위로 상수설정, 변경불가
	static final String NATION="KOR";
	public Computer(String kind, int cost) {
		this.kind = kind;
		this.cost = cost;
	}
	public void show() {
		System.out.println("#### 컴퓨터 정보 #####");
		System.out.println("컴퓨터종류(인스턴스): "+this.kind);
		System.out.println("구매비용(인스턴스단위상수): "+this.cost);
		System.out.println("제조사(static변수): "+comp);
		System.out.println("(클래스상수): made in "+NATION);
	}
	
	
}
*/
		/*
		*8. 아래의 1:1관계 객체를을 선언해보세요.
            1) 자동차(차종,최고속도,배기량)와 자동차의소유주(이름,자동차, takeCar(자동차) driving() ) 를 선언
            2) 학생과 성적표
            3) 결혼할 커플(신랑, 신부)
            
            # 코드순서
            1. 종속될 클래스 선언
            	- 속성값(필드, 메서드) 구분
            	- 출력할 기능 메서드 선언.
            2. 포함할 클래스 선언
            	- 기본 속성 - 필드 선언
            	- 종속될 클래스 선언
            	- 생성자(기본 속성 - 필드)
            	- 종속될 클래스를 할당할 메서드 선언
            	- 전체 데이터 출력 메서드 선언.
            	*/
		CarOwner co01 = new CarOwner("홍길동");
		co01.driving();
//		public void takeCar(Car car)
		co01.takeCar(new Car("BMW",280,3500));
		co01.driving();		
		
		Record r1 = new Record("영어",90);
		System.out.println(r1.toString());
		System.out.println(r1);
//		toString()의 내용을 참조변수만 호출했을 떄, 
//		처리할 내용을 기술.
		Student st = new Student("홍길동");
		st.setR1(r1);
		st.show();
		st.setR1(new Record("수학",85));
		st.show();
		
		Bride b1 = new Bride("홍영희");
		b1.coupleInfo();
		b1.setWedding(new Groom("홍길동",27));
		b1.coupleInfo();
	}
}
class Groom{
	private String name;
	private int age;
	public Groom(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return "신랑정보 [신랑이름=" + name + ", 나이=" + age + "]";
		
	}
	public String getName() {
		return name;
	}
}

class Bride{
	private String name;
	private Groom groom;
	public Bride(String name) {
		this.name = name;
	}
	public void setWedding(Groom groom) {
		this.groom = groom;
		System.out.println("신랑:"+groom.getName()+"와 결혼하다");
	}
	public void coupleInfo() {
		System.out.println("신부: "+name+"");
		if(this.groom!=null) {
			System.out.println(this.groom);
		}else {
			System.out.println("아직 결혼전 입니다.");
		}
	}
	
}
class Student{
	private String name;
	private Record r1;
	public Student(String name) {
		this.name = name;
	}
	public void setR1(Record r1) {
		this.r1 = r1;
	}
	public void show() {
		System.out.println("#"+name+"학생 성적표 #");
		if(r1!=null) {
			System.out.println(r1);
		}else {
			System.out.println("성적표가 없네요!!");
		}
	}
	
}

class Record{
	private String subject;
	private int point;
	public Record(String subject, int point) {
		this.subject = subject;
		this.point = point;
	}
	// 속성값을 문자열로 깔끔하게 나타나게해줌 - toString()
	//toString()은 참조변수를 호출했을 때, 리턴할 내용을 기술
	// 객체의 참조 : 패키지명.클래스명@heap영역의 주소값
	@Override
	public String toString() {
		return "Record [과목=" + subject + ", 점수=" + point + "]";
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
// 이름, 자동차, takeCar(자동차) driving()
class CarOwner{
	private String name;
	private Car car;
	public CarOwner(String name) {
		this.name = name;
	}
	public void takeCar(Car car) {
		System.out.println("# 차를 타다 #");
		this.car = car;
	}
	public void driving() {
		System.out.println(this.name+"차를 운행하려고 합니다.");
		if(this.car!=null) { // 객체가 할당되어 있을 때..
			System.out.println("차를 운행합니다!");
			this.car.showCarInfo();
		}else {
			System.out.println("차가 없네요!");
		}
	}
}

// 자동차(차종,최고속도,배기량)
class Car{
	private String kind;
	private int maxSpeed;
	private int cc;
	
	public Car() {}

	public Car(String kind, int maxSpeed, int cc) {
		this.kind = kind;
		this.maxSpeed = maxSpeed;
		this.cc = cc;
	}
	public void showCarInfo() {
		System.out.println("차종:"+this.kind);
		System.out.println("최고속도:"+this.maxSpeed+"km/h");
		System.out.println("배기량:"+this.cc+"cc");
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getMaxSpeed() {
		return maxSpeed;
	}

	public void setMaxSpeed(int maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}
	
	
}
		/*
            	
		 
		System.out.println("#차와 소유주 정보#");
		CPerson c1 = new CPerson("정유진");
		c1.takeCar();
		c1.driving(new Car01("모닝",250,1000));
		c1.takeCar();
		
		System.out.println("#학생과 성적표 정보#");
		SPerson s1 = new SPerson("정유진");
		s1.checkStu();
		s1.recordStu(new Student(60,70,80));
		s1.checkStu();
		
		System.out.println("#신랑과 신부 정보#");
		MPerson m1 = new MPerson("선자 여사");
		m1.checkMarry();
		m1.couple(new Marry("선녀",30,"나무꾼",32));
		m1.checkMarry();
	}
}
class Car01{
	private String carKind;
	private int maxSpeed;
	private int cc;
	public Car01(String carKind, int maxSpeed, int cc) {
		super();
		this.carKind = carKind;
		this.maxSpeed = maxSpeed;
		this.cc = cc;
	}
	public void carInfo() {
		System.out.println("# 차 정보 #");
		System.out.println("차종류: "+this.carKind);
		System.out.println("최고속도: "+this.maxSpeed+"m/s");
		System.out.println("배기량: "+this.cc+"cc");
	}
}
class CPerson{
	private String name;
	private Car01 car;
	public CPerson(String name) {
		super();
		this.name = name;
	}
	public void driving(Car01 car) {
		this.car =car;
	}
	public void takeCar() {
		System.out.println(name+" 님의 차소유를 확인합니다.");
		if(car==null) {
				System.out.println("뚜벅이시네요.");
		}else {
			car.carInfo();
		}
	}
}

class Student {
	private int kor;
	private int eng;
	private int math;

	public Student(int kor, int eng, int math) {
		super();
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}

	public void stuInfo() {
		System.out.println("# 학생 성적 #");
		System.out.println("국어성적: "+this.kor);
		System.out.println("영어성적: "+this.eng);
		System.out.println("수학성적: "+this.math);
		System.out.println("평균성적: "+(this.kor+this.eng+this.math)/3);
	}
}
class SPerson{
	private String name;
	private Student stu;
	public SPerson(String name) {
		super();
		this.name = name;
	}
	public void recordStu(Student stu) {
		this.stu =stu;
	}
	public void checkStu() {
		System.out.println(name+" 학생이 있는지 확인합니다.");
		if(stu==null) { 
			System.out.println("학생이 없습니다.");
		}else {
			stu.stuInfo();
		}
	}
}
class Marry{
	private String manname;
	private int manage;
	private String womanname;
	private int womanage;
	private String dday;
	
	public Marry(String manname, int manage, String womanname, int womanage) {
		super();
		this.manname = manname;
		this.manage = manage;
		this.womanname = womanname;
		this.womanage = womanage;
	}
	public void marryInfo() {
		System.out.println("# 신랑/신부 정보#");
		System.out.println(this.manname);
		System.out.println(this.manage);
		System.out.println(this.womanname);
		System.out.println(this.womanage);
	}
}
class MPerson{
	private String parentsName;
	private Marry marry;
	public MPerson(String parentsName) {
		super();
		this.parentsName = parentsName;
	}
	
	public void couple(Marry marry) {
		this.marry = marry;
	}
	public void checkMarry() {
		System.out.println(parentsName+"님의 결혼정보가 있는지 확인합니다.");
		if(marry==null) { 
			System.out.println("신랑/신부의 정보가 없습니다.");
		}else {
			marry.marryInfo();
		}
	}
}
*/


		