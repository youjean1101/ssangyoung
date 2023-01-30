package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A03_SalgradeService;
import springweb.z01_vo.Salgrade;

@Controller("SalgradeCtrl")
public class A03_SalgradeController {
	@Autowired
	private A03_SalgradeService service;
	// http://localhost:7080/salgradeMy.do
	@RequestMapping("salgradeMy.do")
	public String salgradeList(@ModelAttribute("sch")Salgrade sch,Model d) {
		System.out.println("등급: "+sch.getGrade());
		System.out.println("급여: "+sch.getLosal()+"~"+sch.getHisal());
		d.addAttribute("salgradeList", service.getSalgradeList(sch));
		return "\\WEB-INF\\views\\a05_mvc\\a03_Salgrade.jsp";
	}
}
