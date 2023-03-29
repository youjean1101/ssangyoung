package fleaMarket.a03_dao;
import java.util.List;
import java.util.Map;

import vo.ReplyVo;
public interface ReplyDao {
	//부모 댓글 처리할 메서드 
	public int replyWrite(ReplyVo vo);
	public int replyMax();
	public int replyCheck(ReplyVo vo);
	public int rereplyWrite(ReplyVo vo);
	public List<ReplyVo> replyList(Map<String,Object> map);
	public int getGroupOrder(int groupId);
	public int getReplyCnt(int communityNumber);
	public int updateReply(ReplyVo vo);
	public List<ReplyVo> getRepContent(ReplyVo vo);
	public int getRepCount(ReplyVo vo);
	public int delCount(ReplyVo vo);
	public int delUpdate(ReplyVo vo);
	public int deleteReply(int groupid);
}
