package fleaMarket.a01_controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.Req4002_Service;
import fleaMarket.util.FileService;
import vo.BoardImg;
import vo.Criteria;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.PageDTO;
import vo.RoomMemberInfo;

@Controller
public class Req4002_Controller {
	@Autowired(required=false)
	Req4002_Service service;
	
	// 파일 업로드 import
	@Autowired
	private FileService fileservice;
	
	// 파일경로
	@Value("${board.upload2}")
	private String upload;
	
	// 파일 업로드하기 기능메서드
	public String multifileFun(List<MultipartFile> mfiles) {
		ArrayList<String> imgNames = new ArrayList<String>();
		for (MultipartFile mf : mfiles) {
			imgNames.add(fileservice.insprofileimg(upload, mf));
		}
		int inCnt = imgNames.indexOf(""); // 들어오는 이미지 갯수
		System.out.println("인덱스"+inCnt); // 넣은 숫자값+1
		if(inCnt==-1) {
			inCnt = 5;
		}else if(inCnt==0) {
			inCnt = 1;
		}
		String imgnameVal="";
		for(int i=0;i<(inCnt+1);i++) {
			imgnameVal += imgNames.get(i);
			if(i<inCnt) { //이미지 들어온값까지만 구분자 추가
				imgnameVal += "&SEP&";
			}
		}
		System.out.println(imgnameVal);
		if(inCnt==5) {
			return imgnameVal;
		}else {
			return (imgnameVal.substring(0,imgnameVal.length()-5));
		}
	}
	
	@RequestMapping("communityInsertPage.do")
	public String communityInsertPage(@RequestParam("category") String category, Model d) {
		System.out.println(category);
		d.addAttribute("category", category);
		return "communityInsert";
	}
	
