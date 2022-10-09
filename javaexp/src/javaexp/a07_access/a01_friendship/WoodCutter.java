package javaexp.a07_access.a01_friendship;

public class WoodCutter {
	private String hiddenCloth = "날개옷은 뒷동산 바위밑";
	// private : 현재 클래스에서 전역변수로 사용가능
	// 외부 클래스에서 호출 불가능
	String hiddenDeer = "사슴 뒷쪽 덤불 속에 있음";	// 접근제어자 X(default)
	// 같은 패키지에서만 접근가능, 다른 패키지에서 접근 불가능
	public String introMyself = "나는 나뭇꾼입니다!!";
	
}
