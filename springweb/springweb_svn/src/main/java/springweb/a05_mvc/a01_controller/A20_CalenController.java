package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A20_CalendarService;

@Controller
public class A20_CalenController {
	@Autowired
	A20_CalendarService service;
	
	@GetMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a05_mvc\\a20_fullcalendar.html";
	}
	// WEB-INF\views\a05_mvc\a21_fullcalendar.jsp
	@GetMapping("calendar2.do")
	public String calendar2() {
		return "WEB-INF\\views\\a05_mvc\\a21_fullcalendar.jsp";
	}
	@RequestMapping("calendarAjax.do")
	public String calendarAjax(Model d) {
		d.addAttribute("callist", service.calList());
		return "pageJsonReport";
	}
}
