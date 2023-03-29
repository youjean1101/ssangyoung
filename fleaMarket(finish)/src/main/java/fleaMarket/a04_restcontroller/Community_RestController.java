package fleaMarket.a04_restcontroller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fleaMarket.a02_service.CommunityReplyService;
import fleaMarket.a02_service.CommunitySelectService;
import vo.ReplyVo;

@Controller
public class Community_RestController {
	
	
	private CommunitySelectService service;
	private CommunityReplyService reservice;
	private final Logger logger = LoggerFactory.getLogger(Community_RestController.class);

	/**
	 * @param service
	 */
	
	
	

	@GetMapping("/selectFriend.do")
	public String selectFriend(@RequestParam("communityNumber") int communityNumber,@RequestParam("myEmail") String myEmail,Model model) {
		int followCheck = service.getFollowYesOrNot(communityNumber,myEmail);
		model.addAttribute("followCheck",followCheck);
		return "pageJsonReport";
	}
	/**
	 * @param service
	 * @param reservice
	 */
	@Autowired
	public Community_RestController(CommunitySelectService service, CommunityReplyService reservice) {
		
		this.service = service;
		this.reservice = reservice;
	}
	/**
	 * @param reService
	 */

	//following
	@PostMapping("insertFriend.do")
	public String insertFriend(@RequestBody String email, Model model) throws Exception {
		String JsonData = email;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		String myEmail = (String)jsonObj.get("myEmail");
		String following = (String)jsonObj.get("following");
	    int ikey = service.getInsertFriend(myEmail, following);
		logger.info("json="+ikey);
		
		model.addAttribute(ikey);
		return "pageJsonReport";
	}
	//delete
	@PostMapping("deleteFriend.do")
	public String deleteFriend(@RequestBody String email,Model model) throws Exception {
		String JsonData = email;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		String myEmail = (String)jsonObj.get("myEmail");
		String following = (String)jsonObj.get("following");
	    int ikey = service.getDeleteFriend(myEmail, following);
		logger.info("json="+ikey);
		String msg = "";
		if(ikey==1) {
			msg = "success";
		}else {
			msg = "fail";
		}
		model.addAttribute(msg);
		return "pageJsonReport";
	}
	@PostMapping("insertLike.do")
	public String insertHeart(@RequestBody String info,Model model) throws ParseException {
		String JsonData = info;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		int communityNumber = Integer.parseInt((String) jsonObj.get("communityNumber"));
		String email = (String)jsonObj.get("email");
		String msg =  service.getInsertLike(communityNumber,email);		
		int likeCnt = service.getLikeCnt(communityNumber);
		model.addAttribute("likeCnt",likeCnt);
		return "pageJsonReport";		
	}
	@PostMapping("deleteLike.do")
	public String deleteHeart(@RequestBody String info,Model model) throws Exception {
		String JsonData = info;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		//int communityNumber = (int)jsonObj.get("communityNumber");
		int communityNumber = Integer.parseInt((String) jsonObj.get("communityNumber"));
		String email = (String)jsonObj.get("email");
		String msg =  service.getDeleteLike(communityNumber,email);
		
		int likeCnt = service.getLikeCnt(communityNumber);
		model.addAttribute("likeCnt",likeCnt);
		
		return "pageJsonReport";		
	}
	@GetMapping("likeCnt.do")
	public String likeCnt(@RequestParam("communitynumber") int communitynumber,Model model) {
		int likeCnt = service.getLikeCnt(communitynumber);
		model.addAttribute("likeCnt", likeCnt);
		return "pageJsonReport";
				
	}
			
}
