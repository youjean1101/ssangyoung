package springweb.z9_homework;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.z01_vo.Gimbab;
import springweb.z01_vo.Member;
import springweb.z01_vo.SoccerTeam;

//springweb.z9_homework.A01_0110_ex3
@Controller
public class A01_0110 {
	//------------------ex4_3)------------------------------------
			// http://localhost:7080/springweb/gimbab.do
			@RequestMapping("/gimbab.do")
			public String gimbab(Gimbab g,Model d) {
				int price = g.getPrice();
				int cnt = g.getCnt();
				int cnttot =1;
				cnttot += cnt;
				d.addAttribute("tot",price*cnt);
				d.addAttribute("cnt",cnttot);
				return "WEB-INF\\z9_homework\\0110\\gimbab.jsp";
			}
	//------------------ex4_2)------------------------------------
		// http://localhost:7080/springweb/memberInsert.do
		@RequestMapping("/memberInsert.do")
		public String memberInsert(Member m) {
			return "WEB-INF\\z9_homework\\0110\\memberInsert.jsp";
		}
		
	//------------------ex4_1)------------------------------------
	// http://localhost:7080/springweb/soccerteam.do
	@RequestMapping("/soccerteam.do")
	public String soccerteam(SoccerTeam team) {
		return "WEB-INF\\z9_homework\\0110\\soccerTeamInsert.jsp";
	}
	//------------------ex3_4)------------------------------------
		// http://localhost:7080/springweb/rps.do
		@GetMapping("/rps.do")
		public String rps01() {
			return "WEB-INF\\z9_homework\\0110\\rps.jsp";
		}
		double num = Math.random();
		int rndNum = (int)(num * 2);
		
		@PostMapping("/rps.do")
		public String rps02(	
								@RequestParam("me") String me,
								Model d
							) {
		d.addAttribute("computer",rndNum==0?"가위":rndNum==1?"바위":"보");
		d.addAttribute("result",rndNum==0&&me.equals("바위")?"승":rndNum==1&&me.equals("보")?"승":rndNum==2&&me.equals("가위")?"승":
								rndNum==0&&me.equals("가위")?"무":rndNum==1&&me.equals("바위")?"무":rndNum==2&&me.equals("보")?"무":"패");
			
			return "WEB-INF\\z9_homework\\0110\\rps.jsp";
		}
	//------------------ex3_3)------------------------------------
	// http://localhost:7080/springweb/gugudan.do
	@GetMapping("/gugudan.do")
	public String gugudan01() {
		return "WEB-INF\\z9_homework\\0110\\gugudan.jsp";
	}
	
	@PostMapping("/gugudan.do")
	public String gugudan02(	
							@RequestParam("num01") int num01,
							@RequestParam("num02") int num02,
							@RequestParam("inanswer") int inanswer,
							Model d
						) {
		d.addAttribute("isAnswer",(num01*num02)==inanswer?"정답":"오답");
		d.addAttribute("answer",num01*num02);
		
		return "WEB-INF\\z9_homework\\0110\\gugudan.jsp";
	}
	//------------------ex3_2)------------------------------------
	// http://localhost:7080/springweb/login.do
	@GetMapping("/login.do")
	public String login01() {
		return "WEB-INF\\z9_homework\\0110\\idpasswd.jsp";
	}
	
	@PostMapping("/login.do")
	public String login02(	
							@RequestParam("id") String id,
							@RequestParam("password") String password,
							Model d
						) {
		d.addAttribute("loginSucc",id.equals("himan")&&password.equals("7777")?"로그인성공":"로그인실패");
		
		return "WEB-INF\\z9_homework\\0110\\idpasswd.jsp";
	}
	//------------------ex3_1)------------------------------------
	@GetMapping("/point.do")
	public String point01() {
		return "WEB-INF\\z9_homework\\0110\\point.jsp";
	}
	
	@PostMapping("/point.do")
	public String point02(	@RequestParam("point") int point,
							Model d
						) {
		d.addAttribute("grade",point>95?"A":point>90?"B":point>77?"C":point>60?"D":point>40?"E":"F");
		
		return "WEB-INF\\z9_homework\\0110\\point.jsp";
	}
}

