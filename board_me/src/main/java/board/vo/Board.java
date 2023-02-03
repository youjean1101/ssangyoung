package board.vo;

import java.util.Date;

/*no 글번호
refno 답글번호
subject 제목
content 내용
writer 작성자
readcnt 조회수
regdte 등록일
updte 수정일*/
public class Board {
	private int no;
	private int refno;
	private String subject;
	private String content;
	private String writer;
	private String readcnt;
	private Date regdte;
	private Date updte;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUpdte() {
		return updte;
	}
	public void setUpdte(Date updte) {
		this.updte = updte;
	}
}
