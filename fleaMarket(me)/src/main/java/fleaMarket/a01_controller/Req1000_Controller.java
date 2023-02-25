package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.Req1000_Service;

@Controller("Req1000")
public class Req1000_Controller {
	private final Req1000_Service service;
	@Autowired
	public Req1000_Controller(Req1000_Service service) {
		this.service = service;
	}
	
	@GetMapping("login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("SignUp.do")
	public String SignUp() {
		return "SignUp";
	}
	
	@PostMapping("DuplicateEmail.do") //이메일 중복검사
	public String DuplicateEmail(@RequestParam("email") String email,Model d) {
		System.out.println(email);
		d.addAttribute("DuplicateEmail",service.DuplicateEmail(email));
		return "pageJsonReport";
	}
	@PostMapping("DuplicateMem.do") //이름,주민 중복검사
	public String DuplicateMem(@RequestParam("name") String name
							   ,@RequestParam("personalnumber") String personalnumber
							   ,Model d) {	
		d.addAttribute("DuplicateMem",service.DuplicateMem(name,personalnumber));
		return "pageJsonReport";
	}
}
