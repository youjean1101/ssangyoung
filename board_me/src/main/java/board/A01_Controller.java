package board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.vo.BaseBallTeam;
import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Member;

@Controller
// @SessionAttributes 방법도 있으나 버그가 있음.
public class A01_Controller {
	@Autowired(required=false)
	private A02_Service service;
	// http://localhost:7080/board_me/list.do
	@RequestMapping("/list.do")
	public String boardList(@ModelAttribute("sch") BoardSch sch, Model d) {
		d.addAttribute("list", service.boardList(sch));
		return "a01_boardList";
	}
	@RequestMapping("/insertFrm.do")
	public String insertFrm(){
		return "a02_insertBoard";
	}
	@PostMapping("/insert.do")
	public String insert(Board ins, Model d){
		service.insertBoard(ins);
		d.addAttribute("msg","등록성공");
		return "a02_insertBoard";
	}
	
	@GetMapping("board.do")
	public String getBoard(@RequestParam("no") int no, Model d){
		service.uptReadCnt(no);
		d.addAttribute("board", service.getBoard(no));
		return "a03_board";
	}
	//  download.do?fname=@@@@
	@GetMapping("/download.do")
	public String download(@RequestParam("fname")String fname, Model d) {
		d.addAttribute("downloadFile", fname);
		return "downloadView";
	}
	
	@RequestMapping("/boardUpt.do")
	public String boardUpt(Board upt, Model d) {
		service.updateBoard(upt);
		System.out.println(upt.getFname());
		d.addAttribute("board", service.getBoard(upt.getNo()));
		d.addAttribute("msg2","수정완료");
		return "a03_board";
	}
	@RequestMapping("/delBoard.do")
	public String delBoard(@RequestParam("no")int no, Model d) {
		service.deleteBoard(no);
		d.addAttribute("msg3","삭제완료");
		return "a03_board";
	}
	
	@GetMapping("/loginFrm.do")
	public String loginFrm() {
		return "a04_login";
	}
	
	@RequestMapping("/login.do")
	public String login(Member mem,HttpSession session, Model d) {
		String msg="로그인 실패";
		Member login = service.login(mem);
		if(login!=null) {
			msg="로그인 성공";
			// DB에 데이터가 있을 때, 세션 설정
			session.setAttribute("mem", login);
		}
		d.addAttribute("msg",msg);
		return "a04_login";
	}
	// $("#logOut").click(function(){
	//		if(confirm("로그아웃하시겠습니까?"))
	//			location.href="${path}/logout.do"
	// 로그아웃 시 session 종료
	@GetMapping("/logout.do")
	public String logout(HttpSession session, Model d) {
		if(session.getAttribute("mem")!=null) {
			session.removeAttribute("mem");
		}
		// d.addAttribute("msg", "로그아웃 완료");
		return "a04_login";
	}
	//과제
	@RequestMapping("/baseballList.do")
	public String baseballList(Model d) {
		d.addAttribute("teamlist", service.baseballList());
		return "homework/a01_baseballteamList";
	}
	@GetMapping("/insertTeam.do")
	public String insertTeam(){
		return "homework/a02_insertBaseBall";
	}
	@PostMapping("/insertT.do")
	public String insertT(BaseBallTeam ins, Model d){
		service.insertBaseballTeam(ins);
		d.addAttribute("msg","등록성공");
		return "homework/a02_insertBaseBall";
	}
	
	@GetMapping("baseBallTeam.do")
	public String baseBallTeam(@RequestParam("teamno") int teamno, Model d){
		d.addAttribute("baseballteamDetail", service.BaseballTeamDetail(teamno));
		return "homework/a03_baseballteamDetail";
	}
}
