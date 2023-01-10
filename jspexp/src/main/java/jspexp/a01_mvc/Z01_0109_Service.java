package jspexp.a01_mvc;

import java.util.List;

import com.google.gson.Gson;
import jspexp.a13_database.A06_PareparedDao;
import jspexp.vo.Member;

public class Z01_0109_Service {
	private A06_PareparedDao dao;
	private Member sch;
	
	public Z01_0109_Service(){
		dao = new A06_PareparedDao(); 
	}
	
	public boolean getcheckID(String id) {
		if(id==null) id="";
		return dao.checkId(id);
	}
	
}
