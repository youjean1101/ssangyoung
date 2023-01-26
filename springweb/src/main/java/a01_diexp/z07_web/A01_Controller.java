package a01_diexp.z07_web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import springweb.z01_vo.Emp;
// a01_Controller
@Controller
public class A01_Controller {
	@Autowired
	private A02_Service service;
	
	public void showEmpList(Emp sch) {
		System.out.println("# 사원 정보 조회 #");
		for(Emp e:service.getEmpSch(sch)) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\t");
			System.out.print(e.getDeptno()+"\n");
		}
	}
}
