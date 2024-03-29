package com.bikeWeb.vo;
// com.bikeWeb.vo.RentalOfficeVo
public class RentalOfficeVo {
	private String startPlaceName;
	private String endPlaceName;
	private String placename;
	
	private String loc;
	private String locDetail;
	private String phonenumber;
	//최대보관수 
	private int maxStoreCnt;
	// 즐겨찾기  여부 1, 0 
	private int bookMarkWhether;
	/**
	placename varchar(500) PRIMARY key,
	loc varchar(1000),
	locdetail varchar(2000),
	phonenumber varchar(13),
	maxstorcnt NUMBER
	 */
	public String getStartPlaceName() {
		return startPlaceName;
	}
	public void setStartPlaceName(String startPlaceName) {
		this.startPlaceName = startPlaceName;
	}
	public String getEndPlaceName() {
		return endPlaceName;
	}
	public void setEndPlaceName(String endPlaceName) {
		this.endPlaceName = endPlaceName;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getLocDetail() {
		return locDetail;
	}
	public void setLocDetail(String locDetail) {
		this.locDetail = locDetail;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getMaxStoreCnt() {
		return maxStoreCnt;
	}
	public void setMaxStoreCnt(int maxStoreCnt) {
		this.maxStoreCnt = maxStoreCnt;
	}
	public int getBookMarkWhether() {
		return bookMarkWhether;
	}
	public void setBookMarkWhether(int bookMarkWhether) {
		this.bookMarkWhether = bookMarkWhether;
	}
}
