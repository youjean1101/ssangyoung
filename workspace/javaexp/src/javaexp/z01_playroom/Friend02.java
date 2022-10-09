package javaexp.z01_playroom;

public class Friend02 {
	public void Friend01() {
		Friend01 f1 = new Friend01();
//		System.out.println("private 이름:"+f1.name); // 다른 클래스라 에러
		System.out.println("default 집:"+f1.home);
		System.out.println("public 힉교"+f1.school);
	}
}
