package com.bikeWeb.vo;

import java.util.Date;

public class rentalVo {
	private int rentalNo;
	private String memberDiv;
	private String nonMemberName;
	private String nonMemberPhoneNum;
	private int bikeNo;
	private String id;
	// 빌린 지역 
	private String startPlaceName;
	private Date rentalTime;
	// 반납 지역 
	private String EndPlaceName;
	private Date returnDate;
	private int useDistance;
	private int unpaidCharge;
	private int PayNo;
	/**
	 * 
	 */
	public rentalVo() {
		super();
	}
	public int getRentalNo() {
		return rentalNo;
	}
	public String getMemberDiv() {
		return memberDiv;
	}
	public String getNonMemberName() {
		return nonMemberName;
	}
	public String getNonMemberPhoneNum() {
		return nonMemberPhoneNum;
	}
	public int getBikeNo() {
		return bikeNo;
	}
	public String getId() {
		return id;
	}
	public String getStartPlaceName() {
		return startPlaceName;
	}
	public Date getRentalTime() {
		return rentalTime;
	}
	public String getEndPlaceName() {
		return EndPlaceName;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public int getUseDistance() {
		return useDistance;
	}
	public int getUnpaidCharge() {
		return unpaidCharge;
	}
	public int getPayNo() {
		return PayNo;
	}
	public void setRentalNo(int rentalNo) {
		this.rentalNo = rentalNo;
	}
	public void setMemberDiv(String memberDiv) {
		this.memberDiv = memberDiv;
	}
	public void setNonMemberName(String nonMemberName) {
		this.nonMemberName = nonMemberName;
	}
	public void setNonMemberPhoneNum(String nonMemberPhoneNum) {
		this.nonMemberPhoneNum = nonMemberPhoneNum;
	}
	public void setBikeNo(int bikeNo) {
		this.bikeNo = bikeNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStartPlaceName(String startPlaceName) {
		this.startPlaceName = startPlaceName;
	}
	public void setRentalTime(Date rentalTime) {
		this.rentalTime = rentalTime;
	}
	public void setEndPlaceName(String endPlaceName) {
		EndPlaceName = endPlaceName;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public void setUseDistance(int useDistance) {
		this.useDistance = useDistance;
	}
	public void setUnpaidCharge(int unpaidCharge) {
		this.unpaidCharge = unpaidCharge;
	}
	public void setPayNo(int payNo) {
		PayNo = payNo;
	}
	
	
}
