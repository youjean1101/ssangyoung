package fleaMarket.a01_controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a02_service.Req1001_Service;
import fleaMarket.util.FileService;
import vo.FApplicationSch;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;


@Controller("Req1001")
public class Req1001_Controller {
		
	@Autowired
	private Req1001_Service service;
	
	@Autowired
	private FileService fileservice;
	
	@Value("${profile.upload}")
	private String profilepath;
	@Value("${qna.upfile}")
	private String qnafilepath;
	//홈페이지 
	
		//http://localhost:7080/fleaMarket/callmain.do 메인
		@RequestMapping("callmain.do")
		public String callmain() {
			return "main";
		}
		//http://localhost:7080/fleaMarket/AdminIntro.do 회사소개
		@RequestMapping("AdminIntro.do")
		public String AdminIntro() {
			return "AdminIntro";
		}
	
		//http://localhost:7080/fleaMarket/QNAList.do 문의사항 전체조회
		@RequestMapping("QNAList.do")
		public String QNAList(@ModelAttribute("sch") FApplicationSch sch,Model d){
			d.addAttribute("QNAListNotics",service.QNAListNotics());
			d.addAttribute("QNAList", service.QNAList(sch));
			d.addAttribute("NoAnswerQnaList",service.NoAnswerQnaList());
			return "QNAList";
		}
		// 문의사항 첨부 파일 다운로드
		
		
		@GetMapping("downloadqna.do")
		public String download(@RequestParam("filepath") String filepath, 
							@RequestParam("filename") String filename,Model d) {
			d.addAttribute("downloadPath",qnafilepath+filepath);
			d.addAttribute("downloadName",filename);
			return "downloadView";
		}
		
		// http://localhost:7080/fleaMarket/GetQNA.do 
		//문의사항 상세 조회 + 첨부파일명 가져오기
		@GetMapping("GetQNA.do")
		public String getQnA(@RequestParam("qnano") String qnano,Model d){
			
			d.addAttribute("qna",service.getQNA(qnano));
			d.addAttribute("qna2",service.getQNAFile(qnano));
			return "GetQNA";
		}	
			
		// 마이페이지 
		//http://localhost:7080/fleaMarket/AdminSearch.do 관리자페이지 - 회원조회
		@RequestMapping("AdminSearch.do")
		public String AdminSearch(@ModelAttribute("sch") FApplicationSch sch,Model d) {
			d.addAttribute("MemberList",service.MemberList(sch));
				return "AdminSearch";
		}
		//http://localhost:7080/fleaMarket/MemberInfo.do 마이페이지 내 정보 확인 
		@RequestMapping("MemberInfo.do")
		public String MemberInfo() {
			return "MemberInfo";
		}
		
		
		// 마이페이지 내 정보 수정 
		@RequestMapping("UpdateMemberInfo.do")
		public String UpdateMemberInfo(Member upt,@RequestParam("profileimg") MultipartFile profile,
				Model d,HttpSession session) {
			
			
			//유저정보 변경
			service.UpdateMemberInfo(upt);
			
			
			
			Member mb = (Member)session.getAttribute("Login");
			
			//세션프사가 기본사진이냐?
			boolean check = mb.getProfileimgname().equals("defaultprofile.png")?true:false;
			
			
			ProfileImg fupt = new ProfileImg();
			
			fupt.setEmail(upt.getEmail());
			
			
			//수정할 파일이 있다는거니까 삭제처리
			if(profile.getOriginalFilename()!="") {
			//근데 기존프사가 기본꺼엿으면 삭제 ㄴㄴ
				if(!check) {fileservice.DeleteFile(profilepath,mb.getProfileimgname());}
					fupt.setProfileimg(fileservice.insprofileimg(profilepath,profile));	
					service.UpdateProfile(fupt);
			//프사 내리는 경우의수
			}else if(profile.getOriginalFilename()==""&& !check && upt.getProfileimgname().equals("defaultprofile.png") ) {
				fileservice.DeleteFile(profilepath,mb.getProfileimgname());	
				fupt.setProfileimg("defaultprofile.png");
				service.UpdateProfile(fupt);
			}
				
			
			
			
			session.setAttribute("Login",service.getLogin(upt.getEmail()));
			 d.addAttribute("uptmsg","회원 수정이 완료되었습니다.");
			return "MemberInfo";
		}
		
		//마이페이지 비밀번호 변경
		@RequestMapping("UpdatePassword.do")
		public String UpdatePassword(Member upt,HttpSession session,Model d) {
			//변경될거니까 세션 지우기
			//session.removeAttribute("Login");
			
			//비번변경
			 service.UpdatePassword(upt);
			 
			//다시 세션처리
			 session.setAttribute("Login",service.getLogin(upt.getEmail()));
			 
			 d.addAttribute("uptmsg","비밀번호 변경이 완료되었습니다.");
			return "MemberInfo";
		}
		// 마이페이지 - 내가 쓴 플리마켓 모집글
		@RequestMapping("MemberFmReg.do")
		public String MemberFmReg(@ModelAttribute("sch") FApplicationSch sch, 
						 Model d, HttpSession session) {
			d.addAttribute("FleaMarketList",service.FleaMarketList(sch));
				return "MemberFmReg";
		}
		
		// 마이페이지 - 회원 내가 쓴 문의글
		@RequestMapping("MemberInquire.do")
		public String MemberInquire(@ModelAttribute("sch") FApplicationSch sch, 
						Model d, HttpSession session) {
			d.addAttribute("MemberQNAList",service.MemberQNAList(sch));
				return "MemberInquire";
		}
		
		// 마이페이지 - 사이트 탈퇴
		@PostMapping("LeaveMember.do")
		public String LeaveMember(@RequestParam("email") String email,Model d,HttpSession session){
			
			//밑에 모듈처리함
			service.LeaveMember(email);
			//세션삭제 처리.. ㅂㅂ
			session.removeAttribute("Login");
			return "main";
		}
		
		
		//관리자 페이지 - 회원탈퇴처리 여러개 ㅇㅇ
		@PostMapping("DeleteMembers.do")
	    public String DeleteMembers(@RequestParam("email") List<String> email){
	       service.DeleteMembers(email);
	        return "redirect:AdminSearch.do";
	    }
		
	
		
		
		
		
		
	 //=======================================================================================   
		//여기를 모두탈퇴처리하는걸로 리뉴얼해야함
		//탈퇴 처리 모듈화
		/*
		public void DeleteMemberModule(String email) {
			//1.이미지테이블의 회원이메일/프로필이름 불러오기
			ProfileImg pfile = (ProfileImg)service.getMemberProfile(email);
			//프로필테이블 삭제처리
			service.DeleteProfile(email);
			//탈퇴처리
			service.DeleteMember(email);
			//프로필 파일 삭제
			if(!pfile.getProfileimg().equals("defaultprofile.png")) {
			fileservice.DeleteFile(profilepath,pfile.getProfileimg());
			}
		}
		*/
		
	}
