package vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageDTO{
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;

	public PageDTO(Criteria criteria, int total) {
		this.cri = criteria;
		this.total = total;
		this.endPage = (int) (Math.ceil(criteria.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil((total * 1.0) / criteria.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public String makeSearch(Integer pageNum) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("pageNum",pageNum)
				.queryParam("amount",10)
				.queryParam("type",cri.getType())
				.queryParam("type",cri.getKeyword())
				.build();
		return uriComponents.toUriString();
	}
	
	
    

}
