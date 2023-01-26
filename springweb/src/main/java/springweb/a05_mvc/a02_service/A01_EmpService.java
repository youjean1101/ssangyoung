package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A01_EmpDao;
import springweb.z01_vo.Emp;

@Service
public class A01_EmpService {
	
	@Autowired
	private A01_EmpDao dao;
	public List<Emp> getEmpList(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		return dao.getEmpList(sch);
	}
}
