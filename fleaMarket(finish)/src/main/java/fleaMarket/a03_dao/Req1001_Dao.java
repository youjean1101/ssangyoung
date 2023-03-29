package fleaMarket.a03_dao;

import java.util.List;

import vo.FApplicationSch;
import vo.FleaMarket;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

public interface Req1001_Dao {
	public int totMemCnt(FApplicationSch sch);
	public List<Member> MemberList(FApplicationSch sch);
	public Member getMember(String nickname);	
	public void UpdateMemberInfo(Member upt);
	public void UpdateProfile(ProfileImg upt);
	public void UpdatePassword(Member upt);
	public Member Login(String email);
	public void DeleteProfile(String email);
	public void DeleteMember(String email);
	public List<FleaMarket> FleaMarketList(FApplicationSch sch);//마이페이지 내가 쓴 플리마켓모집글
	public int totCnt2(FApplicationSch sch);
	public List<QNA> MemberQNAList(FApplicationSch sch);//마이페이지 내가 쓴 문의글
	public int NoAnswerQnaList();//마이페이지 내가 쓴 문의글
	public int totCnt3(FApplicationSch sch);
	public ProfileImg getMemberProfile(String email);
	public List<QNA> QNAListNotics(); //공지사항 전체 조회
	public int totCnt(FApplicationSch sch);
	public List<QNA> QNAList(FApplicationSch sch);//검색한 문의글 조회
	public QNA getQNA(String qnano);	
	public List<QNAFile> getQNAFile(String qnano);
	//public List<QNAFile> getQNAFileList(String filename);
	
	
	
	
	//회원 삭제시 받아올 파일리스트
	//1.문의/공지
	public String DeleteProFileList(String email);
	public List<String> DeleteQnaFileList(String email);
	public List<String> DeleteCommunityFileList(String email);
	public List<String> DeleteFleamarketFileList(String email);
	public List<String> DeleteApplicationFileList(String email);
}
