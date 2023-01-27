package springweb.a02_dao1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//springweb.a01_start.A01_Controller
// id a01_Controller == > 한쪽에 id 변경
@Controller("a01_ControllerDpl") // 다른이름으로 DL을 설정
public class A01_Controller {
	// http://localhost:7080/springweb/start.do
	// 중복 url mapping으로 변경 필요
	// ==> http://localhost:7080/springweb/start22.do
	//url 주소
	@RequestMapping("/start22.do") // 다른이름으로 DL을 설정
	public String start() { //요청값과 model 선언하고
		// 모델 데이터 할당
		
		//view단 호출(forward방식 - 모델 데이터값을 전달과 함께 호출)
		return "\\WEB-INF\\views\\a01_start\\a01_start.jsp";
	}
}
