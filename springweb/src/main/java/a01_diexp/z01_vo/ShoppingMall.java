package a01_diexp.z01_vo;

import java.util.List;

public class ShoppingMall {
	private String title;
	private List<Member> mlist;
	public ShoppingMall() {
		// TODO Auto-generated constructor stub
	}
	public ShoppingMall(String title) {
		this.title = title;

	}
	public void showMemberList() {
		System.out.println("#" +title+" 쇼핑몰 회원리스트 #");
		if(mlist!=null && mlist.size()>0) {
			System.out.println("아이디\t이름\t권한\t포인트");
			for(Member mem:mlist) {
				System.out.print(mem.getId()+"\t");
				System.out.print(mem.getName()+"\t");
				System.out.print(mem.getAuth()+"\t");
				System.out.println(mem.getPoint());
			}
		}else {
			System.out.println("등록된 회원명단이 없음");
		}
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Member> getMlist() {
		return mlist;
	}
	public void setMlist(List<Member> mlist) {
		this.mlist = mlist;
	}
	
}
