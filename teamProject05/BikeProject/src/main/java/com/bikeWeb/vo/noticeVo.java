package com.bikeWeb.vo;

import java.util.Date;

public class noticeVo {
	private int noticeNum;
	private String id;
	private Date date;
	private String title;
	private String content;
	private String file;
	/**
	 * 
	 */
	public noticeVo() {
		super();
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public String getId() {
		return id;
	}
	public Date getDate() {
		return date;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getFile() {
		return file;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
}
