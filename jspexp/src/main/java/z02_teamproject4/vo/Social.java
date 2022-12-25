package z02_teamproject4.vo;

public class Social {
	private String sId;
	private String sTypediv;
	private String sOtherid;
	
	public Social() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Social(String sId, String sTypediv, String sOtherid) {
		super();
		this.sId = sId;
		this.sTypediv = sTypediv;
		this.sOtherid = sOtherid;
	}

	public Social(String sId, String sTypediv) {
		super();
		this.sId = sId;
		this.sTypediv = sTypediv;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsTypediv() {
		return sTypediv;
	}

	public void setsTypediv(String sTypediv) {
		this.sTypediv = sTypediv;
	}

	public String getsOtherid() {
		return sOtherid;
	}

	public void setsOtherid(String sOtherid) {
		this.sOtherid = sOtherid;
	}
}
