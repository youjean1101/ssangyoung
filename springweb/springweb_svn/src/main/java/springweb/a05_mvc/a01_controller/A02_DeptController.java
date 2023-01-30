package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A02_DeptService;
import springweb.z01_vo.Dept;

@Controller("mydeptCtrl")
public class A02_DeptController {

	@Autowired(required = false)
	private A02_DeptService service;
	
	@RequestMapping("myDeptList.do")
	public String myDeptList(@ModelAttribute("sch") Dept sch, Model d) {
		d.addAttribute("dlist", service.getDeptList(sch));
		return "WEB-INF\\views\\a05_mvc\\a02_deptList.jsp";
	}
}
