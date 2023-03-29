package vo;
// vo.RoomMemberInfo
public class RoomMemberInfo {
	// 커뮤니티 테이블
	private String communitynumber;
	private String title;
	private String content;
	private String registdate;
	private String updatedate;
	private String category;
	private String email;
	private String hashtag;
	private int viewcnt;
	private String registDateMonth;
	
	//커뮤니티 게시글 이미지
	private String imgname;
	private String imgpath;
	private String[] fileNameList; 
	
	//커뮤니티 회원정보
	private String password;
	private String nickname;
	private String personalnumber;
	private String phonenumber;
	private String address;
	private String authority;
	private String businessnumber;
	private String kakaoemail;
	private String naveremail;
	private String name;
	private String profileimg;
	
	// 커뮤니티 댓글
	private int replyno; // 댓글번호
	private String repcontent;	// 댓글 내용
	private String repclass;	// 댓글 부모 0 자식 1 
	private String grouporderid;	// groupOrderid NUMBER, -- 순서 NUMBER
	private String groupid;	// 그룹 나누기.(모 댓글과 대댓글은 같은값)
	private String repdate;	// 댓글 쓴 날짜
	
	public String getCommunitynumber() {
		return communitynumber;
	}
	public void setCommunitynumber(String communitynumber) {
		this.communitynumber = communitynumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getRegistDateMonth() {
		return registDateMonth;
	}
	public void setRegistDateMonth(String registDateMonth) {
		this.registDateMonth = registDateMonth;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPersonalnumber() {
		return personalnumber;
	}
	public void setPersonalnumber(String personalnumber) {
		this.personalnumber = personalnumber;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getBusinessnumber() {
		return businessnumber;
	}
	public void setBusinessnumber(String businessnumber) {
		this.businessnumber = businessnumber;
	}
	public String getKakaoemail() {
		return kakaoemail;
	}
	public void setKakaoemail(String kakaoemail) {
		this.kakaoemail = kakaoemail;
	}
	public String getNaveremail() {
		return naveremail;
	}
	public void setNaveremail(String naveremail) {
		this.naveremail = naveremail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getImgname() {
		if(this.imgname==null) {
			return "";
		}else {
			return imgname;
		}
	}
	
	public String[] getFileNameList() {
		if(this.imgname==null) {
			this.imgname="";
		}
		return this.imgname.split("&SEP&");
	}
	public void setFileNameList(String[] fileNameList) {
		this.fileNameList = fileNameList;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getRepcontent() {
		return repcontent;
	}
	public void setRepcontent(String repcontent) {
		this.repcontent = repcontent;
	}
	public String getRepclass() {
		return repclass;
	}
	public void setRepclass(String repclass) {
		this.repclass = repclass;
	}
	public String getGrouporderid() {
		return grouporderid;
	}
	public void setGrouporderid(String grouporderid) {
		this.grouporderid = grouporderid;
	}
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	public String getRepdate() {
		return repdate;
	}
	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}
}
