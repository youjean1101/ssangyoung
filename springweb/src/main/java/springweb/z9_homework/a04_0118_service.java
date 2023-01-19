package springweb.z9_homework;

import org.springframework.stereotype.Service;

import springweb.z01_vo.Dept;

@Service
public class a04_0118_service {
	public String getDeptNo() {
		return "109";
	}
	public String getDeptDname() {
		return "개발팀";
	}
	public String getDeptLoc() {
		return "서울 홍대";
	}
	
	//정답
	public Dept getDeptInfo() {
		return new Dept(70,"회계","서울");
	}
}
