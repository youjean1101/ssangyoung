package javaexp.a06_object;

import java.util.ArrayList;

public class A14_OneVsMulti {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShoppingMall sm = new ShoppingMall("행복");
		sm.showAllList();
		sm.regdateMember(new Member("himan","홍길동",1000));
		sm.regdateMember(new Member("higirl","홍리나",3000));
		sm.showAllList();
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(new Member("goodMan","이철수",5000));
		list.add(new Member("badGirl","김현지",10000));
		sm.regMemAll(list);
		sm.showAllList();
	}
}
class ShoppingMall{
	private String name;
	private ArrayList<Member> mlist;
	public ShoppingMall(String name) {
		this.name = name;
		// ArrayList 객체 생성
		this.mlist = new ArrayList<Member>();
	}
	// 하나씩 멤버를 추가하는 메서드
	public void regdateMember(Member m) {
		this.mlist.add(m);
		System.out.println(m.getId()+"회원 추가되었습니다.");
	}
	public void regMemAll(ArrayList<Member> list) {
//		this.mlist = list; // 전체 데이터 덮어씌우기
		this.mlist.addAll(list);	// 기존에서 list 추가 
		System.out.println(list.size()+"명 회원 추가");
	}
	public void showAllList() {
		System.out.println("#"+this.name+"쇼핑몰 회원 #");
		if(this.mlist.size()>0) {
			for(Member m:this.mlist) {
				System.out.print(m.getId()+"\t");
				System.out.print(m.getName()+"\t");
				System.out.print(m.getPoint()+"\n");
			}
		}else {
			System.out.println("회원 등록 준비 중!!");
		}
	}
}
class Member{
	private String id;
	private String name;
	private int point;
	public Member(String id, String name, int point) {
		this.id = id;
		this.name = name;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;

	}
	
}
/*
 # 1대 다관계 객체 활용
 1. 하나의 객체안에 여러개의 객체들을 사용할 수 있는 형태의 데이터 구조 처리를 말한다.
 2. 실무적인 예
 	1) 쇼핑몰에서 여러회원의 관리
 	2) 쇼핑몰에서 여러 물건 판매
 	3) 마트안에서 여러개 물건 판매
 	4) 컴퓨터 안에서 여라개의 부품
 	5) 하나의 클래스(1/1반) 안에서 여러명의 학생.
 3. 처리 순서
 	1) 다중의 포함될 객체의 단일 유형의 클래스 선언.
 		- 필드
 		- 생성자
 		- 메서드
 		ex) 여러회원 ==> 단일 회원 클래스 정의
 		
 	2) 포함할 클래스 선언(회원관리 쇼핑몰)
 		1)필드 - 고유 필드
 			ex) 쇼핑몰의 이름, 주소, 목적...
 		2) 필드 - 동적 배열 형태의 클래스 선언
 			ArrayList<Member> mlist
 			ex) 쇼핑몰에 포함된 다중의 데이터 요소 회원들, 물품
 				메뉴..
 		3) 생성자 - 고유필드 초기화, 동적배열 형태 초기화
 			ex) this.name = name;
 				this.name = new ArrayList<Member>();
 				담을 동적 배열을 초기화하여 객체로 생성
 	----------------------------------------------------------
 		4) 추가등록 메서드
 			- 하나씩 추가
 			
 				public void regMember(Member mem){
 					this.mlist.add(mem);
 						필드를 선언한 ArrayList에 하나씩 담기 처리.. 
 				ex) sh.regMember(new Member("himan","홍길동",10000))
 				ex) sh.regMember(new Member("higirl","마영숙",12000))
 				ex) sh.regMember(new Member("goodMan","오길동",20000))
 			- 다중으로 추가
 				public void regMemberAll(ArrayList<Member> mlist){
 					this.mlist.addAll(mlist); //mlist 갯수만큼 담겨짐
 					}
 					ex) 
 					ArrayList<Member> addM = new ArrayList<Member>();
 					addM.add(new Member("ohMan","신현식",20000));
 					addM.add(new Member("whiteWolf","김철수",22000));
 					addM.add(new Member("goodGirl","이선정",12000));
 					sh.regMemverAll( addM ); // 한번에 밀어 넣는것.
 					
 		5) 정보 출력 메서드
 			- 기본 정보 출력 : 쇼핑몰 이름: @@@
 			- ArrayList 출력
 				if(mlist.size()>0){//회원이 등록되었는지 조건
 					등록된 회원은 @@@명이고, 리스트 정보는
 					for(Member m:mlist){
 					m.getName() m.getId() m.getPoint()
 					}
 				}else{
 					등록된 회원이 없습니다.
 					}
 */

