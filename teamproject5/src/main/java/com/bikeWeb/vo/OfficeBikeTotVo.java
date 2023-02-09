package com.bikeWeb.vo;

import java.util.Date;

public class OfficeBikeTotVo {
	private int bikeNo;
	private Date startDate;
	private int breakDownCnt;
	private String rentalState;
	//보관소 
	private String placeName;
	private String startPlaceName;
	private String endPlaceName;
	private String loc;
	private String locDetail;
	private String phoneNum;
	//최대보관수 
	private int maxStoreCnt;
	// 즐겨찾기  여부 1, 0 
	private int bookMarkWhether;
	public int getBikeNo() {
		return bikeNo;
	}
	public void setBikeNo(int bikeNo) {
		this.bikeNo = bikeNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getBreakDownCnt() {
		return breakDownCnt;
	}
	public void setBreakDownCnt(int breakDownCnt) {
		this.breakDownCnt = breakDownCnt;
	}
	public String getRentalState() {
		return rentalState;
	}
	public void setRentalState(String rentalState) {
		this.rentalState = rentalState;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
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
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
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
