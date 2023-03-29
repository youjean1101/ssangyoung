package vo;
// vo.BoardImg
public class BoardImg {
	private String imgname;
	private String imgpath;
	private int communitynumber; // 외래키(커뮤니티 번호)
	
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getCommunitynumber() {
		return communitynumber;
	}
	public void setCommunitynumber(int communitynumber) {
		this.communitynumber = communitynumber;
	}
}
