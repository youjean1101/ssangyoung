package bikeweb.dao;

import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

public interface PayDao {
	public void nonUserRentalInfoIns(RentalVo ins);
	public void nonUserPayIns(PayVo ins);
}
