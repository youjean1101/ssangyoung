package fleaMarket.a02_service;

import java.util.List;

import vo.Criteria;
import vo.ReplyVo;

public interface CommunityReplyService {
	public int insertReply(ReplyVo vo);
	public int insertReReply(ReplyVo vo);
	public List<ReplyVo> replyList(int communityNumber,Criteria cri);
	public int getReplyCnt(int communityNumber);
	public int updateReply(ReplyVo vo);
	public String deleteReply(ReplyVo vo);
}
