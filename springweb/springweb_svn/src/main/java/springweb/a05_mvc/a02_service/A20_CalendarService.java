package springweb.a05_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A20_CalendarDao;
import springweb.z01_vo.Calendar;

@Service
public class A20_CalendarService {
	@Autowired
	A20_CalendarDao dao;
	
	public List<Calendar> calList(){
		return dao.calList();
	}
	
	public List<Calendar> calList2(){
		return dao.calList2();
	}
	
	public void insertCalendar(Calendar ins) {
		dao.insertCalendar(ins);
	}
	
	public void uptCalendar(Calendar upt) {
		dao.uptCalendar(upt);
	}
	public void delCalendar(int id) {
		dao.delCalendar(id);
	}
}
