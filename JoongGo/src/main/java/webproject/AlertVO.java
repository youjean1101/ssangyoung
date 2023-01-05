package webproject;

import java.util.Date;

public class AlertVO {
	private String alertno;
	private String id; 
	private String name; 
	private String alertcontent;
	private Date alertdate;
	private String moveurl;
	private int qnano;
	private int productno;
	private String messege;
	
	
	public AlertVO() {
	}
   

	public AlertVO(String alertno,String alertcontent, Date alertdate, String moveurl, int qnano,String messege) {
		this.alertno=alertno;
		this.alertcontent = alertcontent;
		this.alertdate = alertdate;
		this.moveurl = moveurl;
		this.qnano = qnano;
		this.messege=messege;
	}
	

	public AlertVO(String id, String alertcontent, String moveurl, int qnano, int productno) {
		this.id = id;
		this.alertcontent = alertcontent;
		this.moveurl = moveurl;
		this.qnano = qnano;
		this.productno = productno;
	}


	public AlertVO(String alertno, String id, String alertcontent, Date alertdate, String moveurl, int qnano,
			int productno) {
		this.alertno = alertno;
		this.id = id;
		this.alertcontent = alertcontent;
		this.alertdate = alertdate;
		this.moveurl = moveurl;
		this.qnano = qnano;
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
	public Date getAlertdate() {
		return alertdate;
	}
	public void setAlertdate(Date alertdate) {
		this.alertdate = alertdate;
	}
	public String getMoveurl() {
		return moveurl;
	}
	public void setMoveurl(String moveurl) {
		this.moveurl = moveurl;
	}
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getMessege() {
		return messege;
	}


	public void setMessege(String messege) {
		this.messege = messege;
	}
	
	
}
