package a01_diexp.z9_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z9_homework.vo.BaseBallPlayer;
import a01_diexp.z9_homework.vo.BaseBallTeam;

public class DIHomeWork0113 {
	
	public static void main(String[] args) {
		String path = "a01_diexp\\z9_homework\\di0113.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Object obj = ctx.getBean("obj", Object.class);
		//4. property를 활용해서 가상 컨테이너안에서 BaseBallPlayer(이름, 팀명, 타율)를 선언하세요
//		BaseBallPlayer player01 = ctx.getBean("player01",BaseBallPlayer.class);
//		System.out.println(player01.getTeamName()+"팀의 "+player01.getName()+"선수의 타율은 "+player01.getBatAvg());
		
		//5. constructor를 활용해서 가상 컨테이너안에서 BaseBallTeam를(팀명, 승,무,패) 선언하세요
//		BaseBallTeam team01 = ctx.getBean("teaminfo01",BaseBallTeam.class);
//		System.out.println("2022시즌은 "+team01.getTeamName()+" 팀이 "+team01.getResult()+" 하였습니다.");
		
		
		//6. BaseBallPlayer에 소속 팀 객체를 선언하여 1:1로 할당하고, 해당 선수와 소속팀 정보를 출력 메서드를 선언하세요.
		BaseBallPlayer player02 = ctx.getBean("player02",BaseBallPlayer.class);
		player02.teamInfo();
		System.out.println("컨테이너의 객체호출:"+obj);
		System.out.println("종료");
		ctx.close();
	}
}
