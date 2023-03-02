package fleaMarket.a01_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.Req1000_Service;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;

@Controller("Req1000")
public class Req1000_Controller {
	private final Req1000_Service service;
	@Autowired
	public Req1000_Controller(Req1000_Service service) {
		this.service = service;
	}

	@Autowired
	private FileService fileservice;
	
	@Value("${profile.upload}")
	private String profilepath;
	
//=================================================================================
	
	@RequestMapping("SignIn.do")
	public String login(HttpSession session) {
		return "SignIn";
	}
	
	@RequestMapping("SignUp.do")
	public String SignUp() {
		return "SignUp";
	}
	
	@RequestMapping("insSignUp.do")
	public String SignUp(Member ins,@RequestParam("profileimg") MultipartFile profile){
			//1. 기본 회원가입 양식
				service.SignUp(ins);
			//2. 파일처리
				ProfileImg fins = new ProfileImg();
				fins.setEmail(ins.getEmail());
				fins.setProfileimg("defaultprofile.png");
				if(profile.getOriginalFilename()!="") {
				  fins.setProfileimg(fileservice.insprofileimg(profilepath,profile));
				}
				service.insprofile(fins);			
			
		return "SignIn";
	}
	
	@RequestMapping("Login.do") //일반로그인
	public String Loign(Member log,Model d,HttpSession session) {
		Member mem;		
		String msg = "일치하는 회원이 없습니다. 다시 시도 부탁드립니다.";
		String path = "redirect:SignIn.do";
		
		// sns이메일값
		if(d.asMap().get("SnsEmailPlus")!=null) {
			mem = service.Login((Member)d.asMap().get("SnsEmailPlus"));
		// 기본이메일/패스워드
		}else {
			mem = service.Login(log);
		}
		if(mem!=null) {
		session.setAttribute("Login", mem);
		msg = "로그인 성공";  path="main";	
		}

		d.addAttribute("LoginMsg",msg);	
		return path;
	}
	
	
	
	//Sns연동처리
	@RequestMapping("SnsEmailPlus.do")//기존계정에 연동계정 업데이트
	public String SnsEmailPlus(Member upt,RedirectAttributes redirectAttributes) {
		service.SnsEmailPlus(upt);
		// 연동처리 후, 해당 이메일값 전달
		redirectAttributes.addFlashAttribute("SnsEmailPlus",upt);
		return "redirect:Login.do";
	}
	
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("Login");
		return "SignIn";
	}
	 
}
