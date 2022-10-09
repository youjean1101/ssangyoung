package javaexp.z01_homework;

import java.sql.Array;
import java.util.ArrayList;

public class A16_0914 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		1. 1:1관계 설정 연습 - 연필/종이, TV/리모콘, 어머니/자식, 스포츠팀/감독
		 */
		
//		스포츠팀/감독
		Team t1 = new Team("토트넘");
		t1.setDirInfo(new Director("안토니오 콘테", 52, 25));
		t1.showteamInfo();
		
		Child c1 = new Child("정유진",28);
		c1.setMomInfo(new Mom("이정민", 56));
		c1.showMomInfo();
		
		Remote m1 = new Remote("스마트티비");
		m1.showRemoteInfo();
		m1.setRemote(new Tv("LG", "On"));
		m1.showRemoteInfo();
		
		Paper p1 = new Paper("A4용지");
		p1.addPen(new Pen("모나미", "빨간색"));
		p1.showPenInfo();
		p1.addPen(new Pen("지브라", "검정색"));
		p1.addPen(new Pen("동아", "파랑색"));
		p1.showPenInfo();
	}
}
class Director{
	private String dirName;
	private int dirAge;
	private int dirCareer;
	public Director(String dirName, int dirAge, int dirCareer) {
		this.dirName = dirName;
		this.dirAge = dirAge;
		this.dirCareer = dirCareer;
	}
	@Override
	public String toString() {
		return "감독정보 [감독이름=" + dirName + ", 감독나이=" + dirAge + "세, 감독경력=" + dirCareer + "년]";
	}
}
class Team{
	private String teamName;
	private Director dirInfo;
	public Team(String teamName) {
		this.teamName = teamName;
	}
	public void setDirInfo(Director dirInfo) {
		this.dirInfo = dirInfo;
	}
	public void showteamInfo() {
		System.out.println(teamName+"의 정보");
		if(dirInfo != null) {
			System.out.println(this.dirInfo);
		}else {
			System.out.println("등록된 감독의 정보가 없습니다.");
		}
	}
}


//	어머니/자식

class Mom{
	private String momName;
	private int momAge;
	public Mom(String momName, int momAge) {
		this.momName = momName;
		this.momAge = momAge;
	}
	@Override
	public String toString() {
		return "Mom [어머니성함=" + momName + ", 어머니나이=" + momAge + "]";
	}
	
}
class Child{
	private String childName;
	private int childAge;
	private Mom momInfo;
	public Child(String childName, int childAge) {
		this.childName = childName;
		this.childAge = childAge;
	}
	public void setMomInfo(Mom momInfo) {
		this.momInfo = momInfo;
	}
	public void showMomInfo(){
		System.out.println("#"+this.childName+"("+this.childAge+")"+"의 어머니 정보#");
		if(momInfo==null) {
			System.out.println("등록된 어머니의 정보가 없습니다.");
		}else {
			System.out.println(this.momInfo); 
		}
	}
}

		
//		TV/리모콘
class Remote{
	private String kind;
	private Tv remote;
	
	public Remote(String kind) {
		this.kind = kind;
	}
	public void setRemote(Tv setremote) {
		this.remote = setremote;
	}
	public void showRemoteInfo() {
		System.out.println(kind+" 리모콘의 Tv 정보");
		if(remote != null) {
			System.out.println(this.remote);
		}else {
			System.out.println("리모콘에 맞는 Tv가 없습니다.");
		}
	}
}
class Tv{
	private String company;
	private String smartOnOff;
	public Tv(String company, String smartOnOff) {
		this.company = company;
		this.smartOnOff = smartOnOff;
	}
	@Override
	public String toString() {
		return "Tv [Brand=" + company + ", Smart 티비여부=" + smartOnOff + "]";
	}
}

		
//		연필/종이(1:다로 해버림)
	
