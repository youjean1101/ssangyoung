package fleaMarket.a03_dao;

import java.util.List;

import vo.Member;
import vo.ProfileImg;

public interface Req1001_Dao {
	public List<Member> MemberList(Member sch);
	public Member getMember(String nickname);	
	public void UpdateMemberInfo(Member upt);
	public void UpdateProfile(ProfileImg upt);
}
