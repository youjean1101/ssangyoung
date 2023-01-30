package a01_diexp.z01_vo;
import java.util.Properties;
// a01_diexp.z01_vo.Sensor
import java.util.Set;

public class Sensor {
	private Set<String> agent;
	private Properties addInfo; // key/value형식 객체
	public Set<String> getAgent() {
		return agent;
	}
	public void setAgent(Set<String> agent) {
		this.agent = agent;
	}
	public Properties getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(Properties addInfo) {
		this.addInfo = addInfo;
	}
	
	
	
}
