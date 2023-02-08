package board.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
//board.vo.BoardFile
public class BoardFile {
	// no, fname , etc, regdte, uptdte
	private int no;
	private String fname;
	private String etc;
	private Date regdte;
	private Date uptdte;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
}
