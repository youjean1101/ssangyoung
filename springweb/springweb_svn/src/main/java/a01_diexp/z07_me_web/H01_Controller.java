package a01_diexp.z07_me_web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import springweb.z01_vo.Emp;

@Controller
public class H01_Controller {
	@Autowired
	private HW_Service service;
	
	public void showEmpList(Emp sch) {
		for(Emp e:service.getEmpSch(sch)) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\t");
			System.out.print(e.getDeptno()+"\n");
		}
	}
}
