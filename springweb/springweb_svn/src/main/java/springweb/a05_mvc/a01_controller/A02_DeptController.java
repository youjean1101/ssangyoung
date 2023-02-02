package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/deptAjaxInit.do")
	public String deptAjaxInit() {
		return "WEB-INF\\views\\a05_mvc\\a04_ajaxList.jsp";
	}
	// Get/Post ==> RequestMapping(둘다 가능)
	@PostMapping("/deptAjax.do")
	public String deptAjaxInitData(Dept sch, Model d) {
		d.addAttribute("dlist",service.getDeptList(sch));
		return "pageJsonReport";
	}

	@GetMapping("/getDept.do")
	public String getDept(@RequestParam("deptno") int deptno, Model d) {
		d.addAttribute("dept",service.getDept(deptno));
		return "pageJsonReport";
	}
	
	@GetMapping("/deptAjaxHW.do")
	public String deptAjaxHW() {
		return "WEB-INF\\views\\a05_mvc\\a04_ajaxList_0131_HW.jsp";
	}
	
	@GetMapping("/uptDept.do")
	public String uptDept(Dept upt, Model d) {
		service.uptDept(upt);
		d.addAttribute("dept",service.getDept(upt.getDeptno()));
		d.addAttribute("dlist",service.getDeptList(new Dept()));
		return "pageJsonReport";
	}
	@GetMapping("/delDept.do")
	public String delDept(@RequestParam("deptno") int deptno) {
		service.delDept(deptno);
		return "pageJsonReport";
	}
	//정답
	@GetMapping("/updateDept.do")
	public String updateDept(Dept upt, Model d) {
		service.uptDept(upt);
		d.addAttribute("dept",service.getDept(upt.getDeptno()));
		d.addAttribute("dlist",service.getDeptList(new Dept()));
		return "pageJsonReport";
	}
	
	@GetMapping("/deleteDept.do")
	public String deleteDept(@RequestParam("deptno") int deptno) {
		service.delDept(deptno);
		return "pageJsonReport";
	}
	
	
}
