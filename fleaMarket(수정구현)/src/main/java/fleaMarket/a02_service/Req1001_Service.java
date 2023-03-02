package fleaMarket.a02_service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req1001_Dao;
import fleaMarket.util.FileService;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;
@Service 
public class Req1001_Service {
	// 프로필사진 경로
	@Value("${profile.upload}")
	private String profilepath;
	
	@Autowired
	private Req1001_Dao dao;
	
	private FileService fileservice;
	
	public List<Member> MemberList(Member sch){
		if(sch.getEmail()==null) sch.setEmail("");
		if(sch.getNickname()==null) sch.setNickname("");
		if(sch.getAuthority()==null) sch.setAuthority("");
		if(sch.getAddress()==null) sch.setAddress("");
		return dao.MemberList(sch);
}
	public Member getMember(String nickname) {
		return dao.getMember(nickname);
	}
	
	public void UpdateMemberInfo(Member upt){
		dao.UpdateMemberInfo(upt);
	}
	
	public void UpdateProfile(ProfileImg upt) {
		dao.UpdateProfile(upt);
	}
	
	
	
	
}
