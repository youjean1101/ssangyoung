package boardexp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import boardexp.vo.Boardexp_seq;

@Controller
public class A01_Controller {
	
	@Autowired(required = false)
	private A02_Service service;
	
	@RequestMapping("/listexp.do")
	public String boardexpList(@ModelAttribute("bno") Boardexp_seq bno,Model d) {
		d.addAttribute("boardList", service.boardexpList(bno));
		return "a01_boardexpList";
	}
}
