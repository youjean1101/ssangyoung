package boardexp.vo;

import java.util.Date;

//boardexp.vo.Boardexp
public class Boardexp {
	private int bno;
	private String title;
	private String writer;
	private int rcnt;
	private Date credte;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public Date getCredte() {
		return credte;
	}
	public void setCredte(Date credte) {
		this.credte = credte;
	}
}
