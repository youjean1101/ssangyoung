package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Member;
//springweb.a05_mvc.a03_dao.A03_MemberDao
public interface A03_MemberDao {
	public List<String> getAuthCom();
	public List<Member> getMemberList(Member sch);
	public Member getMember(String id);
	public void uptMember(Member upt);
	public void delMember(String id);
	public void insMember(Member ins);
}
