package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Dept;

// springweb.a05_mvc.a03_dao.A02_DeptDao
public interface A02_DeptDao {
	public List<Dept> getDeptList(Dept sch);
	
	public Dept getDept(int deptno);
	
	public void uptDept(Dept upt);
	public void delDept(int deptno);
	//정답
	public void updateDept(Dept upt);
	public void deleteDept(int deptno);
}
