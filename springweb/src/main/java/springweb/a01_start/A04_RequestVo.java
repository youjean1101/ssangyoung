package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Person;

// springweb.a01_start.A04_RequestVo
@Controller
public class A04_RequestVo {
	// http://localhost:7080/springweb/person.do
	//   ?name=홍길동&age=&loc=서울(X)
	@RequestMapping("/person.do")
	public String callPerson(Person p) {
		// 요청값이 없더라도 해당 메서드가 호출되고,
		// type에 맞게 호출하면 해당 요청값을 Person객체에 할당된다.
		System.out.println("#요청값#");
		System.out.println("이름:"+p.getName());
		System.out.println("나이:"+p.getAge());
		System.out.println("사는곳:"+p.getLoc());
		return "WEB-INF\\views\\a01_start\\a14_insertPerson.jsp";
	}
	// http://localhost:7080/springweb/deptIns.do
	// 부서번호, 부서명, 부서위치를 등록화면을 구현하세요.
	// 요청값을 통한 모델(모델attribute), 모델명은 객체의 소문자형태가 defualt
	// Dept ==> dept, Emp ==> emp
	@RequestMapping("/deptIns.do")
	public String deptIns(Dept ins, Model d) {
		System.out.println("부서 정보 등록 내용");
		System.out.println("부서번호:"+ins.getDeptno());
		System.out.println("부서명:"+ins.getDname());
		System.out.println("부서위치:"+ins.getLoc());
		
		return "WEB-INF\\views\\a01_start\\a15_insertDept.jsp";
	}
	
	
}
