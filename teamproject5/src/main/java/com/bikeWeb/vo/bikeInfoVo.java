package com.bikeWeb.vo;

import java.util.Date;

public class bikeInfoVo {
	private int bikeNo;
	private Date startDate;
	private int breakDownCnt;
	private String rentalState;
	//보관소 
	private String placeName;
	/**
	 * 
	 */
	public bikeInfoVo() {
		super();
	}
	public int getBikeNo() {
		return bikeNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public int getBreakDownCnt() {
		return breakDownCnt;
	}
	public String getRentalState() {
		return rentalState;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setBikeNo(int bikeNo) {
		this.bikeNo = bikeNo;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setBreakDownCnt(int breakDownCnt) {
		this.breakDownCnt = breakDownCnt;
	}
	public void setRentalState(String rentalState) {
		this.rentalState = rentalState;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	
	
}
