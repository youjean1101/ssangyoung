package javaexp.a07_access.a02_woodhome;

// WoodCutter의 상속 관계 클래스
public class Daughter extends WoodCutter{
	public void callWoodCutter() {
//		private 이외에는 접근이 가능하다.(상속관계)
//		System.out.println("private:"+privSec);
		System.out.println("default:"+payOurHome);
		System.out.println("protected:"+inheritMoney);
		System.out.println("public:"+announce);
	}
	
}
