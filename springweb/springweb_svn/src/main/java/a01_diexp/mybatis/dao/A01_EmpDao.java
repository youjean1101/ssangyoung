package a01_diexp.mybatis.dao;

import java.util.List;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.EmpDept;
import springweb.z01_vo.EmpDeptCom;
import springweb.z01_vo.EmpGrade;

public interface A01_EmpDao {
	public List<Emp> getEmpList(Emp sch);
	public int empCount();
	public double empMaxSal();
	public String getEname();
	
	public double getMaxSalByDept();
	public int getMaxMgr();
	public String getJobByEname();
	public Emp getEmpByEmpno();
	public Emp getEmpByEname();
	// 과제
	public Dept getDeptByDeptno();
	public Emp getInitHire();
	public Emp getMaxSalByTerms();
	
	public List<EmpDept> getEmpDeptList();
	public List<EmpDeptCom> getEmpDeptList2();
	public List<EmpGrade> getEmpSalGrade();
}
