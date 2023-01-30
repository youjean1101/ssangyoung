package a01_diexp.z06_vo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

public class ShoppingMall {
	private String title;
	@Autowired
	private List<MemberInf> mlist;
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
			for(MemberInf mem:mlist) {
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
	public List<MemberInf> getMlist() {
		return mlist;
	}
	public void setMlist(List<MemberInf> mlist) {
		this.mlist = mlist;
	}
	
}
