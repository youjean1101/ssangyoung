package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//springweb.a01_start.springweb.a01_start

@Controller
public class A02_ReqExpController {

	// http://localhost:7080/springweb/call01.do?name=홍길동
	@RequestMapping("/call01.do")
	public String call01(@RequestParam("name") String name) {
		System.out.println("###이름:"+name);
		return "";
	}
	
	// http://localhost:7080/springweb/call02.do?age=28
	@RequestMapping("/call02.do")
	public String call02(@RequestParam("age") int age) {
		System.out.println("###나이::"+age);
		return "";
	}
	
	// http://localhost:7080/springweb/call03.do?name=홍길동&age=28&loc=서울
	@RequestMapping("/call03.do")
	public String call03(@RequestParam("name") String name,
						 @RequestParam("age") int age,
						 @RequestParam("loc") String loc) {
		System.out.println("###이름:"+name);
		System.out.println("###나이:"+age);
		System.out.println("###사는곳:"+loc);
		return "";
	}
	// http://localhost:7080/springweb/call04.do?num01=30&num02=40
	// 로그창에 30 + 40 = 70 출력
	@RequestMapping("/call04.do")
	public String call04(@RequestParam("num01") int num01,
						 @RequestParam("num02") int num02 ) {
			System.out.println(num01+" + "+num02+" = "+(num01+num02));
			return "";
	}
}
