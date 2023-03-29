package fleaMarket.a03_dao;
import java.util.List;
import java.util.Map;

import vo.CapplicationList;
import vo.Criteria;
import vo.guestBookVo;
import vo.irregularReportVo;

public interface CommunitySelectDao {
	//커뮤니티 전체 조회 count / 검색 
	public int getCommunitySelectNum(Criteria cri);
	//인기글 개수 
	public int getBestCommunityListNum(Criteria cri);
	//커뮤니티 목록/검색 페이징 적용 
	public List<CapplicationList> getCommunityList(Criteria cri);
	
	//인기글 처리 
	public List<CapplicationList> getBestCommunityList(Criteria cri);
	
	public List<CapplicationList> getCommunityDetailList(Criteria cri);
	//조회수 업데이트 
	public void updateViewCnt(int communityNumber);
	public String getCommunityImgList(int communityNumber);
	// json 
	public int getFollowYesOrNot(Map<String,Object> map);
	
	public int getInsertFriend(Map<String,String> map);
	
	public int getDeleteFriend(Map<String,String> map);
	//좋아요 // yes or not
	public int getLikeYesOrNot(Map<String,Object> map);
	
	public int getLikeCnt(int communityNumber);
	
	public int getLikeInsert(Map<String,Object> map);
	
	public int getLikeDelete(Map<String,Object> map);
	
	public int deleteBoard(Map<String,Object> map);
	//게시물 신고하기 
	public int insertIrrReport(irregularReportVo vo);
	//중복확인
	public int getCountReport(irregularReportVo vo);
	//관리자 신고목록 가져오기 
	public List<irregularReportVo> getIrrReportList(Criteria cri);
	
	public int getIrrNum(Criteria cri);
	//방명록 조회 
	public List<guestBookVo> guestBookList(Criteria cri);
	
	public int guestBookNum(Criteria cri);
	
	public int insertGuestBook(guestBookVo vo);
	
	public int updateGuestBook(guestBookVo vo);
	
	public int deleteGuestBook(int guestBookid);
	
}
