package fleaMarket.a01_controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunitySelectController {
	// 커뮤니티 조회 컨트롤러 
	private final Logger logger = LoggerFactory.getLogger(CommunitySelectController.class);
    //기본 조회(get)
	@GetMapping("CommunitySelect.do")
	public String communitySelect() {
		// 변수도 넣을수 있고, 객체도 넣어서 확인가능 
		// info는 debug 보다 더 작은 Level 만 확인가능 
		// sysout == info로 쓰셈 
		logger.info("로거 성공!");
		return "communitySelect";
	}
	//상세 조회(get)
	@GetMapping("CommunityDetail.do")
	public String communityDetailSelect() {
		return "communityDetail";
	}
	
}
