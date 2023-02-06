package com.bikeWeb.vo;

public class MemberVo {
	private String id;
	private String pass;
	private String rentPass;
	private String auth;
	private String name;
	private String phoneNumber;
	private String email;
	private int weight;
	private int totalDistance;
	private String getCardNo;
	/**
	 * 
	 */
	public MemberVo() {
		super();
	}
	public String getId() {
		return id;
	}
	public String getPass() {
		return pass;
	}
	public String getRentPass() {
		return rentPass;
	}
	public String getAuth() {
		return auth;
	}
	public String getName() {
		return name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public int getWeight() {
		return weight;
	}
	public int getTotalDistance() {
		return totalDistance;
	}
	public String getGetCardNo() {
		return getCardNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setRentPass(String rentPass) {
		this.rentPass = rentPass;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public void setTotalDistance(int totalDistance) {
		this.totalDistance = totalDistance;
	}
	public void setGetCardNo(String getCardNo) {
		this.getCardNo = getCardNo;
	}
	
	
}
