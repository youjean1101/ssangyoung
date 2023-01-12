package springweb.a02_dao1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a13_database.A06_PareparedDao;
import springweb.z01_vo.Dept;
//springweb.a02_dao1.A02_DeptController
@Controller
public class A02_DeptController {
	private A06_PareparedDao dao;
	public A02_DeptController() {
		dao = new A06_PareparedDao();
	}
	// ex) http://localhost:7080/springweb/deptList.do
		// 부서정보 검색
		// 1. 초기 화면 호출
		//		- 요청 처리 VO선언
		// 2. 모델데이터 dao설정
		//		- dname, loc null 초기화
		//		- dao. 
		// --------------------------------------
		// 3. 모델데이터 화면 출력(view단 처리)
		@RequestMapping("/deptList.do")
		public String deptList(Dept sch, Model d){
			if(sch.getDname()==null) sch.setDname("");
			if(sch.getLoc()==null) sch.setLoc("");
			d.addAttribute("dlist", dao.getDeptList(sch));
			return "WEB-INF\\a02_dao01\\a02_deptList.jsp";
		}
		//insertDept.do
		@RequestMapping("/insertDept.do")
		public String deptInsert(Dept ins, Model d) {
			dao.insertDept(ins);
			// d.addAttribute("msg", "등록완료!"); => redirect라 안됌
			// 선언된 controller 1) redirect 2) forward
			return "redirect:/deptList.do";
		}
}
