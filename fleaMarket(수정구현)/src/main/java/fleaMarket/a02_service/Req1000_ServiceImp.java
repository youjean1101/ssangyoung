package fleaMarket.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req1000_Dao;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;

@Service
public class Req1000_ServiceImp implements Req1000_Service {
	
	
	private Req1000_Dao dao;
	@Autowired
	public Req1000_ServiceImp(Req1000_Dao dao) {
		this.dao = dao;
	}
	
	
	
	HashMap<String,String> map;
	
	
	// 이메일 중복검사
	public Member DuplicateEmail(String email) {
		System.out.println("dd:"+email);
		return dao.DuplicateEmail(email);
	} 
	// 이름,주민 중복검사
	public Member DuplicateMem(String name,String personalnumber,String email) {
		map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		map.put("email",null);
		if(email!=null) {map.put("email",email);}
		return dao.DuplicateMem(map);
	}
	
	//회원가입
	public void SignUp(Member ins) {
		String EncPass = Bcrypter(ins.getPassword());
		ins.setPassword(EncPass);
		dao.SignUp(ins);
	}
	
	//회원가입 처리 후,이미지 업로드 처리
	/*
	public String insprofileimg(MultipartFile report) { 
		return fileservice.insprofileimg(profilepath, report); //db업로드 해야하니까 네임 리턴
	}*/
	
	// 테이블에 프로필사진 삽입
	public void insprofile(ProfileImg fins) {
		dao.insprofile(fins);
	}
	
	//로그인 처리
	public Member Login(Member log) {
		Member mem;
		if(log.getKakaoemail()!=null) { //카카오이메일로그인시
			mem = dao.kakaoLogin(log.getKakaoemail());
		}else if(log.getNaveremail()!=null) { //네이버 이메일로그인시
			mem = dao.naverLogin(log.getNaveremail());
		}else { //일반로그인
			mem = dao.Login(log.getEmail());
			if(mem.getPassword().equals("1111") || mem.getPassword().equals("admin")) {
				mem = log.getPassword().equals(mem.getPassword())?mem:null;
			}else {
				mem = CheckBcrypt(log.getPassword(),dao.Login(log.getEmail()).getPassword())?mem:null;
			}
		}
		return mem;
	}
	
	//카카오연동 여부확인
	public Member CheckPeristalsisSNS_K(String snsemail) {
		return dao.CheckPeristalsisSNS_K(snsemail);
	}
	//네이버 연동
	public Member CheckPeristalsisSNS_N(String name) {
		return dao.CheckPeristalsisSNS_N(name);
	}
	
	public void SnsEmailPlus(Member upt) {
		dao.SnsEmailPlus(upt);
	}
	public void MemberFindPassword(String name,String personalnumber,String email) {
		map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		map.put("email",email);
		dao.MemberFindPassword(map);
	}
	
	
/*=======================================================*/	
	public String Bcrypter(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	public Boolean CheckBcrypt(String OrinPass,String EncPass) {
		return BCrypt.checkpw(OrinPass, EncPass);
	}

}


	