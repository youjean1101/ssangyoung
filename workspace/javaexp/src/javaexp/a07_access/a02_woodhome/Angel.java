package javaexp.a07_access.a02_woodhome;

public class Angel {
	public void callWoodCutter() {
		// 상속관계에 없는 것은 객체 생성, 참조변수
		WoodCutter wc = new WoodCutter();
//		# 같은 패키지의 클래스는 private 이외에 다 접근이 된다.
//		System.out.println("private:"+wc.privSec);
		System.out.println("default:"+wc.payOurHome);
		System.out.println("protected:"+wc.inheritMoney);
		System.out.println("public:"+wc.announce);
	}
}
