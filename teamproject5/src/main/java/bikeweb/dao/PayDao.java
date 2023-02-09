package bikeweb.dao;

import java.util.List;

import com.bikeWeb.vo.*;

public interface PayDao {
	public void nonUserRentalInfoIns(RentalVo ins);
	public void nonUserPayIns(PayVo ins);
	
	public List<PayRentalTotVo> payHistorySel(PayDaySeachVo sch);
	public List<PayRentalTotVo> returnHistorySel(PayDaySeachVo sch);
	public List<PayRentalTotVo> unpaidChargeSel(String sch);
	
	public void getCardInsert(GetPayVo ins);
	
	public List<PayRentalTotVo> nonuserView(String phonenumber);
	public List<PayRentalTotVo> nonuserUnpaidView(String phonenumber);
	
	public List<RentalOfficeVo> comboRentalOffice();
	public List<BikeInfoVo> comboBike();
	
	public void bikeRentalChange(int no);
	public void userGetCardAdd(String id);
	
	public void userRentalInfoIns(RentalVo ins);
}
