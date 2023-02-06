package board.vo;
//board.vo.BaseBallTeam
public class BaseBallTeam {
	private int teamno;
	private String teamname;
	private int ranking;
	private String hometown;
	private String player;
	public int getTeamno() {
		return teamno;
	}
	public void setTeamno(int teamno) {
		this.teamno = teamno;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
}
