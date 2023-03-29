package fleaMarket.a01_controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.CommunitySelectService;
import vo.Criteria;
import vo.Member;
import vo.PageDTO;
import vo.guestBookVo;


@Controller
public class GuestBook_Controller {
	private CommunitySelectService service;
	// 커뮤니티 조회 컨트롤러 
	private final Logger logger = LoggerFactory.getLogger(CommunitySelectController.class);
	@Autowired
	public GuestBook_Controller(CommunitySelectService service) {	
		this.service = service;
	}
	//게스트 메세지 보기 
	@GetMapping("guestMessageList.do")
	public String guestMessageList(HttpSession session,Criteria cri,Model d) {
		List<guestBookVo> list = service.guestBookList(cri);
		Optional<Member> member = Optional.ofNullable((Member)session.getAttribute("Login"));

		
		if(member.isPresent()) {
			 String sessions = member.get().getEmail();
			 d.addAttribute("session", sessions);
		}
		d.addAttribute("booklist",list);
		d.addAttribute("pageMaker",new PageDTO(cri,service.getGuestBookNum(cri)));
		return "communityGuestBook";
	}
	@PostMapping("insertGuestBook.do")
	public String insertGuestBook(guestBookVo vo,Model d,HttpServletRequest request,RedirectAttributes rttr) {
		int result = service.insertGuestBook(vo);
		String msg = "";
		if(result==1) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		rttr.addFlashAttribute(msg);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	@PostMapping("updateGuestBook.do")
	public String updateGuestBook(guestBookVo vo,Model d,HttpServletRequest request,RedirectAttributes rttr) {
		int result = service.updateGuestBook(vo);
		String msg = "";
		if(result==1) {
			msg = "업데이트성공";
		}else {
			msg = "업데이트실패";
		}
		rttr.addFlashAttribute(msg);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
		
	}
	@PostMapping("deleteGuestBook.do")
	public String deleteGuestBook(@RequestParam int guestBookid,HttpServletRequest request,RedirectAttributes rttr) {
		int result = service.deleteGuestBook(guestBookid);
		String msg = "";
		if(result==1) {
			msg = "삭제성공";
		}else {
			msg = "삭제실패";
		}
		rttr.addFlashAttribute(msg);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
}
