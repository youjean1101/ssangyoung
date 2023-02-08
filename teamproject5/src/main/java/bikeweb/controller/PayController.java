package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.PayDaySeachVo;
import com.bikeWeb.vo.PayRentalTotVo;
import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.service.PayService;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	// 비회원 결제 등록
	@RequestMapping("/noneUserMenu.do")
	public String noneUserMenu() {
		return "a40_BuyTicket\\nonUser_Main.jsp";
	}
	
	@PostMapping("/nonUserInsRental.do")
	public String nonUserInsRental(RentalVo rentalins,PayVo payins, Model d){
		service.nonUserPayIns(payins);
		service.nonUserRentalInfoIns(rentalins);
		d.addAttribute("msg","등록성공");
		return "a40_BuyTicket\\nonUser_TicketBuy(Ajax).jsp";
	}
	//결제내역
	@RequestMapping("/payhistoryList.do")
	public String payhistoryList() {
		return "a41_PayManager\\payHistory.jsp";
	}
	
	@RequestMapping("/payHistorySeach.do")
	public String payHistorySeach(@ModelAttribute("sch") PayDaySeachVo sch,Model d) {
		//System.out.println(service.payHistorySel(sch));
		d.addAttribute("msg","등록성공");
		d.addAttribute("paylist", service.payHistorySel(sch));
		return "/payhistoryList.do";
	}
		
	// 반환내역
	@RequestMapping("/returnList.do")
	public String returnList() {
		return "a41_PayManager\\returnHistory.jsp";
	}
	
	@RequestMapping("/returnHistorySeach.do")
	public String returnHistorySeach(@ModelAttribute("sch") PayDaySeachVo sch,Model d) {
		for(PayRentalTotVo p:service.returnHistorySel(sch)) {
			System.out.print(p.getTicketKind()+"\t");
		}
		System.out.println(service.returnHistorySel(sch));
		d.addAttribute("returnlist", service.returnHistorySel(sch));
		return "/returnList.do";
	}
	
	//추과과금내역
	@RequestMapping("/unpaidHistoryList.do")
	public String unpaidhistoryList() {
		return "a41_PayManager\\user_UnpaidChargePay.jsp";
	}
	
	@RequestMapping("/unpaidHistorySeach.do")
	public String unpaidHistorySeach(@RequestParam("id") String id,Model d) {
		System.out.println(service.unpaidChargeSel(id));
		d.addAttribute("unpaidlist", service.unpaidChargeSel(id));
		return "/unpaidHistoryList.do";
	}
}
