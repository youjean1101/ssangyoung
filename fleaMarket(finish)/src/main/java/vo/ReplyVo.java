package vo;

public class ReplyVo {
	private int replyNo;
	private int communityNumber;
	private String email;
	private String repcontent;
	private int repclass;
	private int groupOrderid;
	private int groupid;
	private String repDate;
	private String repUpdateDate;
	//기본 이미지, 닉네임 받아오기
	private String nickname;
	private String profileimg;
	private int isDeleted;
	
	
	
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getRepUpdateDate() {
		return repUpdateDate;
	}
	public void setRepUpdateDate(String repUpdateDate) {
		this.repUpdateDate = repUpdateDate;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public int getCommunityNumber() {
		return communityNumber;
	}
	public String getEmail() {
		return email;
	}
	public String getRepcontent() {
		return repcontent;
	}
	public int getRepclass() {
		return repclass;
	}
	public int getGroupOrderid() {
		return groupOrderid;
	}
	public int getGroupid() {
		return groupid;
	}
	public String getRepDate() {
		return repDate;
	}
	public String getNickname() {
		return nickname;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRepcontent(String repcontent) {
		this.repcontent = repcontent;
	}
	public void setRepclass(int repclass) {
		this.repclass = repclass;
	}
	public void setGroupOrderid(int groupOrderid) {
		this.groupOrderid = groupOrderid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	
	
}
