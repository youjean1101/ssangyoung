package a01_diexp.z01_vo;

import java.util.Map;
import java.util.Properties;
// a01_diexp.z01_vo.BaseBallTeam 
public class BaseBallTeam {
	private Map<Integer, String> hitOrders;
	private Properties defends;
	public Map<Integer, String> getHitOrders() {
		return hitOrders;
	}
	public void setHitOrders(Map<Integer, String> hitOrders) {
		this.hitOrders = hitOrders;
	}
	public Properties getDefends() {
		return defends;
	}
	public void setDefends(Properties defends) {
		this.defends = defends;
	}
	
}
