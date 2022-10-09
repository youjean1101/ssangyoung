package javaexp.z01_homework_playroom;

import javaexp.z01_homework_studyroom.Student01;

public class Friend01 {
	private String myPriv = "친구1의 비밀";
	String meetLoc = "친구들과 강남에서 모였다.";
	public String outTName = "우리는 고등학교 친구들이다!";
	
	public void CallFriendInfo() {
		Friend01 f01 = new Friend01();
		System.out.println("private:"+f01.myPriv);
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
