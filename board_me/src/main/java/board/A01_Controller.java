package board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.vo.BoardSch;

@Controller
public class A01_Controller {
	@Autowired(required=false)
	private A02_Service service;
	
	@RequestMapping("/list.do")
	public String boardList(@ModelAttribute("sch") BoardSch sch, Model d) {
		d.addAttribute("list", service.boardList(sch));
		return "a01_boardList";
	}
}
