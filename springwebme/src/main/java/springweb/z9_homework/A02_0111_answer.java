package springweb.z9_homework;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A06_PareparedDao;
import springweb.z01_vo.Count;
import springweb.z01_vo.Member;
import springweb.z01_vo.Player;
// springweb.z9_homework.A02_0111_answer
@Controller
public class A02_0111_answer {
	private A06_PareparedDao dao;
	public A02_0111_answer() {
		dao = new A06_PareparedDao();
	}
	//1) 카운트 클릭시, 모델단에서 증가되게 하여 증가된 카운트 버튼을 출력되게 하세요 [카운트: @@] 
	// http://localhost:7080/springweb/countA.do
	@GetMapping("/countA.do")
	public String countA(Count cntOb) {
		return "WEB-INF\\\\z9_homework\\\\0111\\\\a06_records.jsp";
	}
	@PostMapping("/countA.do")
	public String countA2(Count cntOb) {
		cntOb.setStartNum(cntOb.getStartNum()+1);
		return "WEB-INF\\\\z9_homework\\\\0111\\\\a06_records.jsp";
	}
	// 2) 선수이름, 타석과 안타를 입력시, 선수명과 타율(모델에서 계산)이 출력되게 하세요.
	/*
	 		1) 요청값 VO Player name, hseat, hit, hitRatio
	 		2) 모델데이터 처리
	 			if(p.getName()!=null){
	 				p.setHitRatio(hit/(double)hseat);
	 			}
	 		3) 뷰단
	 			name="name" value="${player.name}"
	 			name="hseat" value="${player.hseat}"
	 			name="hit" value="${player.hit}"
	 			타율 : ${player.hitRatio}
	 */
	// http://localhost:7080/springweb/baseBallPlayer.do
	@RequestMapping("/baseBallPlayer.do")
	public String records(Player p) {
		// 초기화면 구분
		if(p.getName()!=null){
				p.setHitRatio(p.getHit()/(double)p.getHseat());
		}
		return "WEB-INF\\z9_homework\\0111\\a06_records.jsp";
	}
	
	
	//[1단계:확인] 6. 로그인 화면에서 로그인 되었을 때는 회원리스트 화면, 그렇지 않을 때는 로그인 화면으로 가게 처리하세요.
	/*
	 1. DB연동 모듈 확인 dao : //A06_PareparedDao login(Member m) 
	 2. controller, Member
	 3. if(member.getXXXX()!=null){
	 		return ""; // 회원리스트로 redirect 처리
	 	}else{
	 		d.addAttribute("msg", "로그인을 다시하세요.")
	 		return ""; // 로그인화면
	 	}
	 */
	// http://localhost:7080/springweb/mlist.do
	// 회원리스트 화면
	@RequestMapping("/mlist.do")
	public String login(Member m) {
		return "WEB-INF\\z9_homework\\0111\\a08_mList.jsp";
	}
	
	// http://localhost:7080/springweb/loginA.do
	@RequestMapping("/loginA.do")
	public String login(Member m, Model d) {
		String page = "redirect:/mlist.do"; //로그인 성공시 회원리스트 화면
		if(dao.login(m)==null) {
			d.addAttribute("msg","로그인 다시 하세요!");
			page = "WEB-INF\\z9_homework\\0111\\a07_login.jsp"; //로그인 성공 시 회원리스트 화면
		} 		
		return page;
	}
}
