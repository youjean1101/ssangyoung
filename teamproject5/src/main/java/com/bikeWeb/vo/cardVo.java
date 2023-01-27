package com.bikeWeb.vo;

import java.util.Date;

public class cardVo {
	private String cardNo;
	private String validity;
	private String cardKind;
	private Date birthDay;
	/**
	 * 
	 */
	public cardVo() {
		super();
	}
	public String getCardNo() {
		return cardNo;
	}
	public String getValidity() {
		return validity;
	}
	public String getCardKind() {
		return cardKind;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public void setCardKind(String cardKind) {
		this.cardKind = cardKind;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	
}
