package com.bikeWeb.vo;

import java.util.Date;

public class qnaVo {
	private int qno;
	private Date writeDate;
	private String id;
	private String title;
	private String file;
	private String Content;
	// 관리자아이디 
	private String manager;
	private String answer;
	//관리자 질문 
	private String oftenqno;
	private String div;
	private String question;
	/**
	 * 
	 */
	public qnaVo() {
		super();
	}
	public int getQno() {
		return qno;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getFile() {
		return file;
	}
	public String getContent() {
		return Content;
	}
	public String getManager() {
		return manager;
	}
	public String getAnswer() {
		return answer;
	}
	public String getOftenqno() {
		return oftenqno;
	}
	public String getDiv() {
		return div;
	}
	public String getQuestion() {
		return question;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public void setContent(String content) {
		Content = content;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public void setOftenqno(String oftenqno) {
		this.oftenqno = oftenqno;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
}
