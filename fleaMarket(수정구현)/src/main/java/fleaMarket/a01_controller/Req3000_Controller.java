package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller("fleamarket")
public class Req3000_Controller {

//http://localhost:7030/fleaMarket/fRegistration.do
	@RequestMapping("fRegistration.do")
	public String fRegistration() {
	
		return "FleaMarketRegistration";
	}
	
	@RequestMapping("fileupload.do")
	public String fileupload(@RequestParam("filePath") MultipartFile profile) {
		System.out.println("getName:"+profile.getName());
		System.out.println("getOriginal:"+profile.getOriginalFilename());
		System.out.println("toString:"+profile.toString());

		//redirect:fRegistration.do
		return "redirect:fRegistration.do";
	}
}
