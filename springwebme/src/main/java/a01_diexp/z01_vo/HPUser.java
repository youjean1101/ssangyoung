package a01_diexp.z01_vo;
// a01_diexp.z01_vo.HandPhone
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
	
	// autowire="byName"으로 하면 객체가 id명과 setXXX property가 동일하면
	// 해당 메서드를 통해 객체가 할당이 된다.
	// 1. type이 할당이 가능하여야 함.
	// 2. set메서드가 id명과 동일해야 함.
	public void setHp02(HandPhone handPhone){
	      this.handPhone = handPhone;
	  }
}
