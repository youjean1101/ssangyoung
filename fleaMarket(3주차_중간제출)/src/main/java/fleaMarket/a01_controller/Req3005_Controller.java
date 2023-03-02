package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Req3005_Controller {

//	http://localhost:7030/fleaMarket/totalSearch.do
		@RequestMapping("totalSearch.do")
		public String totalSearch() {
		
			return "FleaMarketOverallCheck";
		}
}
