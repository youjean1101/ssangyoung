package springweb.a03_ajax;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import springweb.a13_database.A02_EmpDao;
import springweb.a13_database.A06_PreparedDao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.Member;
import springweb.z01_vo.Product;

@RestController
public class A01_RestController {
	// http://localhost:7080/springweb/callRest01.do
	@GetMapping("/callRest01.do")
	public String callRest01() {
		return "hello";
	}
	@GetMapping("/callRest02.do")
	public String callRest02() {
		return "안녕하세요";
	}
	@GetMapping(value="/callRest03.do",
				produces="text/plain;charset=UTF-8")
	public String callRest03() {
		return "안녕하세요";
	}
	@GetMapping(value="/callRest04.do",
			produces="text/plain;charset=UTF-8")
	public String callRest04() {
		// {"empno":7780, "ename":"홍길동", "sal":4000}
		return "{\"empno\":7780, \"ename\":\"홍길동\", \"sal\":4000}";
	}	
	
	@GetMapping(value="/callRest05.do",
			produces="text/plain;charset=UTF-8")
	public String callRest05() {
		Gson g = new Gson();
		return g.toJson(new Dept(10,"인사","서울"));
	}		
	
	@RequestMapping(value="/callRest06.do",
			produces="text/plain;charset=UTF-8")
	public String callRest06(Emp sch) {
		A02_EmpDao dao = new A02_EmpDao();
		Gson g = new Gson();
		if(sch.getEname()==null)sch.setEname("");
		if(sch.getJob()==null)sch.setJob("");
		if(sch.getToSal()==0)sch.setToSal(9999);
		return g.toJson(dao.getEmpSch(sch));
	}
	// http://localhost:7080/springweb/callRest07.do
	@RequestMapping(value="/callRest07.do",
			produces="text/plain;charset=UTF-8")
	public String callRest07(Dept sch) {
		A06_PreparedDao dao = new A06_PreparedDao();
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		Gson g = new Gson();
		return g.toJson(dao.getDeptList(sch));
	}	
	@PostMapping("buyProd99.do") // produces="text/plain;charset=utf=8"
	public String buyProd99(Product p){
		// 총계값 전달
		return ""+p.getPrice()*p.getCnt();
	}
	@PostMapping(value="/memListAjax.do", 
			produces="text/plain;charset=utf-8")
	public String  memListAjax(Member sch){
		Gson g = new Gson();
		A06_PreparedDao dao = new A06_PreparedDao();
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		return g.toJson(dao.getMemberList(sch));
	}	
}
