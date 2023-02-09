package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.GetPayVo;
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
	// 비회원 결제 입력란 페이지
	@RequestMapping("/noneUserRentalGo.do")
	public String noneUserRentalGo(Model d) {
		d.addAttribute("bikeList", service.comboBike());// 자전거 콤보박스
		d.addAttribute("officList", service.comboRentalOffice()); // 대여장소 콤보박스
		return "a40_BuyTicket\\nonUser_TicketBuy.jsp";
	}
	// 비회원 결제하기
	@RequestMapping("/nonUserInsRental.do")
	public String nonUserInsRental(RentalVo rentalins,PayVo payins, Model d){
		service.bikeRentalChange(rentalins.getBikeNo());
		service.nonUserPayIns(payins);
		service.nonUserRentalInfoIns(rentalins);
		d.addAttribute("msg","등록성공");
		return "/noneUserRentalGo.do";
	}
	// 비회원 대여조회(전화번호 넘기기)
	@RequestMapping("/noneUserInputView.do")
	public String noneUserRentalView(@RequestParam("phonenumber") String phonenumber,Model d) {
		d.addAttribute("nonUserRentalList", service.nonuserView(phonenumber));
		return "a40_BuyTicket\\noneUser_TicketView.jsp";
	}
	// 비회원 미납요금 조회
	@RequestMapping("/noneUserUnpaidView.do")
	public String noneUserUnpaidView(@RequestParam("phonenumber") String phonenumber,Model d) {
		d.addAttribute("nonUserUnpaidList", service.nonuserUnpaidView(phonenumber));
		return "a40_BuyTicket\\nonUser_UnpaidChargeView.jsp";
	}
	// 결제내역
	@RequestMapping("/payhistoryList.do")
	public String payhistoryList() {
		return "a41_PayManager\\payHistory.jsp";
	}
	
	@RequestMapping("/payHistorySeach.do")
	public String payHistorySeach(@ModelAttribute("sch") PayDaySeachVo sch,Model d) {
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
			System.out.print(p.getReturnTime()+"\t");
		}
		System.out.println(service.returnHistorySel(sch));
		d.addAttribute("returnlist", service.returnHistorySel(sch));
		return "/returnList.do";
	}
	
	//추과과금내역
	@RequestMapping("/unpaidHistoryList.do")
	public String unpaidhistoryList(@RequestParam("id") String id,Model d) {
		d.addAttribute("unpaidlist", service.unpaidChargeSel(id));
		return "a41_PayManager\\user_UnpaidChargePay.jsp";
	}
	// 등록수단 추가
	@RequestMapping("/getpayInsert.do")
	public String getpayInsert(@RequestParam("id") String id,GetPayVo ins,Model d) {
		service.getCardInsert(ins);
		service.userGetCardAdd(id);
		d.addAttribute("msg", "등록완료");
		return "a41_PayManager\\getPayMethod.jsp";
	}
	//회원 결제하기
	@RequestMapping("/userRentalGo.do")
	public String userRentalGo(Model d) {
		d.addAttribute("bikeList", service.comboBike());
		d.addAttribute("officList", service.comboRentalOffice());
		return "a40_BuyTicket\\User_TicketBuy.jsp";
	}
	@RequestMapping("/userRentalInsert.do")
	public String userRentalInsert(RentalVo rentalins,PayVo payins, Model d) {
		service.bikeRentalChange(rentalins.getBikeNo());
		service.nonUserPayIns(payins);
		service.userRentalInfoIns(rentalins);
		d.addAttribute("msg", "등록완료");
		return "/userRentalGo.do";
	}
}
