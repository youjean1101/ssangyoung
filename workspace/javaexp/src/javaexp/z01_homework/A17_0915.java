package javaexp.z01_homework;

import java.util.ArrayList;

import javax.swing.ComboBoxEditor;
import javax.swing.plaf.synth.SynthOptionPaneUI;

public class A17_0915 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 3. 상위클래스 School 학교의 분류 , 하위클래스 EleSchool/MiddleSchool/HighSchool을
		  선언하여 상위 생성자를 통해 하위객체를 할당처리하세요.
		 
		EleSchool s1 = new EleSchool();
		System.out.println("학교분류: "+s1.getDivSchool());
		MiddleSchool s2 = new MiddleSchool();
		System.out.println("학교분류: "+s2.getDivSchool());
		HighSchool s3 = new HighSchool();
		System.out.println("학교분류: "+s3.getDivSchool());
	}
}
class School{
	private String divSchool;

	public School(String divSchool) {
		this.divSchool = divSchool;
	}
	public String getDivSchool() {
		return this.divSchool;
	}
}
class EleSchool extends School{

	public EleSchool() {
		super("초등학교");
		// TODO Auto-generated constructor stub
	}
}
class MiddleSchool extends School{
	
	public MiddleSchool() {
		super("중학교");
		// TODO Auto-generated constructor stub
	}
}
class HighSchool extends School{
	
	public HighSchool() {
		super("고등학교");
		// TODO Auto-generated constructor stub
	}	
}
*/
/*
5. 상위클래스 ComPart 컴퓨터 부품, partFunction()부품의 기능,  
하위클래스 Cpu, Ram, Ssd를 선언하여 오버라이딩을 처리하여 구현하세요.
1:다관계로 다형성 처리 활용.
*/
		Computer02 com = new Computer02("맥 프로 노트북");
		com.setParts(new Cpu());
		com.setParts(new Ram());
		com.setParts(new Ram());
		com.setParts(new Ssd());
		com.setParts(new Ssd());
		com.showPartList();
		
	}
}
class Computer02{
	private String kind;
	private ArrayList<ComPart> parts;
	public Computer02(String kind) {
		this.kind = kind;
		this.parts = new ArrayList<ComPart>();
	}
	public void setParts(ComPart part) {
		// 1. 다형성 : 상위 = 하위
		//		ComPart part1 = new Cpu();
		//		ComPart part2 = new Ram();
		//		ComPart part3 = new Ssd();
		// 2. ArrayList 데이터 할당
		//		ArrayList<Cpu> list = new ArrayList<Cpu>();
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		
//				ArrayList<ComPart> list2 = new ArrayList<ComPart>();
//				list2.add(new Cpu());
//				list2.add(new Ram());
//				list2.add(new Ssd());
		this.parts.add(part);
	}
	public void showPartList() {
		System.out.println("컴퓨터 종류:"+kind);
		// 추상클래스는 객체를 자체로 생성하지 못할 뿐이지
		// 종속된 하위클래스를 할당해서 사용하는 것은 가능하다.
		for(ComPart cp:this.parts) {
			// 각 객체에서 재정의된 내용을 호출..
			cp.partFunction();
		}
	}
}
abstract class ComPart{
	private String kind;
	public ComPart(String kind) {
		this.kind = kind;
	}
	// 공통 메서드
	public String getKind() {
		return this.kind;
	}
	// 다양하게 처리할 메서드
	public abstract void partFunction();
}
class Cpu extends ComPart{
	public Cpu() {
		super("Cpu");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void partFunction() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"컴퓨터의 핵심 중앙처리 장치이다.");
	}
}
	class Ram extends ComPart{
		public Ram() {
			super("Ram");
			// TODO Auto-generated constructor stub
		}
		
		@Override
		public void partFunction() {
			// TODO Auto-generated method stub
			System.out.println(getKind()+"컴퓨터의 핵심 휘발성 메모리를 처리한다.");
		}
	}
		class Ssd extends ComPart{
			public Ssd() {
				super("Ssd");
				// TODO Auto-generated constructor stub
			}
			
			@Override
			public void partFunction() {
				// TODO Auto-generated method stub
				System.out.println(getKind()+"컴퓨터의 하드웨어적 저장을 처리한다.");
			}
	}

