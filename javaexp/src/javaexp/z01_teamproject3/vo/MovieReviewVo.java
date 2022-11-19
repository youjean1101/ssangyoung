package javaexp.z01_teamproject3.vo;

public class MovieReviewVo {
	 private String sReviewCode;
	 private String sUserCode;
	 private String sStarratting;
	 private String sGoodandBadDiv;
	 private String sMovieCode;
	 
	public MovieReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieReviewVo(String sReviewCode, String sUserCode, String sStarratting, String sGoodandBadDiv,
			String sMovieCode) {
		super();
		this.sReviewCode = sReviewCode;
		this.sUserCode = sUserCode;
		this.sStarratting = sStarratting;
		this.sGoodandBadDiv = sGoodandBadDiv;
		this.sMovieCode = sMovieCode;
	}
	public String getsReviewCode() {
		return sReviewCode;
	}
	public void setsReviewCode(String sReviewCode) {
		this.sReviewCode = sReviewCode;
	}
	public String getsUserCode() {
		return sUserCode;
	}
	public void setsUserCode(String sUserCode) {
		this.sUserCode = sUserCode;
	}
	public String getsStarratting() {
		return sStarratting;
	}
	public void setsStarratting(String sStarratting) {
		this.sStarratting = sStarratting;
	}
	public String getsGoodandBadDiv() {
		return sGoodandBadDiv;
	}
	public void setsGoodandBadDiv(String sGoodandBadDiv) {
		this.sGoodandBadDiv = sGoodandBadDiv;
	}
	public String getsMovieCode() {
		return sMovieCode;
	}
	public void setsMovieCode(String sMovieCode) {
		this.sMovieCode = sMovieCode;
	}	 
}
