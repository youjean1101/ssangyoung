package fleaMarket.util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownLoadCtrl {

	
	@GetMapping("/download.do")
	public String download(@RequestParam("fname") String fname,Model d) {
		d.addAttribute("downloadFile",fname);
		return "downloadViewer";
	}
	

}
