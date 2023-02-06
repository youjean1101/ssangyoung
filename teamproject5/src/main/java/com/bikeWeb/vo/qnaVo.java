package com.bikeWeb.vo;

import java.util.Date;

public class QnaVo {
	private String qno;
	private Date writedate;
	private String id;
	private String title;
	private String content;
	private String imgfile;
	// 관리자아이디 
	private String mgrid;
	private String answer;
	//관리자 질문 
	private String oftenqno;
	private String div;
	private String question;
	/**
	 * 
	 */
	public QnaVo() {
		super();
	}
	public String getQno() {
		return qno;
	}
	public void setQno(String qno) {
		this.qno = qno;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	public String getMgrid() {
		return mgrid;
	}
	public void setMgrid(String mgrid) {
		this.mgrid = mgrid;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getOftenqno() {
		return oftenqno;
	}
	public void setOftenqno(String oftenqno) {
		this.oftenqno = oftenqno;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
}