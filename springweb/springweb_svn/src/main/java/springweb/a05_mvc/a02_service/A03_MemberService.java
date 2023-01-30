package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A03_MemberDao;
import springweb.z01_vo.Member;

@Service
public class A03_MemberService {
	@Autowired(required=false)
	private A03_MemberDao dao;
	public List<String> getAuthCom(){
		return dao.getAuthCom();
	}
	public List<Member> getMemberList(Member sch){
		if(sch.getId()==null) sch.setId("");
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		return dao.getMemberList(sch);
	}	
	public Member getMember(String id) {
		return dao.getMember(id);
	}
	public void uptMember(Member upt) {
		dao.uptMember(upt);
	}	
	public void delMember(String id) {
		dao.delMember(id);
	}
	public void insMember(Member ins) {
		dao.insMember(ins);
	}
	
}
