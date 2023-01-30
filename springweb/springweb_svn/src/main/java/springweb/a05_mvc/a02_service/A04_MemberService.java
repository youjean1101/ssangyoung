package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a01_diexp.mybatis.dao3.A01_MemberDao;
import springweb.z01_vo.Member;

@Service
public class A04_MemberService {
	@Autowired
	private A01_MemberDao dao;
	
	public List<Member> getMemberList(Member sch){
		return dao.getMemberList(sch);
	}
}
