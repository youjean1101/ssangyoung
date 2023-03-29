package z02_teamproject4.vo;

public class Olddealuser {
	private String id;
	private String password;
	private String userdiv;
	private String username;
	private String nickname;
	private String rrn;
	private String phonenumber;
	private String zipcode;
	private String address;
	private String detailaddress;
	private String email;
	private int point;
	private int salecount;
	private int buycount;
	private int declarationcount;
	public Olddealuser() {
		super();
		// TODO Auto-generated constructor stub
	}
	//전체필드
	public Olddealuser(String id, String password, String userdiv, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email, int point,
			int salecount, int buycount, int declarationcount) {
		super();
		this.id = id;
		this.password = password;
		this.userdiv = userdiv;
		this.username = username;
		this.nickname = nickname;
		this.rrn = rrn;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.email = email;
		this.point = point;
		this.salecount = salecount;
		this.buycount = buycount;
		this.declarationcount = declarationcount;
	}
	//회원가입필드
	public Olddealuser(String id, String password, String userdiv, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email) {
		super();
		this.id = id;
		this.password = password;
		this.userdiv = userdiv;
		this.username = username;
		this.nickname = nickname;
		this.rrn = rrn;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.email = email;
	}
	// 회원변경 필드
	public Olddealuser(String id, String password, String nickname, String phonenumber, String zipcode, String address,
			String detailaddress, String email) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.email = email;
	}
	// 모아보기회원조회
	public Olddealuser(String id, String address, String detailaddress) {
		super();
		this.id = id;
		this.address = address;
		this.detailaddress = detailaddress;
	}
	
	// 로그인
	public Olddealuser(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserdiv() {
		return userdiv;
	}
	public void setUserDiv(String userdiv) {
		this.userdiv = userdiv;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getBuycount() {
		return buycount;
	}
	public void setBuycount(int buycount) {
		this.buycount = buycount;
	}
	public int getDeclarationcount() {
		return declarationcount;
	}
	public void setDeclarationcount(int declarationcount) {
		this.declarationcount = declarationcount;
	}
}
