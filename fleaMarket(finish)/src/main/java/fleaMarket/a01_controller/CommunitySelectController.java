package fleaMarket.a01_controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.CommunityReplyService;
import fleaMarket.a02_service.CommunitySelectService;
import vo.CapplicationList;
import vo.Criteria;
import vo.Member;
import vo.PageDTO;
import vo.ReplyVo;
import vo.irregularReportVo;

@Controller
public class CommunitySelectController {
	
	private CommunitySelectService service;
	//생성자 주입하기
	private CommunityReplyService repservice;
	
	// 커뮤니티 조회 컨트롤러 
	private final Logger logger = LoggerFactory.getLogger(CommunitySelectController.class);
	
    /**
	 * @param service
	 */
	
	
	
	
	/**
	 * @param service
	 * @param repservice
	 */
	@Autowired
	public CommunitySelectController(CommunitySelectService service, CommunityReplyService repservice) {
		
		this.service = service;
		this.repservice = repservice;
	}




	//기본 조회(get)
	@GetMapping("CommunityList.do")
	public String communityList(@RequestParam(value = "showTemplete",required = false , defaultValue="all") String showTemplete,Model model,Criteria cri,HttpSession session) throws Exception{
		// 변수도 넣을수 있고, 객체도 넣어서 확인가능 
		// info는 debug 보다 더 작은 Level 만 확인가능 
		// sysout == info로 쓰셈
		/*
		Member m = (Member) session.getAttribute("Login");
		String email = m.getEmail();
		*/
		logger.info("log"+cri);
		
		Optional<Member> member = Optional.ofNullable((Member)session.getAttribute("Login"));
		if(member.isPresent()) {
		    String sessions = member.get().getEmail();
		    String authority = member.get().getAuthority();
		    model.addAttribute("session", sessions);
		    model.addAttribute("authority",authority);
		}
	    
		List<CapplicationList> clist;
		if(showTemplete.equals("all") || showTemplete == "") {
			clist = service.getCommunityList(cri);
			
			
			model.addAttribute("bestValue",showTemplete);
			model.addAttribute("list",clist);
			model.addAttribute("pageMaker",new PageDTO(cri,service.getCommunitySelectNum(cri)));
		}
		if(showTemplete.equals("best")) {
			//인기글 처리
			clist = service.getCommunityBestList(cri);
			model.addAttribute("bestValue",showTemplete);
			model.addAttribute("list",clist);
			model.addAttribute("pageMaker",new PageDTO(cri,service.getCommunityBestCount(cri)));
		}
		//페이지 적용 리스트 
		
		/* 총 게시물 처리*/
		return "communitySelect";
	}
	
