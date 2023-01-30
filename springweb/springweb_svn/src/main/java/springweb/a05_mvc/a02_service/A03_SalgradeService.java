package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A03_SalgradeDao;
import springweb.z01_vo.Salgrade;

@Service
public class A03_SalgradeService {
	@Autowired(required=false)
	private A03_SalgradeDao dao;
	
	public List<Salgrade> getSalgradeList(Salgrade sch){
		if(sch.getHisal()==0) sch.setHisal(9999);
		return dao.getSalgrade(sch);
	}
}
