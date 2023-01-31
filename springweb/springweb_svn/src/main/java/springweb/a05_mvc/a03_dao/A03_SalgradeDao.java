package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Salgrade;
// springweb.a05_mvc.a03_dao.A03_SalgradeDao
public interface A03_SalgradeDao {
	public List<Salgrade> getSalgrade(Salgrade sch);
	public Salgrade getSalgradeSearch(int grade);
}
