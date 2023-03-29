package fleaMarket.a03_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vo.ApplicationFile;
import vo.FApplication;
import vo.FApplicationSch;
import vo.FleaMarket;
import vo.Member;

public interface FMViewDao {
	public FleaMarket fmView(String postingNumber);
	public List<String> fmFileView(String postingNumber);
	public int duplicateApp(FApplication sch);
	public void insApp(FApplication ins);
	public void insAppFile(ApplicationFile f);
	public int totCnt(FApplicationSch sch);
	public List<FApplication> appReceivedList(FApplicationSch sch);
	public void updateAppRe(Map<String,String> map);
	public int totCntMy(FApplicationSch sch);
	public List<FApplication> appMyList(FApplicationSch sch);
	public String appFileView(int applicationNo);
	public void delApp(int applicationNo);
	public void uptApp(ApplicationFile upt);
	public String getprofile(String email);
}
