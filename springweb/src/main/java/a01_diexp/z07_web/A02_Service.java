package a01_diexp.z07_web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.z01_vo.Emp;

@Service
public class A02_Service {
	@Autowired
	private A03_Dao dao;
	public List<Emp> getEmpSch(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		
		return dao.getEmpSch(sch); 
	}
}
