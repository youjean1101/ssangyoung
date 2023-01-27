package a01_diexp.z9_homework.vo;
//a01_diexp.z9_homework.vo.BaseBallTeam
public class BaseBallTeam {
	// BaseBallTeam를(팀명, 승,무,패)
	private String teamName;
	private String result;
	public BaseBallTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BaseBallTeam(String teamName, String result) {
		super();
		this.teamName = teamName;
		this.result = result;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
