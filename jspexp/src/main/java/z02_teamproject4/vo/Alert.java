package z02_teamproject4.vo;

public class Alert {
	private String alertno;
	private String id;
	private String alertcontent;
	private String alertdate;
	private String moveurl;
	private String qno;
	private int productno;
	public Alert() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Alert(String alertno, String id, String alertcontent, String alertdate, String moveurl, String qno,
			int productno) {
		super();
		this.alertno = alertno;
		this.id = id;
		this.alertcontent = alertcontent;
		this.alertdate = alertdate;
		this.moveurl = moveurl;
		this.qno = qno;
		this.productno = productno;
	}
	public String getAlertno() {
		return alertno;
	}
	public void setAlertno(String alertno) {
		this.alertno = alertno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAlertcontent() {
		return alertcontent;
	}
	public void setAlertcontent(String alertcontent) {
		this.alertcontent = alertcontent;
	}
	public String getAlertdate() {
		return alertdate;
	}
	public void setAlertdate(String alertdate) {
		this.alertdate = alertdate;
	}
	public String getMoveurl() {
		return moveurl;
	}
	public void setMoveurl(String moveurl) {
		this.moveurl = moveurl;
	}
	public String getQno() {
		return qno;
	}
	public void setQno(String qno) {
		this.qno = qno;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	
}
