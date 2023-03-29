package vo;

public class FFile {
	private String postingNumber;
	private String filename;
	private String filePath;
	
	public FFile() {
		// TODO Auto-generated constructor stub
	}
	//등록시
	public FFile(String filename, String filePath) {
		this.filename = filename;
		this.filePath = filePath;
	}
	//수정시
	public FFile(String filename, String filePath,String postingNumber) {
		this.postingNumber = postingNumber;
		this.filename = filename;
		this.filePath = filePath;
	}

	
	public String getPostingNumber() {
		return postingNumber;
	}

	public void setPostingNumber(String postingNumber) {
		this.postingNumber = postingNumber;
	}

	public String getFilename() {
		return filename;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
