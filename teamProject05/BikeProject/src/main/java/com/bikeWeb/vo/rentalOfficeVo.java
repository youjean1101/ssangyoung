package com.bikeWeb.vo;

public class rentalOfficeVo {
	private String startPlaceName;
	private String endPlaceName;
	private String loc;
	private String locDetail;
	private String phoneNum;
	//최대보관수 
	private int maxStoreCnt;
	// 즐겨찾기  여부 1, 0 
	private int bookMarkWhether;
	/**
	 * 
	 */
	public rentalOfficeVo() {
		super();
	}
	public String getStartPlaceName() {
		return startPlaceName;
	}
	public String getEndPlaceName() {
		return endPlaceName;
	}
	public String getLoc() {
		return loc;
	}
	public String getLocDetail() {
		return locDetail;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public int getMaxStoreCnt() {
		return maxStoreCnt;
	}
	public int getBookMarkWhether() {
		return bookMarkWhether;
	}
	public void setStartPlaceName(String startPlaceName) {
		this.startPlaceName = startPlaceName;
	}
	public void setEndPlaceName(String endPlaceName) {
		this.endPlaceName = endPlaceName;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public void setLocDetail(String locDetail) {
		this.locDetail = locDetail;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setMaxStoreCnt(int maxStoreCnt) {
		this.maxStoreCnt = maxStoreCnt;
	}
	public void setBookMarkWhether(int bookMarkWhether) {
		this.bookMarkWhether = bookMarkWhether;
	}
	
}
