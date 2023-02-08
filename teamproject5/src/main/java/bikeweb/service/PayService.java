package bikeweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.PayDaySeachVo;
import com.bikeWeb.vo.PayRentalTotVo;
import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.dao.PayDao;

@Service
public class PayService {
	@Autowired(required = false)
	private PayDao dao;
	// 비회원 렌탈정보 등록
	public void nonUserRentalInfoIns(RentalVo ins) {
		dao.nonUserRentalInfoIns(ins);
	}
	//비회원 결제정보 등록
	public void nonUserPayIns(PayVo ins) {
		dao.nonUserPayIns(ins);
	}
	// 결제내역 출력
	public List<PayRentalTotVo> payHistorySel(PayDaySeachVo sch){
		if(sch.getStartdate()==null) sch.setStartdate("");
		if(sch.getEnddate()==null) sch.setEnddate("");
		if(sch.getId()==null) sch.setId("");
		if(sch.getPayMethod()==null) sch.setPayMethod("");
		
		return dao.payHistorySel(sch);
	}
	// 반환내역 출력
	public List<PayRentalTotVo> returnHistorySel(PayDaySeachVo sch){
		if(sch.getStartdate()==null) sch.setStartdate("");
		if(sch.getEnddate()==null) sch.setEnddate("");
		if(sch.getId()==null) sch.setId("");
		return dao.returnHistorySel(sch);
	}
	// 추가과금 내역 출력
	public List<PayRentalTotVo> unpaidChargeSel(String id){
		return dao.unpaidChargeSel(id);
	}
}
