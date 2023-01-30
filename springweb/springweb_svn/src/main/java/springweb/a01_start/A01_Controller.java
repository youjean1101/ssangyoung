package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
// springweb2.a01_start.A01_Controller
// id a01_Controller
@Controller
public class A01_Controller {

	// http://localhost:7080/springweb/start.do
	@RequestMapping("/start.do")
	public String start() {
		return "WEB-INF\\views\\a01_start.jsp";
	}
	
}
