package springweb.a03_ajax;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import springweb.a13_database.A02_EmpDao;
import springweb.a13_database.A06_PareparedDao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.Member;

@RestController
public class A01_RestController {
	// http://localhost:7080/springweb/callRest01.do
	@GetMapping("/callRest01.do")
	public String callRest01() {
		return "hello";
	}
	// http://localhost:7080/springweb/callRest02.do
	@GetMapping("/callRest02.do")
	public String callRest02() {
		return "안녕하세요.";
	}
	// http://localhost:7080/springweb/callRest03.do
	@GetMapping(value="/callRest03.do",
				produces="text/plain;charset=UTF-8")
	public String callRest03() {
		return "안녕하세요.";
	}
	// http://localhost:7080/springweb/callRest04.do
	@GetMapping(value="/callRest04.do",
			produces="text/plain;charset=UTF-8")
	public String callRest04() {
		// {"empno":7780, "ename":"홍길동","sal":4000}
		return "{\"empno\":7780, \"ename\":\"홍길동\",\"sal\":4000 }";
	}
	// http://localhost:7080/springweb/callRest05.do
	@GetMapping(value="/callRest05.do",
			produces="text/plain;charset=UTF-8")
	public String callRest05() {
		Gson g = new Gson();
		return g.toJson(new Dept(10,"인사","서울"));
	}
	// http://localhost:7080/springweb/callRest06.do
	@RequestMapping(value="/callRest06.do",
			produces="text/plain;charset=UTF-8")
	public String callRest06(Emp sch) {
		A02_EmpDao dao = new A02_EmpDao();
		Gson g = new Gson();
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		
		return g.toJson(dao.getEmpSch(sch));
	}
	// http://localhost:7080/springweb/callRest07.do
	@RequestMapping(value="/callRest07.do",
			produces="text/plain;charset=UTF-8")
	public String callRest07(Dept sch) {
		A06_PareparedDao dao = new A06_PareparedDao();
		Gson g = new Gson();
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		
		return g.toJson(dao.getDeptList(sch));
	}
	// http://localhost:7080/springweb/callRest08.do
	@RequestMapping(value="/callRest08.do",
			produces="text/plain;charset=UTF-8")
	public String callRest08() {
		A06_PareparedDao dao = new A06_PareparedDao();
		Gson g = new Gson();
		return g.toJson(dao.getMemberList());
	}
	// http://localhost:7080/springweb/callRest09.do
	@RequestMapping(value="/callRest09.do",
			produces="text/plain;charset=UTF-8")
	public String callRest09(int price, int cnt) {
		Gson g = new Gson();
		return g.toJson(price*cnt);
	}
	// http://localhost:7080/springweb/callRest10.do
	@RequestMapping(value="/callRest10.do",
			produces="text/plain;charset=UTF-8")
	public String callRest10(Member sch) {
		A06_PareparedDao dao = new A06_PareparedDao();
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		Gson g = new Gson();
		return g.toJson(dao.indexMemberList(sch));
	}
	// 0118_4번정답
	@PostMapping(value="/memListAjax.do", produces="text/plain;charset=UTF-8")
	public String memeListAjax(Member sch){
		Gson g = new Gson();
		A06_PareparedDao dao = new A06_PareparedDao();
		return g.toJson(dao.getMemberList(sch));
	}
}
