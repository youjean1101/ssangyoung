package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A04_SalgradeDao;
import springweb.z01_vo.Salgrade;

@Service
public class A04_SalgradeService {
	@Autowired(required=false)
	private A04_SalgradeDao dao;
	
	public List<Salgrade> getSalList(){
		return dao.getSalList();
	};
	public Salgrade getSalgrade(int grade) {
		return dao.getSalgrade(grade);
	};
}
