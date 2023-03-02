package fleaMarket.a01_controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.CommunitySelectService;
import vo.CapplicationList;
import vo.Criteria;
import vo.PageDTO;

@Controller
public class CommunitySelectController {
	
	private CommunitySelectService service;
	//생성자 주입하기 
	
	// 커뮤니티 조회 컨트롤러 
	private final Logger logger = LoggerFactory.getLogger(CommunitySelectController.class);
	
    /**
	 * @param service
	 */
	@Autowired
	public CommunitySelectController(CommunitySelectService service) {
		this.service = service;
	}
	
	
	//기본 조회(get)
	@GetMapping("CommunityList.do")
	public String communityList(Model model,Criteria cri) throws Exception{
		// 변수도 넣을수 있고, 객체도 넣어서 확인가능 
		// info는 debug 보다 더 작은 Level 만 확인가능 
		// sysout == info로 쓰셈
		/*
		Member m = (Member) session.getAttribute("Login");
		String email = m.getEmail();
		*/
		logger.info("log"+cri);
		
		//페이지 적용 리스트 
		List<CapplicationList> clist = service.getCommunityList(cri);
		model.addAttribute("list",clist);
		model.addAttribute("pageMaker",new PageDTO(cri,service.getCommunitySelectNum(cri)));
		/* 총 게시물 처리*/
	
		return "communitySelect";
	}
	
	
	//상세 조회(get)
	@GetMapping("CommunityDetail.do")
	public String communityDetailList() {
		return "communityDetail";
	}
	
}
