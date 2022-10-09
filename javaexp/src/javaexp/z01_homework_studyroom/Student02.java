package javaexp.z01_homework_studyroom;

import javaexp.z01_homework_playroom.Friend01;

public class Student02 {
	public void CallFriendInfo() {
		Friend01 f01 = new Friend01();
//		System.out.println("private:"+f01.myPriv);
//		System.out.println("default:"+f01.meetLoc);
		System.out.println("public:"+f01.outTName);
//		외부 패키지 소속 클래스는 public만 접근 가능
	}
	public void student01Info() {
		Student01 st01 = new Student01();
//		System.out.println("private:"+st01.myPoint);
		System.out.println("default:"+st01.studyName);
		System.out.println("public:"+st01.announce);
	}
}
