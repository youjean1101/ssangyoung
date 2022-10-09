package javaexp.a07_access.a04_neighbor;

import javaexp.a07_access.a02_woodhome.WoodCutter;

public class Uncle {
	public void callWoodCutter() {
		WoodCutter wc = new WoodCutter();
//		# 다른 패키지의 클래스는 public 이외는 접근이 불가능하다.
//		System.out.println("private:"+wc.privSec);
//		System.out.println("default:"+wc.payOurHome);
//		System.out.println("protected:"+wc.inheritMoney);
		System.out.println("public:"+wc.announce);
//		public인 경우에는 import만 하면 어느 곳에서나 사용가능하다.
	}
}
