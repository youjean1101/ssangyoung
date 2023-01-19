package springweb.a04_di_last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A01_DiController {
	
	@Autowired
	private A02_DIService service;
	// 컨테이너(dispatcher-servlet.xml)에 있는 
	// A02_DIService객체를 자동 주입
	// new A02_DIService() 필요없음..
	// http://localhost:7080/springweb/diCall01.do
	
	
	@GetMapping("/diCall01.do")
	public String diCall01(Model d) {
		
		System.out.println("## 의존성 주입??"+service.getCheck());
		d.addAttribute("show",service.getCheck());
		return "WEB-INF\\views\\a01_start\\a20_autoWireShow.jsp"; // index.jsp호출
		// <h2>${show}</h2>
	}
	//A03_Controller.java
	// http://localhost:7080/springweb/diCall02.do
	
	//A04_Service.java
	// public String getGreat(){return "안녕하세요(의존)"}
}
