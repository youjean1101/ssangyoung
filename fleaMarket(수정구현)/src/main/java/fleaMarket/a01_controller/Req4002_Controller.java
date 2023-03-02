package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import fleaMarket.a02_service.Req4002_Service;
import vo.Capplication;

@Controller
public class Req4002_Controller {
	@Autowired(required=false)
	Req4002_Service service;
	
	@RequestMapping("communityInsertPage.do")
	public String communityInsertPage() {
		return "communityInsert";
	}
	@PostMapping("communityInsert.do")
	public String communityInsert(Capplication ins, Model d) {
		service.communityInsert(ins);
		d.addAttribute("msg", "등록 성공");
		return "communityInsert"; // 전체조회페이지로 이동
	}
	
	@RequestMapping("communityUpdatePage.do")
	public String communityUpdatePage() {
		return "communityUpdate";
	}
	
	@PostMapping("communityUpdate.do")
	public String communityUpdate(Capplication upt, Model d) {
		service.communityUpdate(upt);
		d.addAttribute("msg", "수정 성공");
		return "communityUpdate"; // 상세조회페이지로 이동
	}
	
	
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
	@RequestMapping("communityFollowMember.do")
	public String communityFollowMember() {
		return "communityFollowMember";
	}
	
	@RequestMapping("communityMemberRoom.do")
	public String communityMemberRoom() {
		return "communityMemberRoom";
	}
	
}
