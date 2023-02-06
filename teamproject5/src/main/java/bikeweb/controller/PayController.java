package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bikeWeb.vo.PayVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.service.PayService;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping("/noneUserMenu.do")
	public String noneUserMenu() {
		return "a40_BuyTicket\\nonUser_Main.jsp";
	}
	
	@PostMapping("/nonUserInsRental.do")
	public String nonUserInsRental(RentalVo rentalins,PayVo payins, Model d){
		service.nonUserPayIns(payins);
		service.nonUserRentalInfoIns(rentalins);
		d.addAttribute("msg","등록성공");
		return "a40_BuyTicket\nonUser_TicketBuy(Ajax).jsp";
	}
	
}
