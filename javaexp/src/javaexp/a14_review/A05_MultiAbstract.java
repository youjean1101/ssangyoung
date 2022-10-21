package javaexp.a14_review;

import java.util.ArrayList;
import java.util.List;

public class A05_MultiAbstract {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		List<ComPart> cp = new ArrayList<ComPart>();
//		cp.add(new Cpu("i7 3.2Ghz"));
//		cp.add(new Ram("16G"));
//		cp.add(new Ssd("500G"));
//		for(ComPart p : cp) {
//			p.partFun();
//		}
		// 부품을 기준으로 더 사양을 추가하여 처리할 수 있다.
		// 다형성이 강력한 이유가 여기에 있다.
		Computer com = new Computer("조립 컴퓨터");
		com.addPart(new Cpu("i7 3.2Ghz"));
		com.addPart(new Ram("16G"));
		com.addPart(new Ssd("500G"));
		com.addPart(new GraphCard("128bit 64G"));
		com.showComInfo();
	}
}
/*
# 추상클래스를 상속받은 하위 클래스의 내용을 다형성으로 처리하고, 1:다관계를 처리하는 경우
1. 예제
 	컴퓨터의 여러가지 부품을 Part라는 추상 클래스를 상속받은 하위 실제 클래스로 생성하여 다양한 형태를 실제객체를 할당할 
 	수 있는 구조로 처리하는 1:다 구조를 말한다.
2. 처리순서
	1) 추상 클래스 선언
	2) 상속받은 하위 클래스 선언
	3) 위 내용을 포함하는 1:다 형태의 클래스 선언
		- 필드 선언
		- 생성자 선언
		- 기능 메서드 선언
			하나씩 담기
			리스트 처리하기
			
 */
class Computer{
	private String company;
	private List<ComPart> cp;
	public Computer(String company) {
		super();
		this.company = company;
		cp = new ArrayList<ComPart>();
	}
	//부품을 하나씩 추가/장착할 수 있는 기능 메서드.
	// 추상클래스를 상속받은 모든 클래스는 이 매개변수로 할당하여 부품을 추가할 수 있다.
	public void addPart(ComPart part) {
		System.out.println(part.getKind()+" 부품을 장착합니다.");
		cp.add(part);
	}
	public void showComInfo() {
		System.out.println(company+" 제조 컴퓨터!");
		if(cp.size()>0) {
			System.out.println("장착된 부품 리스트");
			// partFun()이라는 하위에 선언된 각각의 재정의된 메서드가 수행되어 진다.
			for(ComPart p:cp) {
				p.partFun();
			}
		}else {
			System.out.println("장착된 부품이 없네요");
		}
	}
	
}
abstract class ComPart {
	private String kind;
	private String perFrm;
	// 상위에 생성자를 통해서, 필드를 초기화 할 수 있게 선언
	// 상속받은 하위 클래스는 반드시 이 생성자를 호출하여야 한다.
	public ComPart(String kind,String perFrm) {
		this.kind = kind;
		this.perFrm = perFrm;
	}
	// 공통메서드
	public String getKind() {
		return kind;
	}
	
	public String getPerFrm() {
		return perFrm;
	}
	// 추상메서드
	public abstract void partFun();
	
}
	// 추상메서드는
	// 1. 상속 하위에 반드시 이 메서드이름으로 재정의 하여야 한다.
	//		==> 메서드가 통일화 할 수 있다.
	//		==> 다양형태로 기능을 처리할 수 있다.(다형성 - polymorphism)
class Cpu extends ComPart{

	public Cpu(String perFrm) {
		super("CPU",perFrm);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void partFun() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"는 "+getPerFrm()+" 성능을 가지고 있다.");
		System.out.println("컴퓨터에서 주로 중앙 처리를 해주는 부품이다.");
	}
}

// ex) Ram/Ssd
class Ram extends ComPart{
	public Ram(String perFrm) {
		super("Ram",perFrm);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void partFun() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"는 "+getPerFrm()+"성능을 가지고 있다.");
		System.out.println("컴퓨터에서 휘발성 메모리를 처리해 주는 부품이다.");
	}
}

class Ssd extends ComPart{

	public Ssd(String perFrm) {
		super("SSD", perFrm);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void partFun() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"는 "+getPerFrm()+"성능을 가지고 있다.");
		System.out.println("컴퓨터에서 하드웨어적으로 데이터를 저장해주느 저장 메모리 부품이다.");
	}
}
class GraphCard extends ComPart{

	public GraphCard(String perFrm) {
		super("그래픽카드", perFrm);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void partFun() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"는 "+getPerFrm()+"성능을 가진다.");
		System.out.println("메모리와 버스 속도에 따라 컴퓨터 그래픽을 효과적으로 처리한다.");
	}
	
	
}