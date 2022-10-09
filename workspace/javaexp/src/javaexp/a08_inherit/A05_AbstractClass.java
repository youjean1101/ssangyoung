package javaexp.a08_inherit;

import java.util.ArrayList;

public class A05_AbstractClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Comp com = new Comp(); 추상클래스는 하위 클래스의 다형성을 위한 클래스이라서 혼자 객체 생성 안됨.
		Comp com1 = new Samsung01();
		com1.earnMoney();
		com1.working();
		
		Larva l01 = new Zergglng();
		Larva l02 = new Hydra();
		Larva l03 = new Multal();
		l01.attack();l01.move();
		l02.attack();l02.move();
		l03.attack();l03.move();
		// ex) 추상Player(선수의 정보)분류, 팀, train()공통 연습을 한다. play(): 재정의(추상)
		// ==> 실제BasePlayer, SoccerPlayer
		
		ArrayList<Player> players= new ArrayList<Player>();
		players.add(new BasePlayer("김광현"));
		players.add(new BasePlayer("이대호"));
		players.add(new BasePlayer("호잉"));
		players.add(new SoccerPlayer("손흥민"));
		for(Player p1:players) {
			// 공통메서드와 다양한 재정의하는 기능을 처리..
			p1.train();p1.play();
		}
		BestPlayer3 bp = new BestPlayer3(9);
		bp.serPlist(new BasePlayer("김광현"));
		bp.serPlist(new BasePlayer("호잉"));
		bp.serPlist(new BasePlayer("이대호"));
		bp.showList();
	}
}
class BestPlayer3{
	private int month; // 월
	private ArrayList<Player> plist;
	public BestPlayer3(int month) {
		this.month = month;
		this.plist = new ArrayList<Player>();
	}
	public void serPlist(Player player) {
		this.plist.add(player);
	}
	public void showList() {
		System.out.println(month+"월 Best Player");
		int no=0;
		for(Player p:plist) {
			System.out.print(++no+" ");
//			System.out.println(p.getKind()+" "+p.getName());
			p.play();
			
		}
	}
	
	
}
abstract class Player{
	private String kind;
	private String name;
	
	
	public Player(String kind, String name) {
		this.kind = kind;
		this.name = name;
	}
	public void train() {
		System.out.println(this.name+"은 열심히 연습을 한다.");
	}
	
	public String getKind() {
		return kind;
	}
	public String getName() {
		return name;
	}
	public abstract void play();
}
class BasePlayer extends Player{

	public BasePlayer(String name) {
		super("야구선수",name);
		// TODO Auto-generated constructor stub
	}
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" "+getName());
		System.out.println("야구 경기장에서 홈런을 쳤다~");
	}
}
class SoccerPlayer extends Player{

	public SoccerPlayer(String name) {
		super("축구선수",name);
		// TODO Auto-generated constructor stub
	}
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" "+getName());
		System.out.println("해트트릭 골을 넣었다.");
	}
	
	
}

abstract class Comp{ // 회사
	public void working() {
		System.out.println("일을 열심히 합니다.");
	}
	public abstract void earnMoney(); // 어떻게 버는지는 하위 클래스에서 반드시 재정의
}
class Samsung01 extends Comp{
	
	// 상속하는 상위에 있는 추상메서드 earnMoney를 반드시 재정의
	@Override
	public void earnMoney() {
		// TODO Auto-generated method stub
		System.out.println("전자 제품을 만들어서 돈을 번다.");
	}
	
}
/*
 # 추상 클래스(Abstract Class)
 1. 개념
 	1) 실체들 간의 공통되는 특성을 추출한 것
 		ex1) 새, 곤충, 물고기 ==>동물(추상)
 		ex2) 삼성, 현대, LG ==> 회사(추상)
 	2) 자바의 추상?
 		실체 클래스들의 공통되는 필드와 메소드 정의한 클래스
 		추상 클래스는 실체 클래스의 부모 클래스 역할(단독으로 객체 생성을 하지 못한다.)
 		cf) 실체 클래스 : 객체를 만들어 사용할 수 있는 클래스
 		Animal.class	(추상클래스) - 공통메서드, 추상메서드
 			(상속)
 		Bird.class Insect.class Fish.class(실제 클래스)
  2. 추상 클래스의 용도
  	1) 실체 클래스의 공통된 필드와 메소드의 이름 통일할 목적
  		- 실체 클래스를 설계자가 여러 사람일 경우, 
  		- 실체 클래스마다 필드와 메소드가 제각기 다른 이름을 가질 수 있음.
  	2) 실체 클래스를 작성할 때, 시간 절약
  		- 실체 클래스는 추가적인 필드와 메소드만 선언
  	3) 실체 클래스 설계 규격을 만들고자 할 때
  		- 실체 클래스가 가져야 할 필드와 메소드를 추상 클래스에 미리 정의
  		- 실체 클래스는 추상 클래스를 무조건 상속 받아 작성.
 
 */
// 애벌레 ==> 실제 객체.
abstract class Larva{
	private String kind;
	public Larva(String kind) {
		this.kind = kind;
	}
	// 공통 클래스
	public void move() {
		System.out.println(this.kind+" 이동하다.");
	}
	public String getKind() {
		return kind;
	}
	// 추상메서드
	public abstract void attack();
}
class Zergglng extends Larva{

	public Zergglng() {
		super("저글링");
		// TODO Auto-generated constructor stub
	}
	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" 빠른 근접공격을 한다.");
	}
}
class Hydra extends Larva{

	public Hydra() {
		super("히드라리스크");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" 원거리 강한 공격을 한다.");
	}
}
class Multal extends Larva{
	public Multal() {
		super("뮤탈리스트");
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" 원거리 공중 공격(공대치/공대공)을 한다.");
	}
}
