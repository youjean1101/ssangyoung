package springweb.a04_di_last;

import org.springframework.stereotype.Service;

@Service
public class A02_DIService {
	public String getCheck() {
		return "주입이 되었네요^^";
	}
}
