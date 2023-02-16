package springweb.a05_mvc.a02_service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A20_CalendarDao;

@Service
public class A20_CalendarService {
	@Autowired
	A20_CalendarDao dao;
	
	public List<Calendar> calList(){
		return dao.calList();
	}
}
