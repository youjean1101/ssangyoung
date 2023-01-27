package springweb.a03_ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A02_Controller {
	// http://localhost:7080/springweb/empForAjax.do
	@GetMapping("/empForAjax.do")
	public String empForAjax() {
		return "a01_jquery\\a17_ajax.html";
	}
	// view 단 : $("h2").text("jquery Ajax")
	// a01_jquery\a18_ajax.html
	// http://localhost:7080/springweb/deptForAjax.do
	@GetMapping("/deptForAjax.do")
	public String deptForAjax() {
		return "a01_jquery\\a18_ajax.html";
	}	
	// http://localhost:7080/springweb/buyProd99.do
	@GetMapping("buyProd99.do")
	public String buyProd99(){
		return "z10_homework\\0118.jsp";
	}	
	// http://localhost:7080/springweb/memListAjax.do
	@GetMapping("/memListAjax.do")
	public String memListAjax(){
		return "z10_homework\\0118.jsp";
	}	
}
