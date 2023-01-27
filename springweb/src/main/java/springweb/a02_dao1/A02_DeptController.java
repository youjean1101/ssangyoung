package springweb.a02_dao1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A02_EmpDao;
import springweb.a13_database.A06_PreparedDao;
import springweb.z01_vo.Dept;
// springweb.a02_dao1.A02_DeptController
@Controller
public class A02_DeptController {
	private A06_PreparedDao dao;
	public A02_DeptController() {
		dao = new A06_PreparedDao();
	}
	
	// ex) http://localhost:7080/springweb/deptList.do
	@RequestMapping("/deptList.do")
	public String deptList(Dept sch, Model d) {
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		d.addAttribute("dlist", dao.getDeptList(sch));
		return "WEB-INF\\views\\a02_dao01\\a02_deptList.jsp";
	}	
	// insertDept.do
	@RequestMapping("/insertDept.do")
	public String deptInsert(Dept ins, Model d) {
		dao.insertDept(ins);
		//d.addAttribute("msg", "등록완료!");
		// 선언된 controller 1) redirect 2) forward
		return "redirect:/deptList.do";
	}
	
}
