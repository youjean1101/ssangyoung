package fleaMarket.a01_controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.CommunitySelectService;
import vo.Criteria;
import vo.PageDTO;

@Controller
public class IrrgularReportController {
	private CommunitySelectService service;
	//생성자 주입하기
	// 커뮤니티 조회 컨트롤러 
    private final Logger logger = LoggerFactory.getLogger(IrrgularReportController.class);
	/**
	 * @param service
	 */
    @Autowired
	public IrrgularReportController(CommunitySelectService service) {
		super();
		this.service = service;
	}
  //http://localhost:7080/fleaMarket/showrgu.do 메인
	@GetMapping("show.do")
	public String IrrgularReportList(Criteria cri,Model d) {
		d.addAttribute("irr",service.getIrrReportList(cri));
		d.addAttribute("pageMaker",new PageDTO(cri,service.getIrrNum(cri)));
		return "AdminCommunity";
	}
	
	@GetMapping("deleteIrr.do")
	public String IrrdeleteBoard(@RequestParam int communityNumber,@RequestParam String email,HttpServletRequest request,RedirectAttributes rttr) {
		
		
		int result = service.getDeleteBoard(communityNumber,email);
		String msg = "";
		String referer = request.getHeader("Referer");
		if(result == 0) {
			msg = "실패";		
		};
		msg = "성공";
		rttr.addFlashAttribute("msg",msg);
		
		return "redirect:/show.do";
	}
			
}
