package fleaMarket.a03_dao;

import java.util.HashMap;

import vo.Member;
import vo.ProfileImg;

public interface Req1000_Dao {
	public Member DuplicateEmail(String email);
	public Member DuplicateMem(HashMap<String,String> map);
	public void SignUp(Member ins);
	public void insprofile(ProfileImg fins);
	public Member Login(String email);
	public Member kakaoLogin(String kakaoemail);
	public Member naverLogin(String naveremail);
	public Member CheckPeristalsisSNS_K(String snsemail);
	public Member CheckPeristalsisSNS_N(String name);	
	public void SnsEmailPlus(Member upt);
	public void MemberFindPassword(HashMap<String,String> map);
}
