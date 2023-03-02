package fleaMarket.a02_service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;



import fleaMarket.a03_dao.Req1001_Dao;

import vo.Member;
import vo.ProfileImg;
@Service 
public class Req1001_Service {
	
	@Autowired
	private Req1001_Dao dao;

	
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
	
	public void UpdatePassword(Member upt) {
		upt.setPassword(BCrypt.hashpw(upt.getPassword(), BCrypt.gensalt()));
		dao.UpdatePassword(upt);
	}
	
	public Member getLogin(String email){
		return dao.Login(email);
	}
	public void DelelteProfile(String email) {
		dao.DelelteProfile(email);
	}
	public void DelelteMember(String email) {
		dao.DelelteMember(email);
	}
	
	
	
	
}
