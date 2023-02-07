package springweb.z01_vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// springweb.z01_vo.FileRep
//no, title, path, tmpFile, fname, etc, regdte, uptdte
public class FileRep {
	private int no;
	private String title;
	private String path;
	private String tmpfile;
	private String fname;
	private String etc;
	private Date regdte;
	private Date uptdte;
	private MultipartFile report;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTmpfile() {
		return tmpfile;
	}
	public void setTmpfile(String tmpfile) {
		this.tmpfile = tmpfile;
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
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
}
