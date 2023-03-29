package vo;


public class CapplicationList {
	private int communitynumber;
	private String title;
	private String content;
	private String registDate;
	private String updateDate;
	private String category;
	private String email;
	private String hashtag;
	private int viewCnt;
	private int likeCnt;
	private int repCnt;
	private int prevNum;
	private int nextNum;
	
	//받는 이미지 
	private String imgName;
	
	private String nickname;
	private String bestType;
	private String profileimg;
	//구분자 이미지 
	private String img;
	
	
	public int getCommunitynumber() {
		return communitynumber;
	}
	public void setCommunitynumber(int communitynumber) {
		this.communitynumber=communitynumber;
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
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getImgName() {
		return imgName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBestType() {
		return bestType;
	}
	public void setBestType(String bestType) {
		this.bestType = bestType;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public int getRepCnt() {
		return repCnt;
	}
	public void setRepCnt(int repCnt) {
		this.repCnt = repCnt;
	}
	
	
	
	
}
