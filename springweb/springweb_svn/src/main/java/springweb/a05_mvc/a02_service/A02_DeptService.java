package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A02_DeptDao;
import springweb.z01_vo.Dept;

@Service
public class A02_DeptService {
	// required = false : 컨테이너에 해당 객체가 null이더라도 에러가
	// 발생하지 않게 해주는 옵션.
	@Autowired(required = false)
	private A02_DeptDao dao;
	
	public List<Dept> getDeptList(Dept sch){
		// 초기화면에 요청값이 없더라도 sql로 전체 검색이 가능하게..
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		
		return dao.getDeptList(sch);
	}
}
