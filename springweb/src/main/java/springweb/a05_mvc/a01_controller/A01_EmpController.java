package springweb.a05_mvc.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a05_mvc.a02_service.A01_EmpService;
import springweb.z01_vo.Code;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;

@Controller("empCtrl")
public class A01_EmpController {
	@Autowired
	private A01_EmpService service;
	// deptCom, mgrCom jobCom
	@ModelAttribute("deptCom")
	public List<Dept> getDeptComb(){
		return service.getDeptComb();
	}
	@ModelAttribute("mgrCom")
	public List<Code> getMgrComb(){
		return service.getMgrComb();
	}
	@ModelAttribute("jobCom")
	public List<String> getJobComb(){
		return service.getJobComb();
	}		
	
	@RequestMapping("empListMy.do")
	public String empList(@ModelAttribute("sch")Emp sch,Model d) {
		System.out.println("부서번호:"+sch.getDeptno());
		System.out.println("관리자번호:"+sch.getMgr());
		System.out.println("직책명:"+sch.getJob());
		d.addAttribute("empList", service.getEmpList(sch));
		return "\\WEB-INF\\views\\a05_mvc\\a01_empList.jsp";
	}
}