	//상세 조회(get)
	@GetMapping("CommunityDetail.do")
	public String communityDetailList(@RequestParam(value = "showTemplete",required = false , defaultValue="all") String showTemplete,
			@RequestParam("communityNumber") int communityNumber,HttpSession session,Model model,Criteria cri,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		//세션처리이 있을때만 model 보내는 것 
		//Optional.ofNullable((Member)session.getAttribute("Login")).orElse("");
		Optional<Member> member = Optional.ofNullable((Member)session.getAttribute("Login"));
		if(member.isPresent()) {
	    String sessions = member.get().getEmail();
		String profileImg = member.get().getProfileimgname();
		model.addAttribute("session", sessions);
		model.addAttribute("profileImg",profileImg);
		//int followCheck 처리 
		int followCheck = service.getFollowYesOrNot(communityNumber, sessions);
		int likeCheck = service.getLikeYesOrNot(communityNumber, sessions);
		model.addAttribute("followCheck",followCheck);
		model.addAttribute("likeCheck",likeCheck);
		logger.info(sessions);
		}
		
		//상세조회 정보 
		List<CapplicationList> clist = service.getCommunityDetailList(cri);
		//이미지 다중불러오기.
		List<String> imgList = service.getCommunityImg(communityNumber);
		
		
		//int 좋아요 수 
		int likeCnt = service.getLikeCnt(communityNumber);
		//댓글 리스트 
		List<ReplyVo> replyList = repservice.replyList(communityNumber,cri);
		int replyCnt = repservice.getReplyCnt(communityNumber);
		//이전페이지 모델화함 
		//나중에 바꿀때 편하게 하기위해서 vo로 안보냈음.
		logger.info(cri.getCategory());
		logger.info(cri.getKeyword());
		model.addAttribute("keyword",cri.getKeyword());
		model.addAttribute("type",cri.getType());
		model.addAttribute("shift",cri.getShift());
		model.addAttribute("category",cri.getCategory());
		
		model.addAttribute("dlist",clist);		
		model.addAttribute("imgList",imgList);
		model.addAttribute("replyCnt",replyCnt);
		model.addAttribute("likeCnt",likeCnt);	
		model.addAttribute("replyList",replyList);
		model.addAttribute("pageMaker",new PageDTO(cri,repservice.getReplyCnt(communityNumber)));
		/*
		 * 조회수 중복 방지 쿠키 <쿠키 이용/ 중복 방지> 
		 */
		Cookie[] cookies = request.getCookies();
		int visitor = 0;	
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("visit")){
					visitor = 1;
					if(cookie.getValue().contains(request.getParameter("communityNumber"))) {
						logger.info(cookie.getName());
					}else{
						cookie.setValue(cookie.getValue()+"s"+request.getParameter("communityNumber").replaceAll("\\+", "%20"));
						response.addCookie(cookie);
						service.updateViewCnt(communityNumber);
						
					}
			}
		}
		//쿠키 추가 한번도 방문 안했을 때, 
		if(visitor == 0) {
			Cookie cookie1 = new Cookie("visit",request.getParameter("communityNumber"));
			response.addCookie(cookie1);
			service.updateViewCnt(communityNumber);	
		}
		/*
		 * 조회수 중복 방지 ---------------------------
		 */
		return "communityDetail";
	}
	@PostMapping("deleteBoard.do")
	public String deleteBoard(@RequestParam int communityNumber,@RequestParam String email,@RequestParam String category,HttpSession session,HttpServletRequest request,RedirectAttributes rttr) {
		Member member = (Member)session.getAttribute("Login");
		Optional<String> opt = Optional.ofNullable(member.getEmail());
		//세션이 없을때 
		String emails = opt.orElse("");
		//관리자 추가 
		if(emails.equals("admin@contigo.com")) {
			int result = service.getDeleteBoard(communityNumber,email);
		}
		
		int result = service.getDeleteBoard(communityNumber,email);
		if(result == 1) {rttr.addFlashAttribute("msg","삭제");}
		
		String encodedParam = "";
		try {
			encodedParam = URLEncoder.encode(category, "UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/CommunityList.do?category="+encodedParam;
	}
	
	//처리
    //댓글 등록 
	@PostMapping("writeReply.do")
	public String writeReply(@RequestParam int communitynumber,@RequestParam String content,HttpSession session,HttpServletRequest request) {
		Member member = (Member)session.getAttribute("Login");
		Optional<String> opt = Optional.ofNullable(member.getEmail());
		String sessions = opt.orElse("");
		ReplyVo vo = new ReplyVo();
		vo.setCommunityNumber(communitynumber);
		vo.setRepcontent(content);
		vo.setEmail(sessions);
		int communityNumber = communitynumber;
		//나중에 등록, 리스트 구현 후 개수 받아올 예정 
		int result = repservice.insertReply(vo);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	@RequestMapping("writeReReply.do")
	public String writeReReply(@RequestParam int communitynumber,@RequestParam int groupid,@RequestParam String content,HttpSession session,
			HttpServletRequest request) {
		Member member = (Member)session.getAttribute("Login");
		Optional<String> opt = Optional.ofNullable(member.getEmail());
		String sessions = opt.orElse("");
		ReplyVo vo = new ReplyVo();
		vo.setCommunityNumber(communitynumber);
		vo.setRepcontent(content);
		vo.setEmail(sessions);
		vo.setGroupid(groupid);
		int communityNumber = communitynumber;
		repservice.insertReReply(vo);
		//이전페이지 url 
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	@PostMapping("insertReport.do")
	public String insertReport(irregularReportVo vo,HttpSession session,HttpServletRequest request,RedirectAttributes rttr) {
		Member member = (Member)session.getAttribute("Login");
		Optional<String> opt = Optional.ofNullable(member.getEmail());
		String sessions = opt.orElse("");
		//세션 이메일에 넣기 ㅋ 
		vo.setEmail(sessions);
		int result = service.insertIrrReport(vo);
		if(result == 0) {
			rttr.addFlashAttribute("irrmsg","irrfail");
		}
		if(result == 1) {
			rttr.addFlashAttribute("irrmsg","irrSuccess");
		}
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	@PostMapping("updateReply.do")
	public String updateReport(ReplyVo vo,HttpServletRequest request,RedirectAttributes rttr) throws UnsupportedEncodingException {
		int result = repservice.updateReply(vo);
		String msg = "";
		if(result==1) {
			msg = "update";
		}else {
			msg = "fail";
		}
		String referer = request.getHeader("Referer");
		//ㅎ
	
		return "redirect:"+referer;
	}
	@PostMapping("deleteReply.do")
	public String deleteReply(ReplyVo vo,HttpServletRequest request,RedirectAttributes rttr) {
		String msg = repservice.deleteReply(vo);
		logger.info(msg);
        String referer = request.getHeader("Referer");
        rttr.addFlashAttribute("msg",msg);
		return "redirect:"+referer;
	}
}
