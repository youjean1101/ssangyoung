package javaexp.a07_access.a03_sonhome;

import javaexp.a07_access.a02_woodhome.WoodCutter;
// 상위클래스가 다른 패키지에 있는 상속받은 하위 클래스
public class Son1 extends WoodCutter{
	public void callWoodCutter() {
//		private 접근 안됨
//		System.out.println("private:"+privSec);
//		X 같은 패키지가 아니기에 접근이 안됨
//			접근제어자가 default(X)인 것은 패키지 내에서 클래스간에 자유롭게 사용가능하다.
//			(패키지 = default)
//		System.out.println("default:"+payOurHome);
//		다른 패키지 일지라도 protected라고 붙은 접근제어자는 변수는 접근이 가능하다.
//		(상속관계가 전제조건)
		System.out.println("protected:"+inheritMoney);
		System.out.println("public:"+announce);
		WoodCutter wc = new WoodCutter();
		// 상속관계라는 자기 몸체 사용형식을 사용하지 않고, 상속관계임에도 불구하고 참조값으로
		//	외부 객체를 호출하는 형식으로 처리할 때는 protected로 접근할 수 없다.
//		System.out.println(wc.inheritMoney); //에러
	
	}
}
