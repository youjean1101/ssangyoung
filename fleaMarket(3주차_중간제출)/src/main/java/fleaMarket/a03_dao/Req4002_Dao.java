package fleaMarket.a03_dao;

import java.util.List;

import vo.BoardImg;
import vo.Capplication;
import vo.FollowMemberInfo;

//fleaMarket.a03_dao.CommunityDao_jyj
public interface Req4002_Dao {
	// 커뮤니티 글 등록
	public void communityInsert(Capplication ins);
	// 커뮤니티 파일 등록
	public void communityFileInsert(BoardImg fIns);
	// 커뮤니티 글 수정
	public void communityUpdate(Capplication ins);
	// 팔로우 조회
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index);
	// 팔로우 취소
	public void followmemberdelete(FollowMemberInfo del);

}