class Paper{
	private String size;
	private ArrayList<Pen> plist;
	public Paper(String size) {
		this.size = size;
		this.plist = new ArrayList<Pen>(); 
	}
	public void addPen(Pen p) {
		this.plist.add(p);
	}
//	public void penCnt(ArrayList<Pen> resetlist) {
//		this.plist = resetlist;
//		this.plist.addAll(resetlist); // 새로 들어오는 정보로 덮어 씌어라
//	}
	public void showPenInfo() {
		System.out.println("#"+this.size+"에 적는 펜의 정보#");
		if(plist.size()>0) {
			for(int idx=0;idx<plist.size();idx++) {
				Pen p1 = this.plist.get(idx);
				System.out.println("펜제조사: "+p1.getCompany()+"\t펜 색:"+p1.getColor());
			}
		}else {
			System.out.println("펜 정보가 등록되지 않았습니다.");
		}
	}
}
class Pen{
	private String company;
	private String color;
	public Pen(String company, String color) {
		this.company = company;
		this.color = color;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
		
		/*
		 4. 구매한 물건(물건명,가격,갯수) 3개를 클래스를 선언하고 정적배열로 선언 할당 후, 
		 배열을 통해서 출력하세요.
		 
			Product[] pro = {new Product("휴지",17000,2),
							new Product("샴푸",5000,4),
							new Product("칫솔",2500,10),
							};
			for(int idx=0;idx<pro.length;idx++) {
//				System.out.println(idx+":"+pro[idx]+":");
				Product p1 = pro[idx];
				System.out.println("물건명: "+p1.getPname()+"\t가격: "+p1.getPrice()+"\t갯수: "+p1.getProCnt());
				System.out.println("총비용: "+p1.getPrice()*p1.getProCnt());
			}
			
		
		
	}
}
class Product{
	private String pname;
	private int price;
	private int proCnt;
	public Product(String pname, int price, int proCnt) {
		this.pname = pname;
		this.price = price;
		this.proCnt = proCnt;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProCnt() {
		return proCnt;
	}
	public void setProCnt(int proCnt) {
		this.proCnt = proCnt;
	}
}
*/
/*
5. 팀(팀명,승,무,패) 3개의 클래스를 정적배열객체로 선언 for문을 통해 getXXX메서드로 출력하세요.

				Team[] tlist = {new Team("아스널",5,0,1),
								new Team("맨시티",4,2,0),
								new Team("토트넘",4,2,0), 
								};
				for(int idx=0;idx<tlist.length;idx++) {
					Team t1 = tlist[idx];
					System.out.println("#팀이름:"+t1.getTname()+"#\n승: "+t1.getWin()+"\t무: "+t1.getTie()+"\t패: "+t1.getLose());
				}
	}
}
class Team{
	private String tname;
	private int win;
	private int lose;
	private int tie;
	public Team(String tname, int win, int lose, int tie) {
		this.tname = tname;
		this.win = win;
		this.lose = lose;
		this.tie = tie;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getTie() {
		return tie;
	}
	public void setTie(int tie) {
		this.tie = tie;
	}
}
*/
/*
 7. 읽어야할 도서명 5권을 ArrayList로 선언/추가하고 출력하세요.
	ArrayList bookList = new ArrayList();
	bookList.add("채쌤의 자바프로그래밍1");
	bookList.add("채쌤의 자바프로그래밍2");
	bookList.add("채쌤의 자바프로그래밍3");
	bookList.add("채쌤의 자바프로그래밍4");
	bookList.add("채쌤의 자바프로그래밍5");
	for(int idx=0;idx<bookList.size();idx++) {
		System.out.println("읽어야할 도서명 :"+bookList.get(idx));
	}
	}
}
*/
/*
 9. 아래의 1:다관계 동적처리 구조의 데이터를 처리하세요.
      1) 마트/구매물건 2) 도서관/빌린도서  3) 컴퓨터/구성하는부품
      # 처리 순서
      1. 포함될 클래스
      		필드/get/set/출력메서드
      2. 포함할 클래스
      		필드(고유 속성, 포함될 클래스 ArrayList)
      		생성자(고유 속성 초기화, ArrayList객체 생성)
      		메서드(단일 추가 메서드/다중 추가 메서드/전체내용 출력내용처리)

		Mart m = new Mart("행복");
		m.calrcu();
		m.addBuyList(new Product("사과",2000,2));
		m.addBuyList(new Product("바나나",4000,3));
		m.addBuyList(new Product("오렌지",1200,5));
		m.calrcu();
		
		Library lb = new Library("서울시립도서관");
		lb.showLentList();
		lb.addLendList(new LBook("himan","기초자바","2022-10-10"));
		lb.addLendList(new LBook("higirl","jsp향상","2022-10-15"));
		lb.addLendList(new LBook("goodMan","스프링완성","2022-11-11"));
		lb.showLentList();
		
		Computer01 com = new Computer01("데스크탑","조립품");
		com.setPlist(new Part("CPU","인텔","i7 3.5GHz"));
		com.setPlist(new Part("Ram","하이닉스","16G"));
		com.setPlist(new Part("ssd","삼성","250G"));
		com.showPartList();
	}
}
class Computer01{
	private String kind; //종류..
	private String comp; //제조사
	private ArrayList<Part> plist;
	public Computer01(String kind, String comp) {
		this.kind = kind;
		this.comp = comp;
		this.plist =new ArrayList<Part>();
	}
	public void setPlist(Part p) {
		this.plist.add(p);
		System.out.println(p.getPname()+"부품 추가");
	}
	public void showPartList() {
		System.out.println("# 컴퓨터 사양 #");
		System.out.println("종류:"+this.kind);
		System.out.println("제조사:"+this.comp);
		if(plist.size()==0) {
			System.out.println("부품이 아직 없네요.");
		}else {
			System.out.println("포함된 부품 리스트");
			System.out.println("부품종류\t제조사\t사양");
			for(Part p:this.plist) {
				System.out.print(p.getPname()+"\t");
				System.out.print(p.getComp()+"\t");
				System.out.print(p.getPerform()+"\n");
			}
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	public ArrayList<Part> getPlist() {
		return plist;
	}

}
class Part{
	// 부품종류, 제조사, 사양
	private String pname;
	private String comp;
	private String perform;
	public Part(String pname, String comp, String perform) {
		this.pname = pname;
		this.comp = comp;
		this.perform = perform;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	public String getPerform() {
		return perform;
	}
	public void setPerform(String perform) {
		this.perform = perform;
	}
	
}
class Library{
	private String name;
	private ArrayList<LBook> lblist;
	public Library(String name) {
		this.name = name;
		this.lblist = new ArrayList<LBook>();
	}
	public void addLendList(LBook book) {
		this.lblist.add(book);
		System.out.println(book.getLendId()+"님이 "+book.getTitle()+" 대출하였습니다.");
	}
//	public void arrayList(ArrayList<LBook> list) {
//		this.lblist =list;
//		this.arrayList(list);
//	}
	public void showLentList() {
		System.out.println(name+"에서 대출된 대출내역");
		if(lblist.size()>0) {
			System.out.println("번호\t대출자\t도서명\t반납일");
		for(int idx=0;idx<lblist.size();idx++) {
			LBook bk = lblist.get(idx);
			bk.lendInfo(idx+1); //번호 리스트
		}
		System.out.println("총 "+lblist.size()+"권 대출되었습니다!!");
		}else {
			System.out.println("대출된 내용이 없습니다.");
		}
	}
}
class LBook {
	// 빌린사람, 도서명, 반납일
	private String lendId;
	private String title;
	private String endData;
	public LBook(String lendId, String title, String endData) {
		this.lendId = lendId;
		this.title = title;
		this.endData = endData;
	}
	public void lendInfo(int no) {
		System.out.print(no+"\t");
		System.out.print(lendId+"\t");
		System.out.print(title+"\t");
		System.out.print(endData+"\n");
		
	}
	public String getLendId() {
		return lendId;
	}
	public void setLendId(String lendId) {
		this.lendId = lendId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEndData() {
		return endData;
	}
	public void setEndData(String endData) {
		this.endData = endData;
	}	
}
class Mart{
	private String mname;
	private	ArrayList<Product> blist;
	public Mart(String mname) {
		this.mname = mname;
		this.blist = new ArrayList<Product>();
	}
	public void addBuyList(Product product) {
		this.blist.add(product);
		System.out.println(product.getName()+" "+product.getCnt()+"개 구매목록에 담았습니다.");
	}
	public void calrcu() {
		System.out.println(mname+"에서 구매 및 계산서");
		if(blist.size()>0) {
			int cnt = 0;
			int tot = 0;
			System.out.println("no\t물건명\t가격\t갯수\t계");
			for (Product prod:blist) {
				System.out.print(++cnt+"\t");
				tot+=prod.buyInfo();
			}
			System.out.println("총계:"+tot);
		}else {
			System.out.println("아직 구매한 목록이 없습니다.");
		}
	}
	
}
class Product{
	private String name;
	private int price;
	private int cnt;
	public Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public int buyInfo() {
		System.out.print(this.name+"\t");
		System.out.print(this.price+"\t");
		System.out.print(this.cnt+"\t");
		System.out.print(this.price*this.cnt+"\n");
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
	
	
}*/
	
		/*
		Mart m1 = new Mart("롯데");
		m1.addProduct(new Product("휴지", 17000));
		m1.showProAllList();
		m1.addProduct(new Product("샴푸", 6000));
		m1.addProduct(new Product("칫솔", 2500));
		m1.showProAllList();
		
		Library l1 = new Library("홍대");
		l1.showBookAllList();
		l1.addBook(new Book("채쌤의 자바 프로그래밍",7));
		l1.addBook(new Book("채쌤의 자바 프로그래밍2",7));
		l1.showBookAllList();
		
		Computer c1 = new Computer("LG그램");
		c1.showPartAllList();
		c1.addPart(new Part("마우스","로지텍"));
		c1.addPart(new Part("키보드","삼성"));
		c1.addPart(new Part("스피커","LG"));
		c1.showPartAllList();
	
		
	}
}
class Computer{
	private String comName;
	private  ArrayList<Part> palist;
	
	public Computer(String comName) {
		this.comName = comName;
		this.palist = new ArrayList<Part>();
	}
	public void addPart(Part p) {
		this.palist.add(p);
		System.out.println(p.getInputPart()+"제품이 추가 되었습니다.");
	}
	public void addPartAll(ArrayList<Part> palist) {
		this.palist = palist;
		this.addPartAll(palist);
		System.out.println(palist.size()+"개의 장비 추가");
	}
	public void showPartAllList() {
		System.out.println("#"+this.comName+"의 컴퓨터 정보 출력");
		if(this.palist.size()>0) {
			for(Part p:this.palist) {
				System.out.println("입출력장치명:"+p.getInputPart());
				System.out.println("제조사:"+p.getCompany());
			}
			}else {
				System.out.println("장치 입력 대기중");
			}
		}
	}
	
	
class Part{
	private String inputPart;
	private String company;
	public Part(String inputPart, String company) {
		this.inputPart = inputPart;
		this.company = company;
	}
	public String getInputPart() {
		return inputPart;
	}
	public void setInputPart(String inputPart) {
		this.inputPart = inputPart;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
}
class Library{
	private String liname;
	private ArrayList<Book> blist;
	public Library(String liname) {
		this.liname = liname;
		this.blist = new  ArrayList<Book>();
	}
	public void addBook(Book b) {
		this.blist.add(b);
		System.out.println(b.getBookName()+"의 책이 추가 되었습니다.");
	}
	public void addBookAll(ArrayList<Book> blist) {
		this.blist = blist;
		this.blist.addAll(blist);
		System.out.println(blist.size()+"권의 책 추가");
	}
	public void showBookAllList() {
		System.out.println("#"+this.liname+"도서관의 책 정보 #");
		if(this.blist.size()>0) {
			for(Book b:this.blist) { 
				System.out.print("책이름: "+b.getBookName());
				System.out.println("\t대출일: "+b.getCheckoutday()+"일");
				}
			}else {
				System.out.println("책 등록 준비중~");
				}
		}
	}

class Book{
	private String bookName;
	private int checkoutday;
	public Book(String bookName, int checkoutday) {
		this.bookName = bookName;
		this.checkoutday = checkoutday;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getCheckoutday() {
		return checkoutday;
	}
	public void setCheckoutday(int checkoutday) {
		this.checkoutday = checkoutday;
	}
	
	
}

class Mart{
	private String martName;
	private ArrayList<Product> plist;
	public Mart(String martName) {
		this.martName = martName;
		this.plist = new  ArrayList<Product>();
	}
	public void addProduct(Product p) {
		this.plist.add(p);
		System.out.println(p.getName()+"제품이 추가 되었습니다.");
	}
	public void addProAll(ArrayList<Product> plist) {
		this.plist = plist;
		this.addProAll(plist);
		System.out.println(plist.size()+"개 물건 추가");
	}
	public void showProAllList() {
		System.out.println("#"+this.martName+"마트의 정보 #");
		if(this.plist.size()>0) {
			for(Product p:this.plist) {
				System.out.println("물건명:"+p.getName());
				System.out.println("가격:"+p.getPrice()+"원");
			}
			}else {
				System.out.println("물건 입고 대기중");
			}
		}
	}
class Product{
	private String name;
	private int price;
	public Product(String name, int price) {
		this.name = name;
		this.price = price;
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
}
*/

	

	
	
	

