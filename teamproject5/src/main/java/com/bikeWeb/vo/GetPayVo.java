package com.bikeWeb.vo;

public class GetPayVo {
	private String getPayNo;
	private String cardNo;
	private String validity;
	private String cardKind;
	private String email;
	private String birthDay;
	private String phoneNumber;
	private String rrn;
	private String id;
	public GetPayVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getGetPayNo() {
		return getPayNo;
	}
	public void setGetPayNo(String getPayNo) {
		this.getPayNo = getPayNo;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
