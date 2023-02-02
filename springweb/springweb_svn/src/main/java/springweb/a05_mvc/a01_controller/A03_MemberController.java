package springweb.a05_mvc.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a05_mvc.a02_service.A03_MemberService;
import springweb.z01_vo.Member;

@Controller("memberCtrl")
public class A03_MemberController {
	@Autowired(required = false)
	private A03_MemberService service;

	@ModelAttribute("authCom")
	public List<String> getAuthCom(){
		return service.getAuthCom();
	}
	
	@RequestMapping("/memberListMy.do")
	public String memberList(@ModelAttribute("sch") Member sch,
				Model d) {
		d.addAttribute("mlist",service.getMemberList(sch));
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	}
	// memberMy.do
	@GetMapping("/memberMy.do")
	public String getMember(@RequestParam("id") String id, 
							Model d) {
		// 모달창에 데이터를 로딩
		d.addAttribute("mem", service.getMember(id));
		// 모달창 뒤에 전체 조회된 내용 리스트를 위해 처리.
		d.addAttribute("mlist",service.getMemberList(new Member()));
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	}
	// /memberUpt.do /memberDel.do
	@RequestMapping("/memberUpt")
	public String memberUpt(Member upt, Model d) {
		service.uptMember(upt);
		// 수정된 이후에 데이터를 로딩 처리
		d.addAttribute("mem", service.getMember(upt.getId()));
		d.addAttribute("mlist",service.getMemberList(new Member()));
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	} 
	@RequestMapping("/memberDel")
	public String memberUpt(@RequestParam("id") String id) {
		service.delMember(id);
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	}
	@RequestMapping("/memberIns")
	public String memberIns(Member ins, Model d) {
		service.insMember(ins);
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	}
	@PostMapping("insertMember.do")
	public String insertMember(Member ins, Model d) {
		service.insertMember(ins);
		// 항상 프로그래밍을 조건문/반복문을 처리하기 전에 
		// 코드 순서를 먼저 잘 위치시켜야 한다.
		d.addAttribute("mem", service.getMember(ins.getId()));
		d.addAttribute("mlist", service.getMemberList(new Member()));
		return "WEB-INF\\views\\a05_mvc\\a03_memberList.jsp";
	}

	@GetMapping("/memberJson.do")
	public String memberJson(@RequestParam("id") String id, Model d) {
		d.addAttribute("memberInfo",service.getIdSearchMember(id));
		return "pageJsonReport";
	}
	// /memberMyAjax.do?id=himan
	@GetMapping("/memberMyAjax.do")
	public String memberMyAjax(@RequestParam("id") String id, Model d) {
		d.addAttribute("mem",service.getMember(id));
		return "pageJsonReport";
	}
	
}