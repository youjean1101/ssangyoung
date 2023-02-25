package fleaMarket.a02_service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req1000_Dao;
import vo.Member;

@Service
public class Req1000_ServiceImp implements Req1000_Service {
	private Req1000_Dao dao;
	@Autowired
	public Req1000_ServiceImp(Req1000_Dao dao) {
		this.dao = dao;
	}
	
	public Member DuplicateEmail(String email) {
		System.out.println("dd:"+email);
		return dao.DuplicateEmail(email);
	}
	public Member DuplicateMem(String name,String personalnumber) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		return dao.DuplicateMem(map);
	}
}
