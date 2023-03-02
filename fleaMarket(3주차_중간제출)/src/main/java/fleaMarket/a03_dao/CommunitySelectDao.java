package fleaMarket.a03_dao;
import java.util.List;

import vo.CapplicationList;
import vo.Criteria;

public interface CommunitySelectDao {
	//커뮤니티 전체 조회 count / 검색 
	public int getCommunitySelectNum(Criteria cri);
	
	//커뮤니티 목록/검색 페이징 적용 
	public List<CapplicationList> getCommunityList(Criteria cri);
	
}
