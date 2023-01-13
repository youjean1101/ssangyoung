package a01_diexp.z01_vo;

// a01_diexp.z01_vo.HPUser
public class HPUser {
	private String name;
	private HandPhone handPhone;
	public HPUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HPUser(String name) {
		super();
		this.name = name;
	}
	public void usingMyPhone() {
		System.out.println("이름:"+name);
		if(handPhone!=null) {
			System.out.println("소유 폰은 ");
			System.out.println("폰번호:"+handPhone.getHnumber());
			System.out.println("제조사:"+handPhone.getCompany());
		}else {
			System.out.println("폰이 없습니다.");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public HandPhone getHandPhone() {
		return handPhone;
	}
	public void setHandPhone(HandPhone handPhone) {
		this.handPhone = handPhone;
	}
}
