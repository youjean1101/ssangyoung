package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//springweb.a01_start.A01_Controller
@Controller
public class A01_Controller {
	// http://localhost:7080/springweb/start.do
	//url 주소
	@RequestMapping("/start.do")
	public String start() { //요청값과 model 선언하고
		// 모델 데이터 할당
		
		//view단 호출(forward방식 - 모델 데이터값을 전달과 함께 호출)
		return "\\WEB-INF\\views\\a01_start\\a01_start.jsp";
	}
	// http://localhost:7080/springweb/start2.do
	@RequestMapping("/start2.do")
	public String start2() {
		return "\\WEB-INF\\views\\a01_start\\a02_start.jsp";
	}
}
