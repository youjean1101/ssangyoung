package a01_diexp.z08_mydb.vo;

import java.util.List;
//a01_diexp.z08_mydb.vo.Z01__0120_hwDao
public interface Z01__0120_hwDao {
	public int getMaxMgr();
	public String getDeptnoMaxHiredate();
	public int getJobMinSal();
	public int getSalcount();
	public int getQcount();
	
	public List<Emp> getJobMaxSal();
	public List<Dept> getDeptno();
	public List<Emp> getEname();
	public List<Emp> getRecentHiredate();
	public List<Emp> getSalQ();
	
}
