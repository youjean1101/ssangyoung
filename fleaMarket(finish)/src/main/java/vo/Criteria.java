package vo;


public class Criteria {
	private int communityNumber;
	private String email;
	private int pageNum;
	private int amount;
	private String type;	//검색
	private String keyword;
	private String shift; //정렬 
	private String category;

	public Criteria(){
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCommunityNumber() {
		return communityNumber;
	}

	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	
		
}
    
