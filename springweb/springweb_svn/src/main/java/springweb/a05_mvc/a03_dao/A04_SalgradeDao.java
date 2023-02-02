package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Salgrade;

public interface A04_SalgradeDao {
	public List<Salgrade> getSalList();
	public Salgrade getSalgrade(int grade);
}
