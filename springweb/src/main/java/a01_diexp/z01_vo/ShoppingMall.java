package a01_diexp.z01_vo;
// a01_diexp.z01_vo.ShoppingMall
import java.util.List;

public class ShoppingMall {
	//쇼핑몰명	List<Member>
	private String shopname;
	private List<Member> mlist;
	public ShoppingMall() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShoppingMall(String shopname) {
		super();
		this.shopname = shopname;
	}
	public void memberList() {
		System.out.println("# "+shopname+"의 회원리스트 #");
		if(mlist!=null && mlist.size()>0) {
			System.out.println("아이디\t비밀번호\t이름\t권한\t포인트");
			for(Member m:mlist) {
				System.out.print(m.getId()+"\t");
				System.out.print(m.getName()+"\t");
				System.out.print(m.getAuth()+"\t");
				System.out.print(m.getPoint()+"\n");
			}
		}else {
				System.out.println("회원정보가 없습니다.");
		}
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public List<Member> getMlist() {
		return mlist;
	}
	public void setMlist(List<Member> mlist) {
		this.mlist = mlist;
	}
	
	
}
