package a01_diexp.z9_homework.vo;

public class BaseBallPlayer {
	//BaseBallPlayer(이름, 팀명, 타율)
	private String name;
	private String teamName;
	private String batAvg;
	public BaseBallPlayer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BaseBallPlayer(String name, String teamName, String batAvg) {
		super();
		this.name = name;
		this.teamName = teamName;
		this.batAvg = batAvg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getBatAvg() {
		return batAvg;
	}
	public void setBatAvg(String batAvg) {
		this.batAvg = batAvg;
	}
}
