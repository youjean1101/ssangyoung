package com.bikeWeb.vo;

import java.util.Date;

public class AlertVo {
	private int alertNo;
	private String id;
	private Date alertDate;
	//1 또는 0만 들어가도록 제약사항 걸거임 
	private int receptionState;
	private String alertDiv;
	/**
	 * 
	 */
	public AlertVo() {
		super();
	}
	public int getAlertNo() {
		return alertNo;
	}
	public String getId() {
		return id;
	}
	public Date getAlertDate() {
		return alertDate;
	}
	public int getReceptionState() {
		return receptionState;
	}
	public String getAlertDiv() {
		return alertDiv;
	}
	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setAlertDate(Date alertDate) {
		this.alertDate = alertDate;
	}
	public void setReceptionState(int receptionState) {
		this.receptionState = receptionState;
	}
	public void setAlertDiv(String alertDiv) {
		this.alertDiv = alertDiv;
	}
	
}
