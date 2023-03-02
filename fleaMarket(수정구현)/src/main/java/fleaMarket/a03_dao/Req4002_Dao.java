package fleaMarket.a03_dao;

import vo.BoardImg;
import vo.Capplication;

//fleaMarket.a03_dao.CommunityDao_jyj
public interface Req4002_Dao {
	// 커뮤니티 글 등록
	public void communityInsert(Capplication ins);
	// 커뮤니티 파일 등록
	public void communityFileInsert(BoardImg fIns);
	// 커뮤니티 글 수정
	public void communityUpdate(Capplication ins);
}