	@PostMapping("communityInsert.do")
	public String communityInsert(@RequestParam("mediaFile") List<MultipartFile> mfiles ,
			RedirectAttributes rttr,Capplication ins) {
		service.communityInsert(ins);
		BoardImg f = new BoardImg();
		if( mfiles!=null ){
			f.setImgname(multifileFun(mfiles)); //끝에 구분자제거해서 생성자에 추가
			f.setImgpath(upload);
			service.communityFileInsert(f);
		}
		String category = ins.getCategory();
		System.out.println("category"+category);
		rttr.addFlashAttribute("msg", "등록성공");
		
		String encodeCategory ="";
		String encodedParam;
		try {
			encodedParam = URLEncoder.encode(ins.getCategory(), "UTF-8");
			encodeCategory = encodedParam;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/CommunityList.do?category="+encodeCategory;// 전체조회페이지로 이동
	}
	
	@RequestMapping("communityUpdatePage.do")
	public String communityUpdatePage(@RequestParam("communityNumber") int upt, Model d) {
		Capplication boardInfoVo = service.boardDetailSelect(upt);
		
		ArrayList<String> boardArr = new ArrayList<String>(); // 동적 배열
		//String[] dataArr = boardInfoVo.getImgname().split("&SEP&"); // 구분자로 나눠서 배열에 넣기
		
		if(boardInfoVo.getFileNameList()!=null) {
			for (String imgname:boardInfoVo.getFileNameList()) {
				System.out.println("사진명:"+imgname);
				boardArr.add(imgname);
			}
			d.addAttribute("boardImgArrOne", boardArr.get(0));
			boardArr.remove(0);
			d.addAttribute("boardImgArr", boardArr);
		}
		
		boardArr.indexOf("");
		d.addAttribute("boardInfo", boardInfoVo);
		//String referer = request.getHeader("Referer");
		return "communityUpdate";
				
	}
	
	// 파일 업데이트 기능메서드 (아직 구성중)
	@PostMapping("communityUpdate.do")
	public String communityUpdate(@RequestParam("updateFile") List<MultipartFile> mfiles,@RequestParam(value="photoUptDiv", required = false) String photoUptDiv, Capplication upt,RedirectAttributes rttr) { //,@RequestParam("indexNo") List<String> idx
		service.communityUpdate(upt); // text형들 수정
		BoardImg f = new BoardImg();
		
		if(mfiles!=null ) { //&& photoUptDiv!=null - 아니 근데 null이 아니면 인데 왜실행됨? 
			f.setImgname(multifileFun(mfiles));
			f.setCommunitynumber(upt.getCommunitynumber());
			System.out.println("수정할 파일명"+f);
			service.communityFileUpdate(f);
		}
		
//		// 등록되어있는 사진명배열
//		Capplication imgname = service.boardDetailSelect(upt.getCommunitynumber());
//		ArrayList<String> regFileName = new ArrayList<String>();
//		for(String reg:imgname.getFileNameList()) { // 스플릿 값은 어쩔수 없이 정적배열 처리
//			regFileName.add(reg); // 등록되어있는 파일 동적 배열 처리
//		}
//		
//		for(String i:idx) {
//			System.out.println("인덱스번호:"+i);
//		}
//		
//		String uptFname = "";
//		
//		System.out.println("## 등록되어있는 사진 삭제처리호출 ##");
//		if(!idx.equals("6")) {
//			for(int i=0;i<7;i++) {
//				if( Integer.parseInt(idx.get(i))<=regFileName.size()) { // 체크박스 인덱스 번호가 등록되어있는 동적배열보다 적을 때
//					System.out.println("등록된 사진들"+regFileName.get(Integer.parseInt(idx.get(i)))); // 1부터+1이됨
//					regFileName.remove(Integer.parseInt(idx.get(i)));
//				}
//			}
//		}
//		
//		for(String r:regFileName) {
//			System.out.println("삭제 처리 후,등록된 사진들"+r);
//		}
//		// 수정한 파일명 배열
//		ArrayList<String> inputfileList = new ArrayList<String>(); // 수정파일명 리스트 
//		inputfileList = multifileFun(mfiles);
//		System.out.println("## 수정으로 들어간 사진 호출 ##");
//		
//		for(String ili:inputfileList) {
//			inputfileList.add(ili); // 입력한 파일 추가
//		}
//		
//		for(String input:inputfileList) {
//			System.out.println("들어간 사진들:"+input);
//		}
//	
//		ArrayList<String> uptFileName = new ArrayList<String>(); // (같은파일체크)수정 파일
//		for(String reg:regFileName) {
//			uptFileName.add(reg);
//			System.out.println(reg);
//		}
//		for(String infile:inputfileList) {
//			uptFileName.add(infile);
//			System.out.println(infile);
//		}
//		for(int u=0;u<uptFileName.size();u++) {
//			uptFname += uptFileName.get(u);
//			if(u<uptFileName.size()) { //이미지 들어온값까지만 구분자 추가
//				uptFname += "&SEP&";
//			}
//		}
//		
//		System.out.println("@@@@@@@@@@@@수정된 파일내용 :"+uptFname);
//		
//		System.out.println("## 최종수정본");
//		System.out.println(uptFname);
//		BoardImg f = new BoardImg();
//		if( mfiles!=null ){
//			f.setImgname(uptFname.substring(0,uptFname.length()-5)); // 파일명 리턴해옴.
//			f.setCommunitynumber(upt.getCommunitynumber());
//			service.communityFileUpdate(f); //이미지
//		}
		//d.addAttribute("communityNumber", no);
		rttr.addFlashAttribute("msg", "수정성공");
		//d.addAttribute("msg", "수정성공");
		String encodeCategory ="";
		//System.out.println("카테고리"+ufn);
		String encodedParam;
		try {
			encodedParam = URLEncoder.encode(upt.getCategory(), "UTF-8");
			encodeCategory = encodedParam;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 카테고리,키워드 (공백가능), 커뮤니티넘버, shift(정렬)(공백가능),타입(공백가능), 키워드 (공백가능),커뮤니티넘버
		return "redirect:/CommunityDetail.do?communityNumber="+upt.getCommunitynumber()+"&category="+encodeCategory; // 상세조회페이지로 이동
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
	
	@RequestMapping("communityFollowMember.do")
	public String communityFollowMember(FollowMemberInfo sel, Criteria cri,Model d,HttpSession session) {
		session.getAttribute("Login");
		d.addAttribute("follower", service.followerSelect(sel));
		//List<FollowMemberInfo> list = service.followerSelectPage(cri);
		//System.out.println("팔로우 갯수 : "+service.followerSelect(sel).size()); 
		//d.addAttribute("pageMaker", new PageDTO(cri, list.size()));
		//System.out.println("페이징 팔로우 갯수 : "+service.followerSelectPage(cri));
		//d.addAttribute("follower", list);
		//System.out.println(service.followerSelect(sel));
		return "communityFollowMember";
	}
	
	@RequestMapping("communityFollowDelete.do")
	public String communityFollowDelete(FollowMemberInfo del, HttpServletRequest request, RedirectAttributes rttr) {
		service.followmemberdelete(del);
		rttr.addFlashAttribute("msg", "언팔로우");
		rttr.addFlashAttribute("unfollowemail", del.getFollowing());
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("followAdd.do")
	public String followAdd(@RequestParam("roomEmail") String roomEmail,@RequestParam("loginEmail") String loginEmail,
			 			HttpServletRequest request,RedirectAttributes rttr) {
		if(loginEmail!=null && roomEmail!=null ) {
			if(service.followCheck(loginEmail, roomEmail)<1 && loginEmail!=roomEmail) { // 팔로우가 되어있는지 유효성 체크
				service.insertFriend(loginEmail,roomEmail);
				rttr.addFlashAttribute("followemail", roomEmail);
				rttr.addFlashAttribute("followSuccess", "팔로우성공");
			}
			System.out.println("팔로우 여부"+service.followCheck(loginEmail, roomEmail));
		}
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
		//return "redirect:/communityMemberRoom.do?email="+roomEmail+"&loginEmail="+loginEmail;
	}
	
	
	@RequestMapping("communityMemberRoom.do")
	public String communityMemberRoom(@RequestParam("email") String email, @RequestParam(value="loginEmail", required = false) String loginEmail, 
								  FollowMemberInfo sel, RoomMemberInfo board,
									HttpSession session, Model d) {
		//if(session.getAttribute("Login")==null) session.setAttribute("Login","");
		//System.out.println(session.getAttribute("Login").toString());
//		if(hideInfo!=0) {
//			System.out.println("숨긴값:"+hideInfo);
//			// 정보 숨김처리
//			d.addAttribute("hide", hideInfo);
//		}
		
		
		if(loginEmail!=null) {
			 if(service.followCheck(loginEmail, email)<1) { // 팔로우가 안되어있으면 유효성 체크
				 d.addAttribute("followWhether", "0"); 
			 }else { 
				 d.addAttribute("followWhether", "1"); 
			 }
		}
		
		session.getAttribute("Login");
		// 룸주인 회원정보 
		Map<String, String> memInfoMap = new HashMap<String, String>();
		
		memInfoMap.put("email",email);
		memInfoMap.put("div", null);
		d.addAttribute("roommember", service.roomMemberInfo(memInfoMap).get(0));
		System.out.println("룸회원정보:"+service.roomMemberInfo(memInfoMap).get(0));
		// 언팔중인 회원 정보
		memInfoMap.put("div", "unfollowMem");
		d.addAttribute("unfollowMember", service.roomMemberInfo(memInfoMap));
		System.out.println("언팔한회원정보"+service.roomMemberInfo(memInfoMap));
		
		//System.out.println("룸회원정보"+service.roomMemberInfo(memInfoMap).spliterator());
		//System.out.println("####팔로우하지않은 회원정보"+service.roomMemberInfo(memInfoMap).toString().split(","));
		// 좋아요 갯수
		d.addAttribute("likeCnt", service.boardLikeCnt(email));
		System.out.println("좋아요갯수"+service.boardLikeCnt(email));
		// 팔로우 정보
		sel.setMyemail(email);
		d.addAttribute("follower", service.followerSelect(sel));
		
		// 팔로잉 정보 (제대로 안뜸)
		// https://mititch.tistory.com/77
		// 정보은닉이 안되어(캡슐화X), 좋지않은코드.. 객체에 직접 데이터 넣기.. Map<String, String> 파라미터명이나, 매퍼 나누기
		FollowMemberInfo following = new FollowMemberInfo();
		following.setMyemail(email);
		following.setDiv("팔로잉");
		d.addAttribute("following", service.followerSelect(following));
		
		Map<String, String> repMap = new HashMap<String, String>();
		repMap.put("email", email);
		
		// 나의 게시판 정보(댓글정보)
		repMap.put("div", "meboard");
		d.addAttribute("boardreplyInfo", service.boardReplySelect(repMap));
//		System.out.println("내가쓴 게시판 정보(댓글): "+service.boardReplySelect(repMap));
		
		// 나의 댓글 정보
		repMap.put("div", "mereply");
		d.addAttribute("replyInfo", service.boardReplySelect(repMap));
//		System.out.println("내가 쓴 댓글 정보: "+service.boardReplySelect(repMap));
		
		// 카테고리별 게시판 조회
		board.setEmail(email);
			// 월별
		for(int i=1;i<13;i++) {
			if(i<10) {
				board.setRegistDateMonth("0"+i);
//				System.out.println("게시글 번호:"+board.getRegistDateMonth());
				d.addAttribute("month"+i, service.boardSelect(board).size()); 
//				System.out.println(i+"월 게시글 수:"+service.boardSelect(board).size());
			}else {
				board.setRegistDateMonth(Integer.toString(i));
//				System.out.println("10이상 게시글 번호"+board.getRegistDateMonth());
				d.addAttribute("month"+i, service.boardSelect(board).size()); 
//				System.out.println(i+"월 게시글 수:"+service.boardSelect(board).size());
			}
		}
		board.setRegistDateMonth("");
		//카테고리별
		
		board.setCategory("홍보글");
		d.addAttribute("adv", service.boardSelect(board));
		
		board.setCategory("사업아이디어");
		d.addAttribute("idea", service.boardSelect(board));
		
		board.setCategory("사는이야기");
		d.addAttribute("life", service.boardSelect(board));
		
		board.setCategory("꿀팁");
		d.addAttribute("tip", service.boardSelect(board)); 
		
		// 좋아요 누적처리 및 커뮤니티 정보
//		int totlike=0;
//		for(RoomMemberInfo e:service.boardSelect(boardMap)) {
//			totlike += e.getLikecnt();
//			System.out.println("좋아요수:"+e.getLikecnt());
//			System.out.println("전체좋아요수:"+totlike);
//		}
//		d.addAttribute("boardInfo", service.boardSelect(boardMap));
//		d.addAttribute("likeCnt", totlike);
		
		return "communityMemberRoom";
	}
}
