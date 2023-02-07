package springweb.a06_util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class A01_DownLoadCtrl {
	///download.do
	
	@GetMapping("/download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		d.addAttribute("downloadFile", fname); 
					//downloadview에 model.get("downloadFile");와 같아야함
		return "downloadViewer";
	}
}
