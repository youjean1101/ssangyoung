package javaexp.a07_access.a01_friendship;

public class Deer {
	public void callWoodCutter() {
		WoodCutter w1 = new WoodCutter();
		System.out.println(w1.hiddenDeer);
//		System.out.println(w1.hiddenCloth);	
//		같은 패키지이지만 접근제어자가 private이면 외부 클래스에서 생성 //쓰다맘..
	}
}
