package a01_diexp.z01_vo;

import java.util.Properties;
import java.util.Set;
// a01_diexp.z01_vo.Bus
public class Bus {
	private Set<String> names;
	private Properties busInfo;

	public Set<String> getNames() {
		return names;
	}
	public void setNames(Set<String> names) {
		this.names = names;
	}
	public Properties getBusInfo() {
		return busInfo;
	}
	
	public void setBusInfo(Properties busInfo) {
		this.busInfo = busInfo;
	}	
	
	
}
