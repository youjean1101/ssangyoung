package javaexp.z01_studyroom;

import javaexp.z01_playroom.Friend01;

public class Student01 {
	public void callFriend01() {
		Friend01 f1 = new Friend01();
//		System.out.println("private 이름:"+f1.name); // 다른 클래스라서 에러
//		System.out.println("default 집:"+f1.home); // 다른 패키지라서 에러
		System.out.println("public 힉교"+f1.school); 
	}
}
