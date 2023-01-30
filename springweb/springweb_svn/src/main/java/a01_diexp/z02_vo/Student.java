package a01_diexp.z02_vo;

import java.util.Map;

import org.springframework.stereotype.Component;
// 
@Component
public class Student {
	private Map<String, Integer> records;

	public Map<String, Integer> getRecords() {
		return records;
	}

	public void setRecords(Map<String, Integer> records) {
		this.records = records;
	}
	
}
