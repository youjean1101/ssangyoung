package a01_diexp.z01_vo;

import java.util.List;
// a01_diexp.z01_vo.Car02
public class Car02 {
	private String kind;
	private List<Tire> tlist;
	public Car02() {
		// TODO Auto-generated constructor stub
	}
	public Car02(String kind) {
		super();
		this.kind = kind;
	}
	public void showMyTire(){
		System.out.println("차량종류:"+kind);
		if(tlist!=null && tlist.size()>0){
			for(Tire t:tlist){
				System.out.println(t.getCompany()+"\t"+t.getPrice());
			}
		}else{
			System.out.println("타이어가 장착되지 않았습니다.");
		}
	}	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public List<Tire> getTlist() {
		return tlist;
	}
	public void setTlist(List<Tire> tlist) {
		this.tlist = tlist;
	}
		
}
