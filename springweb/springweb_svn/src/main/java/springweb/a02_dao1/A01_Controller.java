package springweb.a02_dao1;
// springweb.a02_dao1.A01_Controller
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
// springweb2.a01_start.A01_Controller
//id a01_Controller ==> 한쪽에 id변경
@Controller("a01_ControllerDpl") // 다른 이름으로  DL을 설정
public class A01_Controller {

	// http://localhost:7080/springweb/start.do
	// 중복 url mapping으로 변경 필요.
	// ==> http://localhost:7080/springweb/start22.do
	@RequestMapping("/start22.do")
	public String start() {
		return "WEB-INF\\views\\a01_start.jsp";
	}
	
}
