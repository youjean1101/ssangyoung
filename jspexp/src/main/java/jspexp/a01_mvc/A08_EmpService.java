package jspexp.a01_mvc;

import java.util.List;

import jspexp.a13_database.A02_EmpDao;
import jspexp.vo.Emp;
// 주요 핵심 로직 처리 후, 모델로 사용할 핵심 데이터를 리턴
public class A08_EmpService {
	private A02_EmpDao dao;
	private Emp sch;
	public A08_EmpService() {
		dao = new A02_EmpDao();
	}
	public Emp getEmp(String ename, String job,String frSalS, String toSalS) {
		if(ename==null) ename="";
		if(job==null) job="";
		if(frSalS==null || frSalS.equals("")) frSalS = "0";
		if(toSalS==null || toSalS.equals("")) toSalS = "9999";
		double frSal = Double.parseDouble(frSalS);
		double toSal = Double.parseDouble(toSalS);
		sch = new Emp(ename,job,frSal,toSal);
		return sch;
	}
	public List<Emp> empList(){
		return dao.getEmpSch(sch);
	}
	public List<Emp> empList(String ename, String job,String frSalS, String toSalS){
		if(frSalS==null || frSalS.equals("")) frSalS = "0";
		if(toSalS==null || toSalS.equals("")) toSalS = "0";
		int frSal = Integer.parseInt(frSalS);
		int toSal = Integer.parseInt(toSalS);
		Emp sch = new Emp(ename,job,frSal,toSal);
		return dao.getEmpSch(sch);
	}
	public List<Emp> empList(Emp sch){
		// 알고리즘, 로직 처리..초기값 설정
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		if(sch.getToSal()==0) sch.setToSal(9999);
		return dao.getEmpSch(sch);
	}
}
