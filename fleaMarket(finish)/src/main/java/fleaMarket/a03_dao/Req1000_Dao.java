package fleaMarket.a03_dao;

import java.util.HashMap;
import java.util.List;

import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

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
	public void SnsEmailPlus2(Member upt);
	public void MemberFindPassword(HashMap<String,String> map);
	public void QNAInsert(QNA ins);
	public void QNAFileInsert(QNAFile ins);
	public void QNAUpdate(QNA upt);
	public List<QNAFile> GetFileNames(String qnano);
	public void QNAFileDelete(String qnano);
	public void QNADelete(String qnano);
	public void QNAAnswerUpdate(String qnano);
	public int checkBusiness(String businessnumber);
}
