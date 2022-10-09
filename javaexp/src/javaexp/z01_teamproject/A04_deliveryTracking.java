package javaexp.z01_teamproject;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

public class A04_deliveryTracking {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
	
		
		ProductInfo pro = new ProductInfo("키보드", 30000, "로켓배송", 2);
		System.out.println("## 주문상세 ##");
		System.out.println("배송중:"+pro.getName().length()/3+"개");
		
		LocalDate date = LocalDate.now(); // 오늘날짜 선언
		System.out.print(date+" 주문\t");
		long iOrderNumber = (long)(Math.random()*+1000000000000L); //주문번호 램덤으로 지정
		System.out.println("주문번호 "+iOrderNumber);
		pro.showProInfo();
		System.out.println("[받는사람 정보]");
		System.out.println("---------------------------------------");
		pro.showPayInfo();
		System.out.println("[결제영수증 정보]");
		System.out.println("---------------------------------------");
		System.out.println("해당 주문건에 대해 거래명세서 확인이 가능합니다.");
		while(true) {
			System.out.println("☞ 거래명세서를 보시겠습니까?(Y/N)");
			String sTransactionDetails = sc.nextLine();
			if(sTransactionDetails.toUpperCase().equals("Y")) {
				System.out.println("거래명세서 파일 불러오기 Path");
				break;
				
			}else if(sTransactionDetails.toUpperCase().equals("N")) {
				break;
			}else {
				System.out.println("[안내메시지] Y/N으로 선택해주세요.");
				continue;
			}	
		}
	}
}
class GroupProduct{
	private String sGroupName;
	private ArrayList<ProductInfo> pblist;
	public GroupProduct(String sGroupName) {
		super();
		this.sGroupName = sGroupName;
		this.pblist = new ArrayList<ProductInfo>();
	}
}

class ProductInfo{
		private String sName;
		private int iPrice;
		private String sLocatOnOff;
		private int iCnt;
		private int iTotPay;
		private int iDelivery = 2500;
		private int iCash = 3000;
		Scanner sc2 = new Scanner(System.in);
		
		public ProductInfo(String name, int price, String locatOnOff, int cnt) {
			super();
			this.sName = name;
			this.iPrice = price;
			this.iCnt = cnt;
			this.sLocatOnOff = locatOnOff;
		}
		int idx=0;
		public void showProInfo(){
			while(true) {
				System.out.println("1: 결제완료");
				System.out.println("2: 상품준비중");
				System.out.println("3: 배송시작");
				System.out.println("4: 배송중");
				System.out.println("5: 배송완료");
				System.out.println("☞ 배송현황을 선택해주세요.(택배사)");
				int DeliveryLive = sc2.nextInt();
				switch(DeliveryLive) {
					case 1 :
						System.out.print("결제완료\t");
						break;
					case 2 :
						System.out.print("상품준비중\t");
						break;
					case 3 :
						System.out.print("배송시작\t");
						break;
					case 4 :
						System.out.print("배송중\t");
						break;
					case 5 :
						System.out.print("배송완료\t");
						break;
					default : 
						System.out.println("[안내메시지] 보기안에서 골라주세요.");
						continue;
				}break;
			}
			
			LocalDate date = LocalDate.now(); // 오늘날짜 선언
			System.out.println(date.getYear()+"-"+date.getMonthValue()+"-"+(date.getDayOfMonth()+02)+"도착");
			System.out.print(date+" 주문\t");
			System.out.println("* 상품명: " + this.sName);
			System.out.println("* 가격: " + getPrice()+"원");
			System.out.println("* 수량: " + this.iCnt+"개");
		}
		public void showPayInfo() {
			System.out.println("\n[결제정보]");
			System.out.println("---------------------------------------");
			System.out.println("결제수단: "+"sBank+(+sPayWay+)로 입력받기");
			this.iTotPay = this.iPrice*this.iCnt;
			System.out.println("총상품가격: "+this.iTotPay+"원");
			iTotPay += this.iTotPay;
			System.out.println("배송비: "+this.iDelivery+"원");
			System.out.println("sBank+(+sPayWay+)");
			System.out.println("총 결제금액: "+(this.iTotPay-this.iDelivery)+"원\n");
			System.out.println("[안내메시지]* 결제금액이 출금내역과 다른 경우, 은행에서 이체수수료가 부과된 것 입니다. (해당 은행으로 확인해주세요.))\n");
		}
		public String getName() {
			return sName;
		}
		public void setName(String Name) {
			this.sName = Name;
		}
		public int getPrice() {
			return iPrice;
		}
		public void setiPrice(int price) {
			this.iPrice = price;
		}
		public int getCnt() {
			return iCnt;
		}
		public void setCnt(int cnt) {
			this.iCnt = cnt;
		}
		public void setLocatOnOff(String locatOnOff) {
			this.sLocatOnOff = locatOnOff;
		}
		public int getTotPay() {
			return iTotPay;
		}
	}