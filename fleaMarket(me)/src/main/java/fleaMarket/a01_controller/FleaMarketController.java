package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class FleaMarketController {

//http://localhost:7030/fleaMarket/fRegistration.do
	@RequestMapping("fRegistration.do")
	public String fRegistration() {
	
		return "FleaMarketRegistration";
	}
}
