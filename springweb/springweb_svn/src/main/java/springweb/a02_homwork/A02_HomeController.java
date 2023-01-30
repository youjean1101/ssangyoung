package springweb.a02_homwork;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A06_PreparedDao;
import springweb.z01_vo.Counter;
import springweb.z01_vo.Member;
import springweb.z01_vo.Player;
@Controller
public class A02_HomeController {
	private A06_PreparedDao dao;
	public A02_HomeController() {
		dao = new A06_PreparedDao();
	}

//* 1) 카운트 클릭시, 모델단에서 증가되게 하여 증가된 카운트 버튼을 출력되게 하세요
//[카운트: @@]
/*
1. 요청값 cnt => VO : Counter cnt
2. controller 로직 처리
	if(cntOb.getCnt()!=0){
		cntOb.setCnt(cntOb.getCnt()+1);
	}
 3. 화면단
   	<input type="hidden" name="cnt" value="${counter.cnt}"/>
    <button class="btn btn-info" type="submit">현재 : ${counter.cnt} 다음카운트업</button>
10:05~
*/	
	// http://localhost:7080/springweb/count.do
	@GetMapping("/count.do")
	public String count(Counter cntOb) {
		return "WEB-INF\\views\\z01_homwork\\a05_countUP.jsp";
	}
	@PostMapping("/count.do")
	public String count1(Counter cntOb) {
		cntOb.setCnt(cntOb.getCnt()+1);		
		return "WEB-INF\\views\\z01_homwork\\a05_countUP.jsp";
	}
//* 2) 선수이름, 타석과 안타를 입력시, 선수명과 타율(모델에서 계산)이 출력되게 하세요.
/*		1) 요청값 VO Player name, hseat, hit, hitRatio
 		2) 모델데이터 처리
 			if(p.getName()!=null){
 				p.setHitRatio(hit/(double)hseat);
 			}
 		3) 뷰단
 			name="name" value="${player.name}"
 			name="hseat" value="${player.hseat}"
 			name="hit" value="${player.hit}"
 			타율 : ${player.hitRatio}
		
 * */	
	// http://localhost:7080/springweb/baseBallPlayer.do
	@RequestMapping("/baseBallPlayer.do")
	public String records(Player p) {
		// 초기화면 구분
		if(p.getName()!=null){
 			p.setHitRatio(p.getHit()/(double)p.getHseat());
 		}		
		return "WEB-INF\\views\\z01_homwork\\a06_records.jsp";
	}
	//[1단계:확인]*6. 로그인 화면에서 로그인 되었을 때는 회원리스트 화면, 
	//	그렇지 않을 때는 로그인 화면으로 가게 처리하세요
	/*
	1. DB연동 모듈 확인 dao : // A06_PreparedDao login(Member m)
	2. controller, Member
	3. if(dao.getXXXX(m)!=null){
	   		return ""; // 회원리스트로 redirect 처리
	   }else{
	        d.addAttribute("msg","로그인 다시하세요");
	   		return ""; // 로그인 화면
	   }
	 * */
	
	// http://localhost:7080/springweb/mlist.do  
	// 회원리스트 화면
	@RequestMapping("/mlist.do")
	public String login(Member m) {
		return "WEB-INF\\views\\z01_homwork\\a08_mList.jsp";
	}
	// http://localhost:7080/springweb/login.do
	@RequestMapping("/login.do")
	public String login(Member m, Model d) {
		String page = "redirect:/mlist.do"; // 로그인 성공시 회원리스트 화면
		if(m.getId()==null) {
			page = "WEB-INF\\views\\z01_homwork\\a07_login.jsp";
		}else if( dao.login(m)==null) {
			d.addAttribute("msg","로그인 다시 하세요!");
			page = "WEB-INF\\views\\z01_homwork\\a07_login.jsp";
		}
		return page;
	}
	@Autowired
	private A03_HomeService service;
	@GetMapping("/deptDI01.do")
	public String dept(Model d) {
		d.addAttribute("dept",service.getDeptInfo());
		return "z10_homework\\0118.jsp";
	}
	
	
}





