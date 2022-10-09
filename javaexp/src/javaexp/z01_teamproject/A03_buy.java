package javaexp.z01_teamproject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class A03_buy {
	
	public static void pCashReceipt(){
		Scanner sc2 = new Scanner(System.in);
		System.out.println("\n[현금영수증]");
		while(true) {
			System.out.println("☞ 현금영수증 신청하겠습니까?(Y/N)");
			String sCashReceipts = sc2.nextLine();
			if (sCashReceipts.toUpperCase().equals("Y")) {
				System.out.println("[√] 현금영수증 신청");
				while(true) {
					System.out.println("☞ 소득공제/지출증빙 중 선택하세요.");
					String sTax = sc2.nextLine();
					if(sTax.equals("소득공제")){
						System.out.println("[√]소득공제 []지출증빙");
						break;
					}else if(sTax.equals("지출증빙")) {
						System.out.println("[]소득공제 [√]지출증빙");
						break;
					}else {
						System.out.println("[안내메시지]소득공제/지출증빙 중 선택하세요.");
						continue;
					}
				}
				while(true) {
					System.out.println("☞ 휴대폰번호/현금영수증카드를 고르세요.");
					String sPhoneOrCard = sc2.nextLine();
					if(sPhoneOrCard.equals("휴대폰번호")){
						System.out.print("휴대폰 번호: ");
						String sPhoneNumber = sc2.nextLine();					
						break;
					}else if(sPhoneOrCard.equals("현금영수증카드")) {
						System.out.print("현금영수증카드: ");
						String sCashCard = sc2.nextLine();
						break;
					}else {
						System.out.println("[안내메시지]휴대폰번호/현금영수증카드 중 선택하세요.");
						continue;
					}
				}
				System.out.println("* 해외구매대행 / 로켓직구 구매금액은 현금영수증 발행이 제외됩니다.");
				System.out.println("* 쿠팡캐시 결제시 현금성 적립액에 한하여 현금영수증이 발행됩니다.");
				System.out.println("☞ 현금영수증 발급을 위하여 휴대폰번호 또는 현금영수증카드번호를 수집하며, 5년간 처리에 동의합니까?(Y/N)");
				String sCollectionAgree = sc2.nextLine();
				while(true) {
					if(sCollectionAgree.toUpperCase().equals("Y")) {
						System.out.println("[√] 현금영수증 발급을 위하여 휴대폰번호 또는 현금영수증카드번호를 수집하며, 5년간 처리에 동의합니다.");
						break;
						
					}else if(sCollectionAgree.toUpperCase().equals("N")) {
						System.out.println("[] 현금영수증 발급을 위하여 휴대폰번호 또는 현금영수증카드번호를 수집하며, 5년간 처리에 동의합니다.");
						System.out.println("[안내메시지] 동의를 하셔야, 현금영수증 신청이 가능합니다.");
						continue;
					}else {
						System.out.println("[안내메시지] Y/N으로 선택해주세요.");
						continue;
					}	
				}
				break;
			}else if(sCashReceipts.toUpperCase().equals("N")){
				System.out.println("[] 현금영수증 신청");
				break;
			}else {
				System.out.println("[안내메시지] Y/N으로 선택해주세요.");
				continue;
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		String sSEP = "&SEP&";
		String path = "..\\src\\javaexp\\z01_teamproject\\mouse,keyboard.txt";
		File file = new File(path);
		ArrayList<String> listOfLines = new ArrayList<String>();
		String []arrDivision = new String[] {};
		ArrayList<ProductBuy> proArr = new ArrayList<ProductBuy>();
		
		String sPersonInfoPath = "..\\src\\javaexp\\z01_teamproject\\personInfo";
		File fPerInfo = new File(sPersonInfoPath);
		String sReceiveInfoPath = "..\\src\\javaexp\\z01_teamproject\\receiverInfo";
		File  fReceiveInfo= new File(sReceiveInfoPath);
		
		int inputMemo = 0;
		try {
			BufferedReader bufRead = new BufferedReader(new FileReader(file)); // 파일에 내용읽어오기
			
			while((inputMemo = bufRead.read()) != -1) { // 파일읽기가 실패하지 않으면 계속 반복
				String line = bufRead.readLine(); //한줄씩 읽고 선언
				while(line != null) {
					listOfLines.add(line); // 한줄씩 배열에 추가
					line = bufRead.readLine(); // 연속
				}
			}
			System.out.println("# 카테고리별 상품 리스트 #");
			for(int idx=2;idx<listOfLines.size();idx++) { 
				System.out.println((idx-1)+":"+listOfLines.get(idx));
			}	// listOfLines 배열데이터 출력
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			System.out.println();
			while(true) {
				System.out.println("☞ 다음 중 무슨 상품 구매하시겠습니까?(번호로 입력)");																	
				int viewProduct = sc.nextInt();
				sc.nextLine(); //입력버퍼 비우기(int 다음으로 String으로 입력받으면,입력되어있는 정수를 문자로 가져와서 다음 String 입력시 입력을 안받고 넘어가버려서 비워줘야함. )
				if(viewProduct<=(listOfLines.size()-2)) {
					String sProductInfo = listOfLines.get(viewProduct+1); //입력받은 데이터 배열에 넣고 선언
					arrDivision = sProductInfo.split(sSEP); // 한줄에 구분자를 넣어 배열넣기
					break;
				}else {
					System.out.println("[안내메시지] 리스트에 있는 상품을 골라주세요.");
					continue;
				}	
			}
			
		}catch(InputMismatchException e) { // 정수를 입력해야할 곳에 문자열을 입력하여 발생하는 에러
			System.out.println("[System Error] 상품을 숫자로 입력해주세요.");
		}		
		
		try {
			System.out.println("☞ 구매할 상품의 개수를 입력하세요.");
			int cnt = sc.nextInt();
			sc.nextLine();
			for(int i=0;i<arrDivision.length;i+=3) {
				String s1 = arrDivision[i];
				String s2 = arrDivision[i+1];
				String s3 = arrDivision[i+2];
				Integer n2 = Integer.parseInt(s2); //wrapper 사용
				proArr.add(new ProductBuy(s1,n2,s3, cnt)); 
			} 
			BufferedReader perbufRead = new BufferedReader(new FileReader(fPerInfo));
			String perInfoRead;
			while((perInfoRead = perbufRead.readLine()) != null) {
				System.out.println(perInfoRead);
			}
			
			}catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("[System Error] 해당상품은 존재하지 않습니다.");
				
			}catch (InputMismatchException e) {
				System.out.println("[System Error] 숫자로 입력해주세요.");
				
			}catch (IOException e) {
				;
			}
		
		try {
		while(true) {
			System.out.println("☞ 받는사람정보를 변경하시겠습니까?(Y/N)");
			String sReceiveInfoChange = sc.nextLine();
					
			if(sReceiveInfoChange.toUpperCase().equals("Y")) {
				System.out.print("☞ 받는사람의 이름: ");
				String sReceiveName = sc.nextLine();
				System.out.print("☞ 받는사람의 배송주소: ");
				String sReceiveAddress = sc.nextLine();
				System.out.print("☞ 받는사람의 연락처: ");
				String sReceivePhonNumber = sc.nextLine();
				System.out.print("☞ 받는사람의 배송 요청사항: ");
				String sReceiveRequests= sc.nextLine();
				
				System.out.println("[받는사람정보]");
				System.out.println("이름: "+sReceiveName);
				System.out.println("배송주소: "+sReceiveAddress);
				System.out.println("연락처: "+sReceivePhonNumber);
				System.out.println("배송 요청사항: "+sReceiveRequests);
				System.out.println("√ 주말 및 공휴일 수령 가능\n");
				break;
				
			}else if(sReceiveInfoChange.toUpperCase().equals("N")){
				BufferedReader recBufRead = new BufferedReader(new FileReader(fReceiveInfo));
				String sReceiveInfoRead;
				while((sReceiveInfoRead = recBufRead.readLine()) != null) {
					System.out.println(sReceiveInfoRead);					
				}
				break;
				
			}else {
				System.out.println("[안내메시지]Y/N으로 입력해주세요.");
				continue;
			}
		}
		}catch (IOException e) {
			;
		}
			
		ProductBuy pb = new ProductBuy("키보드", 30000, "로켓배송", 3);
		pb.showProInfo();
		
		System.out.println("\n☞ 결제방법을 고르세요.");
		System.out.println("0:계좌이체");
		System.out.println("1:쿠페이 머니『최대 캐시적립』");
		System.out.println("2:신용/체크카드");
		System.out.println("3:법인카드");
		System.out.println("4:휴대폰");
		System.out.println("5:무통장입금(가상계좌)");
		int iPayWay = sc.nextInt();
		sc.nextLine();
		switch (iPayWay) { 
		case 0 :
			System.out.println("결제방법: 계좌이체");
			System.out.print("☞ 은행선택: ");
			String sBankChoice = sc.nextLine();
			pCashReceipt();
			break;
			
		case 1 :
			System.out.println("결제방법: 쿠페이 머니");
			System.out.println("잔액 : 0원");
			System.out.println("[안내메시지] * 잔액이 부족할 경우, 결제 진행 시에 충전됩니다.");
			break;
			
		case 2 :
			System.out.println("결제방법: 신용/체크카드");
			System.out.print("☞ 카드선택: ");
			String sCardChoice = sc.nextLine();
			while(true) {
				System.out.println("결제자님의 명의카드입니까?(Y/N)");
				String sNameCard = sc.nextLine();
				if(sNameCard.toUpperCase().equals("Y")) {
					System.out.println("[√] 결제자님 명의카드");
					break;
					
				}else if(sNameCard.toUpperCase().equals("N")){
					System.out.println("[] 결제자님 명의카드");
					break;
					
				}else {
					System.out.println("[안내메시지] Y/N으로 선택해주세요.");
					continue;
				}
			}
			while(true) {				
				System.out.print("☞ 할부기간(0~24개월): ");
				int iInstallment = sc.nextInt();
				if(iInstallment>=0 && iInstallment<=24){
					break;
				}else {
					System.out.println("[안내메시지] 할부는 25개월이상 할 수 없습니다.");
					continue;
				}
			}
			System.out.println("[안내메시지] * 할부는 50,000원 이상만 가능합니다.");
			sc.nextLine();
			
			break;
			
		case 3 :
			System.out.println("결제방법: 법인카드");
			System.out.print("☞ 카드선택: ");
			String sCompanyCardChoice = sc.nextLine();
			System.out.println("[안내메시지]할부기간 : 법인카드는 일시불 결제만 가능합니다.");
			break;
			
		case 4 :
			System.out.println("결제방법: 휴대폰");
			System.out.print("☞ 통신사 종류(SKT/KT/헬로모바일/KCT):");
			String sTelecom = sc.nextLine();
			
			while(true) {
				System.out.println("선택한 결제수단 및 휴대폰번호로 향후 결제 이용에 동의합니까(Y/N)?");
				String sAgree = sc.nextLine();
				if(sAgree.toUpperCase().equals("Y")) {
					System.out.println("[√] 선택한 결제수단 및 휴대폰번호로 향후 결제 이용에 동의합니다.(선택)");
					break;
					
				}else if(sAgree.toUpperCase().equals("N")) {
					System.out.println("[] 선택한 결제수단 및 휴대폰번호로 향후 결제 이용에 동의합니다.(선택)");
					break;
				}else {
					System.out.println("[안내메시지]Y/N으로 입력해주세요.");
					continue;
				}
			}
			break;
			
		case 5 :
			System.out.println("결제방법: 무통장입금(가상계좌)");
			System.out.print("입금은행: ");
			String sSendBank = sc.nextLine();
			LocalDate now = LocalDate.now(); //현재시간선언
			System.out.println("입금기한:"+now+" 24시까지");
			System.out.println("[안내메시지] * 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.");
			System.out.println("[안내메시지] 무통장입금 시 유의사항");
			System.out.println("· 입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.");
			System.out.println("· 무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.");
			System.out.println("· 은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.");
			pCashReceipt(); // 현금영수증 함수로 선언
			break;
		default : 
			System.out.println("[안내메시지]잘못 입력했습니다.");
		}
				
		while(true) {
			System.out.println("구매조건 확인 및 결제대행 서비스 [약관]을 보시겠습니까?(Y/N)");
			String sTermsOfService = sc.nextLine();
			
			String pathTermsOfService = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_teamproject\\termsOfSevice";
		
			try {
				if(sTermsOfService .toUpperCase().equals("Y")) {
					BufferedReader tosbufRead = new BufferedReader(new FileReader(pathTermsOfService));
					String sTOSRead;
					while((sTOSRead = tosbufRead.readLine()) != null) {
						System.out.println(sTOSRead);
					}
					break;
				}else if(sTermsOfService .toUpperCase().equals("N")){
					break;
					
				}else {
					System.out.println("[안내메시지]Y/N으로 입력해주세요.");
					continue;
				}
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("☞ 상품을 구매하시겠습니까?(Y/N)");
		String buyQue = sc.nextLine();
		if(buyQue.toUpperCase().equals("Y")) {
			System.out.println("[안내메시지] 구매가 완료되었습니다.");
		}else if(buyQue.toUpperCase().equals("N")){
			System.out.println("[안내메시지] 구매가 취소되었습니다.");
		}else {
			System.out.println("[안내메시지]Y/N으로 입력해주세요.");
		}
	}		
}


class ProductBuy{
	private String sName;
	private int iPrice;
	private String sLocatOnOff;
	private int iCnt;
	private int iTotPay;
	private ArrayList<ProductBuy> pblist;
	private int iDelivery = 2500;
	private int iCash = 3000;
	
	public ProductBuy(String name, int price, String locatOnOff, int cnt) {
		super();
		this.sName = name;
		this.iPrice = price;
		this.iCnt = cnt;
		this.sLocatOnOff = locatOnOff;
		this.pblist = new ArrayList<ProductBuy>();
	}
	int idx=0;
	public void showProInfo(){
		System.out.println("[배송 "+(this.sName.length()/3)+"건 중 "+ ++idx+"]");
		LocalDate date = LocalDate.now(); // 오늘날짜 선언
		System.out.println(date+" 도착 보장");
		System.out.println("* 상품명: " + this.sName);
		System.out.println("* 로켓배송 O/X: " + getLocatOnOff());
		System.out.println("* 가격: " + getPrice()+"원");
		System.out.println("* 수량: " + this.iCnt+"개");
	}
	public void showPayInfo() {
		System.out.println("\n[결제정보]");
		this.iTotPay = this.iPrice*this.iCnt;
		System.out.println("총상품가격: "+this.iTotPay+"원");
		iTotPay += this.iTotPay;
		System.out.println("할인쿠폰: 0원");
		System.out.println("배송비: "+this.iDelivery+"원");
		System.out.println("쿠팡캐시: "+this.iCash+"P");
		System.out.println("총 결제금액: "+(this.iTotPay-this.iDelivery-this.iCash)+"원\n");
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
	public String getLocatOnOff() {
		if(!this.sLocatOnOff.contains("로켓배송")) { // "로켓배송"이 들어간 문자열
			return "X";
		}else {
			return "O";
		}
	}
	public void setLocatOnOff(String locatOnOff) {
		this.sLocatOnOff = locatOnOff;
	}
	public int getTotPay() {
		return iTotPay;
	}
}
