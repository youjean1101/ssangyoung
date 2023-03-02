package fleaMarket.a02_service;

import org.springframework.beans.factory.annotation.Autowired;

import fleaMarket.a03_dao.Req3000_Dao;
import vo.FleaMarket;

public class Req3000_ServiceIns implements Req3000_Service{
	
	private Req3000_Dao dao;
	@Autowired
	public void insertFleaMarket(FleaMarket ins){
    	dao.insertFleaMarket(ins);
    }

}
