package com.bikeWeb.vo;

import java.util.Date;
// com.bikeWeb.vo.PayRentalTotVo
public class PayRentalTotVo {
	private int payNo;
	private String ticketKind;
	private int useTime;
	private int payMoney;
	private String payMethod;
	private String teleCom;
	private String PhoneNum;
	private String rrnfront;
	private String CardNo;
	private String validity;
	private String cardKind;
	private String email;
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
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public String getTicketKind() {
		return ticketKind;
	}
	public void setTicketKind(String ticketKind) {
		this.ticketKind = ticketKind;
	}
	public int getUseTime() {
		return useTime;
	}
	public void setUseTime(int useTime) {
		this.useTime = useTime;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getTeleCom() {
		return teleCom;
	}
	public void setTeleCom(String teleCom) {
		this.teleCom = teleCom;
	}
	public String getPhoneNum() {
		return PhoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		PhoneNum = phoneNum;
	}
	public String getRrnfront() {
		return rrnfront;
	}
	public void setRrnfront(String rrnfront) {
		this.rrnfront = rrnfront;
	}
	public String getCardNo() {
		return CardNo;
	}
	public void setCardNo(String cardNo) {
		CardNo = cardNo;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public String getCardKind() {
		return cardKind;
	}
	public void setCardKind(String cardKind) {
		this.cardKind = cardKind;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRentalNo() {
		return rentalNo;
	}
	public void setRentalNo(int rentalNo) {
		this.rentalNo = rentalNo;
	}
	public String getMemberDiv() {
		return memberDiv;
	}
	public void setMemberDiv(String memberDiv) {
		this.memberDiv = memberDiv;
	}
	public String getNonMemberName() {
		return nonMemberName;
	}
	public void setNonMemberName(String nonMemberName) {
		this.nonMemberName = nonMemberName;
	}
	public String getNonMemberPhoneNum() {
		return nonMemberPhoneNum;
	}
	public void setNonMemberPhoneNum(String nonMemberPhoneNum) {
		this.nonMemberPhoneNum = nonMemberPhoneNum;
	}
	public int getBikeNo() {
		return bikeNo;
	}
	public void setBikeNo(int bikeNo) {
		this.bikeNo = bikeNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartPlaceName() {
		return startPlaceName;
	}
	public void setStartPlaceName(String startPlaceName) {
		this.startPlaceName = startPlaceName;
	}
	public Date getRentalTime() {
		return rentalTime;
	}
	public void setRentalTime(Date rentalTime) {
		this.rentalTime = rentalTime;
	}
	public String getEndPlaceName() {
		return EndPlaceName;
	}
	public void setEndPlaceName(String endPlaceName) {
		EndPlaceName = endPlaceName;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public int getUseDistance() {
		return useDistance;
	}
	public void setUseDistance(int useDistance) {
		this.useDistance = useDistance;
	}
	public int getUnpaidCharge() {
		return unpaidCharge;
	}
	public void setUnpaidCharge(int unpaidCharge) {
		this.unpaidCharge = unpaidCharge;
	}
}
