package javaexp.z01_teamproject3.vo;

public class MovieVo {
	private String sMovieCode;
	private String sTitle;
	private String sDirector;
	private String sActor;
	private String sGenre;
	private String sStartdate;
	private String sEnddate;
	private String sState;
	private String sReserCnt;
	public MovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieVo(String sMovieCode, String sTitle, String sDirector, String sActor, String sGenre, String sStartdate,
			String sEnddate, String sState, String sReserCnt) {
		super();
		this.sMovieCode = sMovieCode;
		this.sTitle = sTitle;
		this.sDirector = sDirector;
		this.sActor = sActor;
		this.sGenre = sGenre;
		this.sStartdate = sStartdate;
		this.sEnddate = sEnddate;
		this.sState = sState;
		this.sReserCnt = sReserCnt;
	}
	
	public MovieVo(String sTitle, String sDirector, String sActor, String sGenre, String sStartdate, String sEnddate) {
		super();
		this.sTitle = sTitle;
		this.sDirector = sDirector;
		this.sActor = sActor;
		this.sGenre = sGenre;
		this.sStartdate = sStartdate;
		this.sEnddate = sEnddate;
	}
	
	public MovieVo(String sMovieCode) {
		super();
		this.sMovieCode = sMovieCode;
	}
	public String getsMovieCode() {
		return sMovieCode;
	}
	public void setsMovieCode(String sMovieCode) {
		this.sMovieCode = sMovieCode;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDirector() {
		return sDirector;
	}
	public void setsDirector(String sDirector) {
		this.sDirector = sDirector;
	}
	public String getsActor() {
		return sActor;
	}
	public void setsActor(String sActor) {
		this.sActor = sActor;
	}
	public String getsGenre() {
		return sGenre;
	}
	public void setsGenre(String sGenre) {
		this.sGenre = sGenre;
	}
	public String getsStartdate() {
		return sStartdate;
	}
	public void setsStartdate(String sStartdate) {
		this.sStartdate = sStartdate;
	}
	public String getsEnddate() {
		return sEnddate;
	}
	public void setsEnddate(String sEnddate) {
		this.sEnddate = sEnddate;
	}
	public String getsState() {
		return sState;
	}
	public void setsState(String sState) {
		this.sState = sState;
	}
	public String getsReserCnt() {
		return sReserCnt;
	}
	public void setsReserCnt(String sReserCnt) {
		this.sReserCnt = sReserCnt;
	}	
}
