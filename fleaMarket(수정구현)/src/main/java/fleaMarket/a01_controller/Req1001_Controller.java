package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a02_service.Req1000_Service;
import fleaMarket.a02_service.Req1001_Service;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;


@Controller("Req1001")
public class Req1001_Controller {
	
	@Autowired
	private Req1001_Service service;
	
	@Autowired
	private FileService fileservice;
	
	@Value("${profile.upload}")
	private String profilepath;
	
	
	//http://localhost:7080/fleaMarket/AdminIntro.do 회사소개
	@RequestMapping("AdminIntro.do")
	public String AdminIntro() {
		return "AdminIntro";
	}
	//http://localhost:7080/fleaMarket/AdminSearch.do 관리자 회원조회
	@RequestMapping("AdminSearch.do")
	public String AdminSearch(@ModelAttribute("sch")Member sch, Model d) {
		d.addAttribute("MemberList",service.MemberList(sch));
			return "AdminSearch";
	}
	//http://localhost:7080/fleaMarket/AdminInquire.do 관리자 문의사항 답변 조회
	@RequestMapping("AdminInquire.do")
	public String AdminInquire() {
		return "AdminInquire";
	}
	
	//http://localhost:7080/fleaMarket/AdminPost.do 관리자 공지사항 작성조회
	@RequestMapping("AdminPost.do")
	public String AdminPost() {
		return "AdminPost";
	}
	//http://localhost:7080/fleaMarket/MemberInfo.do 마이페이지 내 정보
	@RequestMapping("MemberInfo.do")
	public String MemberInfo() {
		return "MemberInfo";
	}
	//http://localhost:7080/fleaMarket/MemberInquire.do 마이페이지 문의사항 조회
	@RequestMapping("MemberInquire.do")
	public String MemberInquire() {
		return "MemberInquire";
	}
	
	@RequestMapping("UpdateMemberInfo.do")
	public String UpdateMemberInfo(Member upt,@RequestParam("profileimg") MultipartFile profile) {
		System.out.println("수정 벨류확인:"+upt.getNickname());
		System.out.println("수정 벨류확인:"+upt.getAddress());
		System.out.println("수정 벨류확인:"+upt.getPhonenumber());
		System.out.println("수정 벨류확인:"+upt.getCategory());
		System.out.println("수정 벨류확인:"+upt.getEmail());
			//정보 수정
			service.UpdateMemberInfo(upt);
			//수정 시, 이미지파일이 null이아니면
			if(profile.getOriginalFilename()!=null) {
				// 파일 삭제처리
				fileservice.DeleteFile(profilepath,upt.getProfileimgname());			
				// 테이블에 수정을 위해 값 할당 이메일/새 프로필이미지
				// 새 프로필 이미지넣을겸 파일 다시 폴더에 삽입처리
				ProfileImg fupt = new ProfileImg();
				fupt.setEmail(upt.getEmail());
				fupt.setProfileimg(fileservice.insprofileimg(profilepath,profile));
				//테이블 파일 업데이트 처리
				service.UpdateProfile(fupt);
				
			}
		return "MemberInfo";
	}
	
}
