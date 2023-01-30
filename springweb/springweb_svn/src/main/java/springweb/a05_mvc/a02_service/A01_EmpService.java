package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A01_EmpDao;
import springweb.z01_vo.Code;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;

@Service
public class A01_EmpService {
	@Autowired(required=false)
	private A01_EmpDao dao;
	
	public List<Emp> getEmpList(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		return dao.getEmpList(sch);
	}
	
	public List<Dept> getDeptComb(){
		return dao.getDeptComb();
	}
	public List<Code> getMgrComb(){
		return dao.getMgrComb();
	}
	public List<String> getJobComb(){
		return dao.getJobComb();
	}
	
	public List<Emp> getEmpjsonView(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		return dao.getEmpjsonView(sch);
	}
	
	
}
