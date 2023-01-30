package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Code;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
// springweb.a05_mvc.a03_dao.A01_EmpDao
public interface A01_EmpDao {
	public List<Emp> getEmpList(Emp sch);
	
	public List<Dept> getDeptComb();
	public List<Code> getMgrComb();
	public List<String> getJobComb();
	
	public List<Emp> getEmpjsonView(Emp sch);
	
}
