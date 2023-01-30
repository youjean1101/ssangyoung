package a01_diexp.z06_vo;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

public class Mart {
	private String mname;
	@Autowired
	private List<Product> plist;
	// default 생성자는 반드시 생성해야 함.
	public Mart() {
	}
	public Mart(String mname) {
		super();
		this.mname = mname;
	}
	public void buyList() {
		System.out.println(mname+" 구매한 목록");
		if(plist!=null && plist.size()>0) {
			 System.out.println("물건명\t가격\t갯수");
			 for(Product p:plist) {
				 System.out.print(p.getName()+"\t");
				 System.out.print(p.getPrice()+"\t");
				 System.out.print(p.getCnt()+"\n");
			 }			
		}else {
			System.out.println("구매한 물건이 없네요");
		}
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public List<Product> getPlist() {
		return plist;
	}
	public void setPlist(List<Product> plist) {
		this.plist = plist;
	}
	
	
}
