package vo;

public class guestBookVo {
	private int guestBookid;
	private String guestemail;
	private String email;
	private String nickname;
	private String profileimg;
	private String message;
	private String registDate;
	private String updateDate;
	
	public int getGuestBookid() {
		return guestBookid;
	}
	public String getGuestemail() {
		return guestemail;
	}
	public String getEmail() {
		return email;
	}
	public String getMessage() {
		return message;
	}
	public String getRegistDate() {
		return registDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setGuestBookid(int guestBookid) {
		this.guestBookid = guestBookid;
	}
	public void setGuestemail(String guestemail) {
		this.guestemail = guestemail;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getNickname() {
		return nickname;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	
	
}
