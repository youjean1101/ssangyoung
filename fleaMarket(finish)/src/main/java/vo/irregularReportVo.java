package vo;

//신고하기 vo 
public class irregularReportVo {
	private int irrNo;
	private int communityNumber;
	private String category;
	private String email;
	private int nickname;
	private int irrType;
	private String regDate;
	private String title;
	private int spam;
	private int cuss;
	private int politics;
	private int info;
	private int total;
	
	public int getIrrNo() {
		return irrNo;
	}
	public int getCommunityNumber() {
		return communityNumber;
	}
	public String getEmail() {
		return email;
	}
	public int getIrrType() {
		return irrType;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setIrrNo(int irrNo) {
		this.irrNo = irrNo;
	}
	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setIrrType(int irrType) {
		this.irrType = irrType;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public int getSpam() {
		return spam;
	}
	public int getCuss() {
		return cuss;
	}
	public int getPolitics() {
		return politics;
	}
	public int getInfo() {
		return info;
	}
	public int getTotal() {
		return total;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setSpam(int spam) {
		this.spam = spam;
	}
	public void setCuss(int cuss) {
		this.cuss = cuss;
	}
	public void setPolitics(int politics) {
		this.politics = politics;
	}
	public void setInfo(int info) {
		this.info = info;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNickname() {
		return nickname;
	}
	public void setNickname(int nickname) {
		this.nickname = nickname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
}
