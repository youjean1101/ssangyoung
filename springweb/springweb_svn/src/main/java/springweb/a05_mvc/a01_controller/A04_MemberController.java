package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A04_MemberService;
import springweb.z01_vo.Member;

@Controller("memberCtrl")
public class A04_MemberController {
	@Autowired
	private A04_MemberService service;
	// http://localhost:7080/memberListMy.do
	@RequestMapping("memberListMy.do")
	public String memberList(@ModelAttribute("sch")Member sch,Model d) {
		d.addAttribute("memberList",service.getMemberList(sch));
		return "\\WEB-INF\\views\\a05_mvc\\a04_MemberList.jsp";
	}
}
