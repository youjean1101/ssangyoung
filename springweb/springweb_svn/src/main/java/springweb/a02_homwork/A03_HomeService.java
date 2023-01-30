package springweb.a02_homwork;

import org.springframework.stereotype.Service;

import springweb.z01_vo.Dept;

@Service
public class A03_HomeService {
	
	public Dept getDeptInfo() {
		return new Dept(70,"회계","서울");
	}
}

