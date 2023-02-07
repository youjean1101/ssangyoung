package springweb.z01_vo;

import org.springframework.web.multipart.MultipartFile;
// springweb.z01_vo.FileExpVo
public class FileExpVo {
	private String content;
	private String path;
	private MultipartFile report;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
}
