package jspexp.vo;
// jspexp.vo.Player
public class Player {
	private String teamName;
	private String player;
	private double score;
	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Player(String teamName, String player, double score) {
		super();
		this.teamName = teamName;
		this.player = player;
		this.score = score;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
}
