package springweb.z01_vo;

public class SoccerTeam {
	private String teamname;
	private String result;
	private int goal;
	public SoccerTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SoccerTeam(String teamname, String result, int goal) {
		super();
		this.teamname = teamname;
		this.result = result;
		this.goal = goal;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
}
