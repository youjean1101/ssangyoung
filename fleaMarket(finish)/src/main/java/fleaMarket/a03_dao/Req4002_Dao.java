package fleaMarket.a03_dao;

import java.util.List;
import java.util.Map;

import vo.BoardImg;
import vo.Criteria;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.RoomMemberInfo;

//fleaMarket.a03_dao.CommunityDao_jyj
public interface Req4002_Dao {
	// 커뮤니티 글 등록
	public void communityInsert(Capplication ins);
	// 커뮤니티 파일 등록
	public void communityFileInsert(BoardImg fIns);
	// 커뮤니티 글 수정시 불러올 게시글 정보
	public Capplication boardDetailSelect(int sel);
	// 커뮤니티 글 수정
	public void communityUpdate(Capplication upt);
	// 커뮤니티 파일 수정
	public void communityFileUpdate(BoardImg fupt);
	// 팔로우 조회
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index);
	// 팔로우 페이징 처리 조회
	public List<FollowMemberInfo> followerSelectPage(Criteria cri);
	// 팔로우 조회
	public int followCheck(Map<String, String> map);
	// 팔로우 취소
	public void followmemberdelete(FollowMemberInfo del);
	// 룸회원 좋아요 갯수 조회
	public int boardLikeCnt(String email);
	// 룸회원 정보 조회
	public List<RoomMemberInfo> roomMemberInfo(Map<String, String> map);
	// 룸회원 댓글 조회
	public List<RoomMemberInfo> boardReplySelect(Map<String, String> map);
	// 커뮤니티 조회(전체, 카테고리별)
	public List<RoomMemberInfo> boardSelect(RoomMemberInfo sel);
	// 팔로우 등록
	public void insertFriend(Map<String, String> map);
}
