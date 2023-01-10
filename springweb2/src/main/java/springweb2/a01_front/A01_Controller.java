package springweb2.a01_front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// springweb2.a01_front.A01_Controller
@Controller
public class A01_Controller {
	// http://localhost:6080/springweb2/homework.do
	@RequestMapping("/homework.do")
	public String homework() {
		return "\\WEB-INF\\viewhomework\\a01_test\\homework.jsp";
	}
}
