package jspexp.a01_mvc;

import java.util.List;

import jspexp.a13_database.A06_PareparedDao;
import jspexp.vo.Dept;

public class A10_Service {
	private A06_PareparedDao dao;
	public A10_Service(){
		dao = new A06_PareparedDao();
	}
	public List<Dept> deptList(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.getDeptList(sch);
	}
}
