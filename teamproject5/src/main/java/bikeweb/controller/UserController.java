package bikeweb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.MemberVo;

import bikeweb.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	@GetMapping("/main.do")
	public String goMain(Model d, HttpSession session) {
		d.addAttribute("loginId",session.getAttribute("id"));
		System.out.println(session.getAttribute("id"));
		return "a00_main\\a01_main.jsp";
	}
	//http://localhost:7080/teamproject5
	@RequestMapping("/signup.do") //회원가입
	public String signin(MemberVo ins) {
		service.signup(ins);

		return "a00_main\\a02_login.jsp";
	}
	
	@PostMapping("/invalidId.do") // 회원가입시 아이디 중복확인
	public String invalidId(@RequestParam("id") String id, Model d) {
		d.addAttribute("idCk",service.invalidId(id));
		return "pageJsonReport";
	}
	
	@PostMapping("/login.do") // 로그인  해당 아이디의 권한정보 가져오기
	public String login(MemberVo login, Model d, HttpSession session) {
		session.setAttribute("id", login.getId());
		System.out.println(session.getAttribute("id"));
		d.addAttribute("loginCk",service.login(login));
		d.addAttribute("auth",service.getAuth(login.getId()));
		System.out.println(service.getAuth(login.getId()));
		
		return "pageJsonReport";
	}
	
	@GetMapping("/getId.do") // 회원정보 수정시 로그인한 아이디로 된 정보 가져오기
	public String getId(@RequestParam("id") String id, Model d) {
		d.addAttribute("userInfo",service.getId(id));
		return "pageJsonReport";
	}
	
	@PostMapping("/uptInfo.do") // 회원정보 수정
	public String uptInfo(MemberVo upt, Model d) {
		service.uptInfo(upt);
		d.addAttribute("uptInfo",service.getId(upt.getId()));
		return "pageJsonReport";
	}
	
	@PostMapping("/delInfo.do") // 회원탈퇴
	public String delInfo(@RequestParam("id") String id, Model d) {
		service.delInfo(id);
		d.addAttribute("delInfo",service.getId(id));
		return "pageJsonReport";
	}
	@GetMapping("/logout.do")// 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "a00_main\\a01_main.jsp";
	}
	@GetMapping("/myPage.do")// 마이페이지 초기화면(회원정보 수정)
	public String goUadateInfo(Model d, HttpSession session) {
		d.addAttribute("loginId",session.getAttribute("id"));
		return "a00_main\\a04_updateInfo.jsp";
	}
	@GetMapping("/withdrawal.do")// 회원탈퇴 화면
	public String goWirhdrawal(Model d, HttpSession session) {
		d.addAttribute("loginId",session.getAttribute("id"));
		return "a00_main\\a05_withdrawal.jsp";
	}
}
