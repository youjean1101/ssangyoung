package javaexp.z01_homework_playroom;

import javaexp.z01_homework_studyroom.Student01;

public class Friend02 {
	public void CallFriendInfo() {
		Friend01 f01 = new Friend01();
//		System.out.println("private:"+f01.myPriv);
//		private는 같은 패키지에서 접근 불가
		System.out.println("default:"+f01.meetLoc);
		System.out.println("public:"+f01.outTName);
	}
	public void student01Info() {
		Student01 st01 = new Student01();
//		System.out.println("private:"+st01.myPoint);
//		System.out.println("default:"+st01.studyName);
		System.out.println("public:"+st01.announce);
	}
}
