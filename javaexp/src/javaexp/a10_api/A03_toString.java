package javaexp.a10_api;

class Food{
	// 재정의
	public String toString() {
		return "toString(): 참조변수만 호출";
	}
}

public class A03_toString {

	public static void main(String[] args) {
		Food f =new Food();
		System.out.println(""+f);
		
		// TODO Auto-generated method stub
		/*
		 # toString()
		 1. 클래스의 패키지와 클래스명 + 16진수 주소를 리턴
		 2. 참조변수만 호출 했을 때, 나타나는 데이터와 동일하다.
		 3. toString() 재정의하면 참조변수도 동일한 값으로 변경이 된다. 
		  */
		Player p01 = new Player("홍길동",0.342);
		Player p02 = new Player("홍길동",0.342);
		Player p03 = new Player("김길동",0.342);
		System.out.println(p01);
		System.out.println(p01.toString());
		System.out.println(p02);
		System.out.println(p03);
		System.out.println("p01==p02 :"+(p01==p02));
		System.out.println("p01==p03 :"+(p01==p03));
		System.out.println(p01.equals(p02));
		System.out.println(p01.equals(p03));
		
		// ex) Music 에 음악명 가수명을 속성으로 선언하고 toString()
		// 		재정의하여 참조값으로 확인되게 하세요..
		System.out.println("# toString() 처리 #");
		Music m01 = new Music("라라라","SG워너비");
		System.out.println(m01.toString());
		System.out.println(m01);
	}
}
class Music{
	private String musicName;
	private String singer;
	public Music(String musicName, String singer) {
		this.musicName = musicName;
		this.singer = singer;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.musicName+" - "+this.singer;
	}
	
}
class Player{
	private String name;
	private double record;
	
	public Player(String name, double record) {
		this.name = name;
		this.record = record;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.name+":"+this.record;
	}
	
}
