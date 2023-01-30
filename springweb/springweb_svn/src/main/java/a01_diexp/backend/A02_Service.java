package a01_diexp.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Member;

@Service
public class A02_Service {
	@Autowired
	private A03_Dao dao;
	public List<Dept> getDeptList(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.getDeptList(sch);
	}
	public List<Member> getMemberList(Member sch){
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		return dao.getMemberList(sch);
	}
	public Member login(Member m) {
		if(m.getId()==null) m.setId("");
		if(m.getPass()==null) m.setPass("");
		return dao.login(m);
	}
}
