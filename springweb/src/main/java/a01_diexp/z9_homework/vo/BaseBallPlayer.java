package a01_diexp.z9_homework.vo;

import java.util.Map;
import java.util.Properties;

// a01_diexp.z9_homework.vo.BaseBallPlayer
public class BaseBallPlayer {
	//BaseBallPlayer(이름, 팀명, 타율)
	private String name;
	private BaseBallTeam teamName;
	private String batAvg;
	
	private Properties playerInfo; 
	private Map<String, String> bat;
	
	public BaseBallPlayer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BaseBallPlayer(String name, String batAvg) {
		super();
		this.name = name;
		this.batAvg = batAvg;
	}
	public void teamInfo() {
		System.out.println(name+"의 소속팀 정보(2022시즌)");
		if(teamName!=null) {
			System.out.println(teamName.getTeamName()+"팀이");
			System.out.println(teamName.getResult()+" 하였습니다.");
		}else {
			System.out.println("소속팀이 없습니다.");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BaseBallTeam getTeamName() {
		return teamName;
	}
	public void setTeamName(BaseBallTeam teamName) {
		this.teamName = teamName;
	}
	public String getBatAvg() {
		return batAvg;
	}
	public void setBatAvg(String batAvg) {
		this.batAvg = batAvg;
	}
	
	public Map<String, String> getBat() {
		return bat;
	}
	public void setBat(Map<String, String> bat) {
		this.bat = bat;
	}
	public Properties getPlayerInfo() {
		return playerInfo;
	}
	public void setPlayerInfo(Properties playerInfo) {
		this.playerInfo = playerInfo;
	}
}
