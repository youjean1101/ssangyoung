package fleaMarket.a02_service;

import java.util.List;

import org.springframework.stereotype.Service;

import vo.CapplicationList;
import vo.Criteria;

@Service
public interface CommunitySelectService {
	//조회 처리 
	//커뮤니티 게시물 개수(전체)
	 public int getCommunitySelectNum(Criteria cri);
	 
	 public List<CapplicationList> getCommunityList(Criteria cri);
	 
}
