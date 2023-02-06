package bikeweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.dao.PayDao;

@Service
public class PayService {
	@Autowired(required = false)
	private PayDao dao;
	
	public void nonUserRentalInfoIns(RentalVo ins) {
		dao.nonUserRentalInfoIns(ins);
	}
	public void nonUserPayIns(PayVo ins) {
		dao.nonUserPayIns(ins);
	}
}
