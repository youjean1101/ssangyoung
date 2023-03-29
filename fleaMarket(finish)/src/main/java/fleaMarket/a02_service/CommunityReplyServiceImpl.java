package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.ReplyDao;
import vo.Criteria;
import vo.ReplyVo;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	private ReplyDao mapper;
	
	
	/**
	 * @param mapper
	 */
	@Autowired
	public CommunityReplyServiceImpl(ReplyDao mapper) {
		super();
		this.mapper = mapper;
	}

    //부모 댓글 등록 하기 
	@Override
	public int insertReply(ReplyVo vo) {
		// TODO Auto-generated method stub
		//GroupID setting
		
		int groupId = mapper.replyMax()+1;
		//새로 등록하기 때문에 max 에서 +1 로직
		vo.setGroupid(groupId);
		int result = mapper.replyWrite(vo);
		return result;
	}
	

	@Override
	public List<ReplyVo> replyList(int communityNumber,Criteria cri) {
		// TODO Auto-generated method stub
		List<ReplyVo> clist = new ArrayList<ReplyVo>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("communityNumber",communityNumber);
		map.put("vo", cri);
		clist = mapper.replyList(map);
		return clist;
	}

	@Override
	public int insertReReply(ReplyVo vo) {
		// TODO Auto-generated method stub
		// groupOrder + 1
		int groupId = vo.getGroupid();
		int groupOrder = mapper.getGroupOrder(groupId)+1;
		vo.setGroupOrderid(groupOrder);
		int result = mapper.rereplyWrite(vo);
		return result;
	}
	@Override
	public int getReplyCnt(int communityNumber) {
		int replyCount = mapper.getReplyCnt(communityNumber);
		return replyCount;
	}
	
	public int updateReply(ReplyVo vo) {
		return mapper.updateReply(vo);
	}

	@Override
	public String deleteReply(ReplyVo vo) {
		// TODO Auto-generated method stub
		
		int groupid = vo.getGroupid();
		// 댓글 그룹 아이디 총 개수 
		int groupTotalCnt = mapper.getRepCount(vo);
		int deleteCnt = mapper.delCount(vo);
		int updateReply = 0;
		int deleteReply = 0;
		String msg = "";
		// 업데이트 처리 
		if(groupTotalCnt!=deleteCnt) {
			updateReply = mapper.delUpdate(vo);
			if(updateReply==1) {
				deleteCnt += 1;
				msg = "삭제완료";
			}
		}
		
		if(groupTotalCnt == deleteCnt) {
			deleteReply = mapper.deleteReply(groupid);
			msg = "삭제완료";
		}
		//checking
		
		
		// groupid 전체가 null 이면 삭제처리 
		
		return msg;
		
		
	}
	
	
	

}
