package fleaMarket.a01_controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.Req3000_Service;
import fleaMarket.util.FileService;
import vo.FFile;
import vo.Faddresss;
import vo.FleaMarket;

@Controller("fleamarket")
public class Req3000_Controller {

	private Req3000_Service service;
//	http://223.26.182.204:7080/fleaMarket/callmain.do
	
	
	@Autowired(required = false)
	public Req3000_Controller(Req3000_Service service) {
		this.service = service;
	}

	// http://localhost:7080/fleaMarket/calendar.do
	@GetMapping("calendar.do")
	public String calendar() {
		return "Calendar";
	}

	// 캘린더
	// http://localhost:7081/fleaMarket/calendarAjax.do
	@RequestMapping("calendarAjax.do")
	public String calendarAjax(Model d) {
		d.addAttribute("callist", service.calList());

		return "pageJsonReport";
	}

	// 파일 업로드
	@Autowired
	private FileService fileservice;

	@Value("${fleamarket.upload3}")
	private String profilepath;
//	http://localhost:7080/fleaMarket/fRegistration.do
//http://223.26.182.204:7080/fleaMarket/fRegistration.do	
	@RequestMapping("fRegistration.do")
	public String fRegistration(Model d, Faddresss ins) {
		d.addAttribute("add", ins.getAddrs0());
		return "FleaMarketRegistration";
	}

	@PostMapping("fleaMarketins.do")
	public String fleaMarketins(FleaMarket ins, RedirectAttributes rttr, List<MultipartFile> pro) {
		// 1. 플리마켓 홍보글 등록
		service.insertFleaMarket(ins);

		// 2. 파일 경로 처리
		if (pro.size() != 0) {

			String msg = service.insertFleaFileModule(pro);

			rttr.addFlashAttribute("msg", msg);
 
		}
		// redirect로는 model를 받아 줄 수 없음 RedirectAttributes 사용을 해야함
		return "redirect:fRegistration.do"; // 조회페이지로 이동
	}

//수정하기	
//http://localhost:7081/fleaMarket/FleaMarketUptPage.do	

	@GetMapping("FleaMarketUptPage.do")
	public String FleaMarketUptPage(@RequestParam String postingNumber, Model d) {
		d.addAttribute("fleamarket", service.fleaDetail(postingNumber));

		return "FleaMarketUpt";
	}

//홍보글 수정하기 
	@RequestMapping("FleaMarketUpt.do")
	public String FleaMarketUpt(@RequestParam("postingNumber") String postingNumber, FleaMarket upt,
			RedirectAttributes redirect, List<MultipartFile> pro) {
		// 업로드 수정
		// 글목록 수정
		service.UptFleaMarket(upt);		
				
		// 파일 삭제
		if (pro.size() != 0 && !pro.get(0).getOriginalFilename().equals("")) {
			// 해당 postingNumber의 여러행을 list처리
			List<FFile> filelist = service.DelFail(postingNumber);
			for (int i = 0; i < filelist.size(); i++) {
				//파일이름
				String sd = filelist.get(i).getFilename();
				//파일경로
				String filepath = filelist.get(i).getFilePath();
				//파일 삭제 처리 서비스
				fileservice.DeleteFile(filepath, sd);			        
			}		    
			//DB에 해당 postingNumber에 해당하는 데이터 삭제
		    service.delFfile(postingNumber);
		    
			//삭제 후 -> 재등록 처리 
			String msg = service.uptFleaFileModule(pro, postingNumber);
		}
		return "redirect:totalSearch.do";
	}
	
//삭제하기	

//삭제버튼 클릭시	
	@RequestMapping("FleaMarketDel.do")
	public String FleaMarketDel(@RequestParam("postingNumber") String postingNumber) {
		// 파일 삭제
		List<FFile> filelist = service.DelFail(postingNumber);

		for (int i = 0; i < filelist.size(); i++) {
			String sd = filelist.get(i).getFilename();
			String filepath = filelist.get(i).getFilePath();
			fileservice.DeleteFile(filepath, sd);
		}
		// 플리마켓 테이블 삭제
		service.delFleaMarket(postingNumber);

		return "redirect:totalSearch.do";
	}

//전체 조회 
//	http://localhost:7030/fleaMarket/totalSearch.do
	@RequestMapping("totalSearch.do")
	public String totalSearch(@ModelAttribute("sch") FleaMarket sch, Model d) {

		// 플리마켓 글 목록을 불러옴.
		List<FleaMarket> flist = service.getFleaMarketList(sch);

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		// 플리마켓의 글갯수만큼 for문
		for (int i = 0; i < flist.size(); i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			// 플리마켓글 하나 하나를 맵에 할당.
			map.put("fno", flist.get(i));
			// 플리마켓 글과 일치하는 filename을 불러와서 담아줌.
			String filename = service.FileNum(flist.get(i).getPostingNumber());
			if (filename == null || filename.equals(null)) {
				filename = "아에없음";
			}
			map.put("fnolist", filename);
			listmap.add(map);
		}

		d.addAttribute("fmap", listmap);

		return "FleaMarketOverallCheck";
	}
	
}
