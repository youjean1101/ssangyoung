package z02_teamproject4.vo;
//z02_teamproject4.vo.Social
public class Social {
	private String id;
	private String typediv;
	private String otherid;
	
	public Social() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Social(String id, String typediv, String otherid) {
		super();
		this.id = id;
		this.typediv = typediv;
		this.otherid = otherid;
	}

	public Social(String id, String typediv) {
		super();
		this.id = id;
		this.typediv = typediv;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTypediv() {
		return typediv;
	}

	public void setTypediv(String typediv) {
		this.typediv = typediv;
	}

	public String getOtherid() {
		return otherid;
	}

	public void setOtherid(String otherid) {
		this.otherid = otherid;
	}
	
}
