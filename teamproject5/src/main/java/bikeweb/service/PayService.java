package bikeweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.BikeInfoVo;
import com.bikeWeb.vo.GetPayVo;
import com.bikeWeb.vo.PayDaySeachVo;
import com.bikeWeb.vo.PayRentalTotVo;
import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalOfficeVo;
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
	
	public void getCardInsert(GetPayVo ins) {
		if(ins.getCardno()==null) ins.setCardno("");
		if(ins.getValidity()==null) ins.setValidity("");
		if(ins.getCardkind()==null) ins.setCardkind("");
		if(ins.getEmail()==null) ins.setEmail("");
		if(ins.getPhonenumber()==null) ins.setPhonenumber("");
		if(ins.getRrn()==null) ins.setRrn("");
		dao.getCardInsert(ins);
	}
	public List<PayRentalTotVo> nonuserView(String phonenumber){
		return dao.nonuserView(phonenumber);
	}
	public List<PayRentalTotVo> nonuserUnpaidView(String phonenumber){
		return dao.nonuserUnpaidView(phonenumber);
	}
	
	public List<RentalOfficeVo> comboRentalOffice(){
		return dao.comboRentalOffice();
	}
	public List<BikeInfoVo> comboBike(){
		return dao.comboBike();
	}
	public void bikeRentalChange(int no) {
		dao.bikeRentalChange(no);
	}
	//회원 카드 등록
	public void userGetCardAdd(String id) {
		dao.userGetCardAdd(id);
	}
	public void userRentalInfoIns(RentalVo ins) {
		dao.userRentalInfoIns(ins);
	}
}
