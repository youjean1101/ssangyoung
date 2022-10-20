package javaexp.a14_review;

import java.util.ArrayList;
import java.util.List;

public class A01_One_Multi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Mart m1 = new Mart("행복마트");
		m1.addCart(new Product("사과",2000,2));
		m1.addCart(new Product("바나나",4000,3));
		m1.addCart(new Product("딸기",12000,4));
		m1.calcuList();
		// ex) Player : 이름 성적 
		//	==> Team 팀명, List<Player> addPlayer, showPlayerList()
		Team t1 = new Team("토트넘");
		t1.addPlayer(new Player("손흥민", 3));
		t1.addPlayer(new Player("케인", 8));
		t1.addPlayer(new Player("누군가", 3));	
		t1.showPlayerList();
	}
}
// 오늘 진도 나간 1:다 관계 개인 이해 정도, 어떤 부분이 이해가 안갔는지, 표시.
class Team{
	private String tname;
	private List<Player> plist;
	public Team(String tname) {
		this.tname = tname;
		plist = new ArrayList<Player>();
	}
	public void addPlayer(Player person) {
		System.out.println("팀에 합류한 선수이름은?"+person.getName());
		plist.add(person);
		System.out.println("팀의 선수 수:"+plist.size());
	}
	
	public void showPlayerList() {
		System.out.println("\n#"+this.tname+"의 선수 정보#");
		for(Player p:plist) {
			p.showPlayer();
		}
	}
}
class Player{
	private String name;
	private double record;
	public Player() {
		// TODO Auto-generated constructor stub
	}
	public Player(String name, double record) {
		super();
		this.name = name;
		this.record = record;
	}
	public void showPlayer() {
		System.out.println("선수이름:"+this.name);
		System.out.println(this.name+"의 성적:"+this.record);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getRecord() {
		return record;
	}
	public void setRecord(double record) {
		this.record = record;
	}
	
	
}

/*
 # 1대 다관계 객체 구조
 1. 하나의 클래스 안에 여러개의 선언된 클래스를 객체를 호출하여, 궁극적으로 
 	하나의 객체 안에 여러개의 객첼르 사용할 수 있는 구조로 처리하는 형태를 말한다.
 2. 단계별 구조에 대한 이해
 	1) 단순 1:다 관계
 		ex) 마트에 파는 여러가지 물건
 	2) 여러 개의 다중 객체가 포함되어 있는 경우
 		ex) 온라인 쇼핑몰의 여러회원과 여러가지 물품
 	3) 추상클래스를 상속받은 클래스에 생성되는 다중의 객체를 선언하여 사용하는 경우
 		ex) 컴퓨터에서 부품이라는 추상클래스에서 상속받은 하위의 여러 실제클래스를 관계로
 			선언하여 할당하는 경우
 # 단순 1:다 관계
 */
class Mart{
	private String mname;
	private List<Product> list;
	public Mart(String mname) {
		this.mname = mname;
		list = new ArrayList<Product>();
	}
	public void addCart(Product prod) {
		System.out.println("장바구니 담기: "+prod.getName());
		list.add(prod);
		System.out.println("현재 담기 물건 갯수: "+list.size());
	}
	public void calcuList() {
		System.out.println(mname+"의 계산대에서!! ");
		int tot = 0;
		for(Product p:list) {
			tot += p.showInfo();
		}
		System.out.println("총 비용: "+tot);		
	}
}
class Product{
	private String name;
	private int price;
	private int cnt;
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public int showInfo() {
		System.out.print(name+"\t");
		System.out.print(price+"\t");
		System.out.print(cnt+"\t");
		System.out.print(price*cnt+"\n");
		return price*cnt;
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
