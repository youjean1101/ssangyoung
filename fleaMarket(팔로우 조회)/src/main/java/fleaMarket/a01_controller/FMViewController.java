package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class FMViewController {

	@RequestMapping("fleaMarketView.do")
	public String fleaMarketView() {
		return "fleaMarketView";
	}
}
