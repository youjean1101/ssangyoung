package springweb.a05_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A07_ChattingController {
	
	@RequestMapping("chatting.do")
	public String chatting() {
		// a07_chattingForm.jsp
		return "WEB-INF\\views\\a05_mvc\\a07_chattingForm.jsp";
	}
}
