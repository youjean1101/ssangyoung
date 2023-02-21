package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a05_mvc.a02_service.A20_CalendarService;
import springweb.z01_vo.Calendar;

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
	@RequestMapping("cal2Ajax.do")
	public String cal2Ajax(Model d) {
		d.addAttribute("callist2", service.calList2());
		return "pageJsonReport";
	}
	@RequestMapping("insCalendar.do")
	public String insCalendar(Calendar ins,Model d) {
		service.insertCalendar(ins);
		d.addAttribute("msg", "일정등록성공");
		return "pageJsonReport";
	}
	@RequestMapping("uptCalendar.do")
	public String uptCalendar(Calendar upt,Model d) {
		service.uptCalendar(upt);
		d.addAttribute("msg", "일정수정성공");
		return "pageJsonReport";
	}
	@RequestMapping("delCalendar.do")
	public String delCalendar(@RequestParam("id")int id,Model d) {
		service.delCalendar(id);
		d.addAttribute("msg", "일정삭제성공");
		return "pageJsonReport";
	}
	
}
