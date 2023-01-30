package a01_diexp.z07_me_web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.z01_vo.Emp;

@Service
public class HW_Service {
	@Autowired
	private Dao dao;
	public List<Emp> getEmpSch(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		
		return dao.getEmpSch(sch);
	}
	
}
