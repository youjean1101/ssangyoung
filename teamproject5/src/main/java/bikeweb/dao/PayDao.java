package bikeweb.dao;

import java.util.List;

import com.bikeWeb.vo.GetPayVo;
import com.bikeWeb.vo.PayDaySeachVo;
import com.bikeWeb.vo.PayRentalTotVo;
import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

public interface PayDao {
	public void nonUserRentalInfoIns(RentalVo ins);
	public void nonUserPayIns(PayVo ins);
	
	public List<PayRentalTotVo> payHistorySel(PayDaySeachVo sch);
	public List<PayRentalTotVo> returnHistorySel(PayDaySeachVo sch);
	public List<PayRentalTotVo> unpaidChargeSel(String sch);
	
	public void getCardInsert(GetPayVo ins);
	
	public List<PayRentalTotVo> nonuserView(String phonenumber);
}
