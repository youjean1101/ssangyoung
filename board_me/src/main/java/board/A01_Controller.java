package board;

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

@Controller
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
