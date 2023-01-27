package springweb.z9_homework;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A06_PareparedDao;
import springweb.z01_vo.Baseball;
import springweb.z01_vo.Count;
import springweb.z01_vo.Member;

// springweb.z9_homework.a02_0111
@Controller
public class a02_0111 {
	private A06_PareparedDao dao;
	public a02_0111(){
		dao = new A06_PareparedDao();
	}
	
	// 1) 카운트 클릭시, 모델단에서 증가되게 하여 증가된 카운트 버튼을 출력되게 하세요
    // [카운트: @@] 
	// http://localhost:7080/springweb/count.do
	@RequestMapping("/count.do")
	public String count(Count cou) {
			
		cou.setStartNum(cou.getStartNum()+cou.getStep());
		return "WEB-INF\\z9_homework\\0111\\countView.jsp";
	}
	// 2) 선수이름, 타석과 안타를 입력시, 선수명과 타율(모델에서 계산)이 출력되게 하세요.
	// http://localhost:7080/springweb/baseball.do
	@RequestMapping("/baseball.do")
	public String baseball(Baseball player) {
		player.setBatAvg(player.getBat()*player.getSafety());
		return "WEB-INF\\z9_homework\\0111\\baseball.jsp";
	}
	// DAO에 있는 회원리스트 화면을 구현하세요.
	// http://localhost:7080/springweb/memberList.do
	@RequestMapping("/memberList.do")
	public String memberList(Member sch, Model d) {
		d.addAttribute("memberList", dao.getMemberList(sch));
		return "WEB-INF\\z9_homework\\0111\\memberList.jsp";
	}
	@RequestMapping("/memberInsert100.do")
	public String memberInsert(Member ins) {
		dao.insertMember(ins);
		return "redirect:/memberList.do";
	}
	//http://localhost:7080/springweb/login99.do
	@RequestMapping("/login99.do")
	public String login(Member sch) {
		boolean islogin = dao.login(sch)!=null;
		if(islogin) {
			return "redirect:/memberList.do";
		}else {
			return "WEB-INF\\z9_homework\\0111\\login.jsp";
		}
	}
}
