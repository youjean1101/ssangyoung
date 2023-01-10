package jspexp.a01_mvc;

import jspexp.a13_database.A06_PareparedDao;

public class A14_MemberService {
	private A06_PareparedDao dao;
	
	public A14_MemberService(){
		dao = new A06_PareparedDao(); 
	}
	
	public String checkIdJson(String id){
		//boolean ==> 문자열로 형변환
		return ""+dao.checkId(id);
	}
}
