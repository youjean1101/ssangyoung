package springweb.a02_dao1;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A02_EmpDao;
import springweb.z01_vo.Code;
import springweb.z01_vo.Emp;
// springweb.a02_dao1.A01_EmpController
@Controller
public class A01_EmpController {
	private A02_EmpDao dao;
	public A01_EmpController() {
		dao = new A02_EmpDao();
	}
	// controller에서 공통적인 데이터 처리가 필요한 부분
	@ModelAttribute("mgrCode")
	public List<Code> getMgrInf(){
		return dao.getMgrInf();
	}	
	@ModelAttribute("deptCode")
	public List<Code> getDeptInf(){
		return dao.getDeptInf();
	}	
	// getSalGradeInf
	@ModelAttribute("salGradeCode")
	public List<Code> getSalGradeInf(){
		return dao.getSalGradeInf();
	}
	
	// http://localhost:7080/springweb/empList.do
	// ModelAttribute("요청값의 모델명지정)
	@RequestMapping("/empList.do")
	public String empList(@ModelAttribute("sch") Emp sch, Model d) {
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		d.addAttribute("empList", dao.getEmpSch(sch));
		return "WEB-INF\\views\\a02_dao01\\a01_empList.jsp";
	}
	// 사원정보 등록처리
	// 1. 등록화면 구성
	// 2. 컨트롤러 선언
	@RequestMapping("/insertEmp.do")
	public String inserEmp(Emp ins, Model d) {
		dao.insertEmp(ins);
		d.addAttribute("msg", "등록완료");
		return "redirect:/empList.do";
	}
	
	
	
}
