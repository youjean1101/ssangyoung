package vo;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	private int pageNum;
	private int amount;
	
	private String type;	//검색
	private String keyword;
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
	
}
    
