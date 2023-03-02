package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.CommunitySelectDao;
import vo.CapplicationList;
import vo.Criteria;



@Service
public class CommunitySelectServiceImpl implements CommunitySelectService {
	
	private CommunitySelectDao mapper;	
	/**
	 * @param dao
	 * 생성자 주입 
	 */
	@Autowired
	public CommunitySelectServiceImpl(CommunitySelectDao mapper) {
		this.mapper = mapper;
	}
	// 페이징 처리를 위한 전체 개시물 갯수
	@Override
	public int getCommunitySelectNum(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getCommunitySelectNum(cri);
	}
	// 페이징 쿼리 적용한 게시물 리스트 
	public List<CapplicationList> getCommunityList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getCommunityList(cri);
	}
	
		
}
