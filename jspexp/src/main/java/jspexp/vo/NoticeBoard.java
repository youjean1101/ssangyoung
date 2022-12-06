package jspexp.vo;

public class NoticeBoard {
	private String sId;
	private String sDiv;
	private String sTitle;
	private String sContent;
	private String sFileadd;
	public NoticeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeBoard(String sId, String sDiv, String sTitle, String sContent, String sFileadd) {
		super();
		this.sId = sId;
		this.sDiv = sDiv;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sFileadd = sFileadd;
	}
	public NoticeBoard(String sId) {
		super();
		this.sId = sId;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsDiv() {
		return sDiv;
	}
	public void setsDiv(String sDiv) {
		this.sDiv = sDiv;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public String getsFileadd() {
		return sFileadd;
	}
	public void setsFileadd(String sFileadd) {
		this.sFileadd = sFileadd;
	}
	
}
