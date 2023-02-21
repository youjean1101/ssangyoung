package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Calendar;
//springweb.a05_mvc.a03_dao.A20_CalendarDao
public interface A20_CalendarDao {
	public List<Calendar> calList();
	
	public List<Calendar> calList2(); // 과제
	
	public void insertCalendar(Calendar ins);
	
	public void uptCalendar(Calendar upt);
	public void delCalendar(int id);
}