/*

		Cpu cp = new Cpu();
		cp.partFunction();
		Ram ra = new Ram();
		ra.partFunction();
		Ssd sd = new Ssd();
		sd.partFunction();
		
	}
}
class ComPart{
	private String part;

	public ComPart(String part) {
		this.part = part;
	}
	public void partFunction() {
		System.out.println(this.part+"가 기능: ");
	}
}
class Cpu extends ComPart{
	public Cpu() {
		super("CPU");
		// TODO Auto-generated constructor stub
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("기계어로 쓰인 컴퓨터 프로그램의 명령어를 해석하여 실행한다.");
	}
}
class Ram extends ComPart{
	public Ram() {
		super("RAM");
		// TODO Auto-generated constructor stub
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("정보에 빠르게 액세스할 수 있도록 컴퓨터가 실시간으로 사용하는 정보를 저장한다.");
	}
}
class Ssd extends ComPart{
	public Ssd() {
		super("SSD");
		// TODO Auto-generated constructor stub
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("데이터를 찾을 필요가 없어 거의 모든 데이터에 즉시 액세스할 수 있는 기억장치이다.");
	}
}
*/
/*
7. 상위클래스 Blabar 나비애벌래로 다양한 나비(호랑나비, 노랑나비, 파랑나비)가 
나오게 다형성 처리하고 showColor()메서드를 통해서 재정의 하세요

		ArrayList<Blabar> blist = new ArrayList<Blabar>();
		blist.add(new TigerBlabar());
		blist.add(new YellowBlabar());
		blist.add(new BlueBlabar());
		for(Blabar b1:blist) {
			b1.showColor();
		}
	}
}
class Blabar{
	private String color;

	public Blabar(String color) {
		this.color = color;
	}
	public void showColor() {
		System.out.println(this.color+"나비");
	}
}
class TigerBlabar extends Blabar{

	public TigerBlabar() {
		super("호랑");
		// TODO Auto-generated constructor stub
	}
	public void showColor() {
		super.showColor();
		System.out.println("옅은 노란색 바탕에 검은색 무늬");
	}
}
class YellowBlabar extends Blabar{
	
	public YellowBlabar() {
		super("노랑");
		// TODO Auto-generated constructor stub
	}
	public void showColor() {
		super.showColor();
		System.out.println("날개가 노란색");
	}
}
class BlueBlabar extends Blabar{
	
	public BlueBlabar() {
		super("파랑");
		// TODO Auto-generated constructor stub
	}
	public void showColor() {
		super.showColor();
		System.out.println("날개 윗면은 흑갈색이고 아랫면은 황갈색, 뒷날개 아랫면 중앙에는 가로로 길게 은백색 줄무늬");
	}
}
		*/
		/*1:다관계 설정 연습 - 버스/승객, 영화/배우들, 회사/종업원  
		Bus01 b01 = new Bus01("지리산고속버스");
		b01.showReserveSeat();
		b01.addBusSeat(new BusClient("홍길동", 28));
		b01.addBusSeat(new BusClient("김길동", 24));
		b01.showReserveSeat();
		
		Movie m1 = new Movie("수리남");
		m1.showActorAllList();
		m1.addActors(new Actors("황정민", "전요환"));
		m1.showActorAllList();
		m1.addActors(new Actors("조우진", "변기태"));
		m1.showActorAllList();
		
		Company02 c01 = new Company02("아이티젠");
		c01.showStaInfoAll();
		c01.addStaff(new Staff("정유진", "개발팀", "사원"));
		c01.addStaff(new Staff("정래민", "개발팀", "대리"));
		c01.showStaInfoAll();
		c01.addStaff(new Staff("홍길동", "개발팀", "사원"));
		c01.showStaInfoAll();
		
	}
}
class Company02{
	private String companyName;
	private ArrayList<Staff> slist;
	public Company02(String companyName) {
		this.companyName = companyName;
		this.slist = new ArrayList<Staff>();
	}
	public void addStaff(Staff sta) {
		this.slist.add(sta);
		System.out.println(this.companyName+" 회사에 "+sta.getStaName()+" 직원의 직원정보가 등록되었습니다.");
	}
	public void addStaffAll(ArrayList<Staff> sli) {
		this.slist=sli;
		this.addStaffAll(sli);
		System.out.println(sli.size()+"명의 직원이 등록되었습니다.");	
	}
	public void showStaInfoAll() {
		System.out.println("#"+this.companyName+"회사의 직원 정보#");
		if(this.slist.size()>0) {
			System.out.println("직원이름\t부서\t직급");
			for(int idx=0;idx<this.slist.size();idx++) {
				Staff sta01 = slist.get(idx);
				sta01.staffInfo(idx+1);
			}
		}else {
			System.out.println("등록된 직원의 정보가 없습니다.");
		}
	}
}
class Staff{
	private String staName;
	private String department;
	private String rank;
	public Staff(String staName, String department, String rank) {
		this.staName = staName;
		this.department = department;
		this.rank = rank;
	}
	public void staffInfo(int number) {
		System.out.print(this.staName+"\t");
		System.out.print(this.department+"\t");
		System.out.print(this.rank+"\n");
	}
	public String getStaName() {
		return staName;
	}
	public void setStaName(String staName) {
		this.staName = staName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
}

class Bus01{
	private String busName;
	private ArrayList<BusClient> buslist;
	private int totseat= 28;
	public Bus01(String busName) {
		this.busName = busName;
		this.buslist =new ArrayList<BusClient>();
	}
	public void addBusSeat(BusClient se1){
		this.buslist.add(se1);
		System.out.println(se1.getBusClient()+"님이 "+se1.getSeat()+"번 좌석을 예약하였습니다.");
	}
	public void addSeatCntAll(ArrayList<BusClient> buslist) {
		this.buslist = buslist;
		this.addSeatCntAll(buslist);
		System.out.println(buslist.size()+"개의 좌석이 예약되었습니다.");
		this.totseat -= buslist.size();
		
	}
	public void showReserveSeat() {
		System.out.println("#"+this.busName+"의 버스 예약 현황#");
		if(this.buslist.size()>0) {
			System.out.println("예약자\t좌석번호");
			for(BusClient c:this.buslist) {
				System.out.print(c.getBusClient()+"\t");
				System.out.print(c.getSeat()+"\n");
			}
			System.out.println(" * 남은좌석수:"+(this.totseat-buslist.size()));
		}else {
			System.out.println("아직 예약자가 없습니다.");
		}
	}
}
class BusClient{
	private String BusClient;
	private int seat;
	public BusClient(String busClient, int seat) {
		BusClient = busClient;
		this.seat = seat;
	}
	public String getBusClient() {
		return BusClient;
	}
	public void setBusClient(String busClient) {
		BusClient = busClient;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	
}
class Movie{
	private String movieName;
	private ArrayList<Actors> mlist;
	public Movie(String moviename) {
		this.movieName = moviename;
		this.mlist =new ArrayList<Actors>();
	}
	public void addActors(Actors a) {
		this.mlist.add(a);
		System.out.println(a.getName()+" 배우의 "+a.getRole()+"역이 추가 되었습니다.#");
	}
	public void addActorsAll(ArrayList<Actors> mlist) {
		this.mlist = mlist;
		this.addActorsAll(mlist);
	}
	public void showActorAllList() {
		System.out.println("#"+this.movieName+"의 배우 정보#");
		if(this.mlist.size()>0) {
			System.out.println("배우이름\t역할");
			for(Actors a:this.mlist) {
				System.out.print(a.getName()+"\t");
				System.out.print(a.getRole()+"역\n");
			}
		}else {
			System.out.println("등록된 배우의 정보가 없습니다.");
		}
	}
	
}

class Actors{
	private String acName;
	private String role;
	public Actors(String acName, String role) {
		this.acName = acName;
		this.role = role;
	}
	public String getName() {
		return acName;
	}
	public void setName(String acName) {
		this.acName = acName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}*/
		