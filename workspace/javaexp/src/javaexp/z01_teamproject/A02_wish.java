package javaexp.z01_teamproject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class A02_wish {

		static Scanner sc = new Scanner(System.in);
		// 구분자(&SEP&)
		static String sSEP = "&SEP&";
		static String path = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_teamproject1\\mouse,keyboard.txt";
		static File file = new File(path);
		static ArrayList<String> listOfLines = new ArrayList<String>();
		static String []arrDivision = new String[] {};
		static Wish commonDelivery = new Wish("상품");
		static Wish regularDelivery= new Wish("브랜드");
		
		public static void addBlist(){
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
			
			while(true) {
				try {
					System.out.println();
					System.out.println("☞ 다음 중 무슨 상품을 보겠습니까?");
																						
					int viewProduct = sc.nextInt();
					sc.nextLine(); //스캐너 비우기(다음스캐너 떄 영향이 적음)
					String sProductInfo = listOfLines.get(viewProduct+1); //입력받은 데이터 배열에 넣고 선언
					
					arrDivision = sProductInfo.split(sSEP); // 한줄에 구분자를 넣어 배열넣기
					
				}catch(InputMismatchException e) {
					System.out.println("[System Error] 상품을 숫자로 입력해주세요.");
				}catch(IndexOutOfBoundsException e) {
					System.out.println("[System Error] 해당상품은 존재하지 않습니다.");
				}
				
				try {
					while(true) {
						System.out.println("☞ 해당상품을 찜하시겠습니까?(Y/N)");
						String sInOutBasket = sc.nextLine();
						
						if(sInOutBasket.toUpperCase().equals("Y") ) { //toUpperCase() : 대문자 변환
							for(int i=0;i<=arrDivision.length;i+=3) {
								String s1 = arrDivision[i];
								String s2 = arrDivision[i+1];
								String s3 = arrDivision[i+2];
								Integer n2 = Integer.parseInt(s2); //wrapper 사용
								commonDelivery.addBucketPro(new ProductWish(s1,n2,s3)); 
							} 
								break;
							
						} else if(sInOutBasket.toUpperCase().equals("N")){
								System.out.println("[안내메시지]뒤로가기");
								break;
						} else {
							System.out.println("[System Error] 잘못된 입력입니다.");
							continue;
						}
					}
				} catch(ArrayIndexOutOfBoundsException e) {
					; //구분을위해(의미X)
				}
				System.out.println("☞ 상품을 더 찜하시겠습니까?(Y/N)");
				String sAddRow = sc.nextLine();
				if(!sAddRow.toUpperCase().equals("Y")) {
					break;
				}
			}
		}
		
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			
			while(true) {
				System.out.println("☞ 메뉴를 선택해주세요.");
				System.out.println("0: 찜(♥/♡) 조회");
				System.out.println("1: 찜(♥/♡) 추가");
				System.out.println("2: 찜(♥/♡) 삭제");
				int menu = sc.nextInt();
				
				switch (menu) {
				case 0: 
					System.out.println("[안내메시지]찜 상품을 조회합니다."); 
					System.out.println("# 찜(♥/♡) 리스트 #");
					commonDelivery.showBucketProAll();
					break;
				case 1: 
					System.out.println("[안내메시지]찜 상품을 추가합니다."); 
					addBlist(); //함수추가
					break;
				case 2:
					System.out.println("[안내메시지]찜 상품을 삭제합니다.");
					System.out.println("☞ 삭제하고 싶은 상품을 상품번호로 입력하세요.");
					int removeNum = sc.nextInt() - 1;
					commonDelivery.removeBucketPro(removeNum);
					commonDelivery.showBucketProAll();
					break;
				default : 
					System.out.println("[안내메시지]잘못 입력했습니다.");
					break;
				}
			}
		}
	}
class Wish{
		private String sBucketName;
		private ArrayList<ProductWish> blist; 
		public Wish(String sBucketName) {
			super();
			this.sBucketName = sBucketName;
			this.blist = new ArrayList<ProductWish>();
		}

		public void addBucketPro(ProductWish p) {
			this.blist.add(p);
			System.out.println("[안내메시지]\""+p.getName()+"\" 상품이 찜(♥) 되었습니다..\n");
		}
		
		public void removeBucketPro(int idx) {
			if(idx > blist.size()) {
				System.out.println("[안내메시지]찜(♡) 상품이 아닙니다.");
				return;
			}
			System.out.println("[안내메시지]\""+blist.get(idx).getName()+"\" 상품이 찜에서 삭제되었습니다(♡).\n");
			this.blist.remove(idx);
		}
		
		public void bucketProAll(ArrayList<ProductWish> blist) {
			this.blist = blist;
			this.blist.addAll(blist);
			System.out.println("[안내메시지] "+blist.size()+"개 상품이 찜(♥) 되어있습니다.");
		}
		public void showBucketProAll() {

			if(this.blist.size()>0) {
				int idx = 1;
				for(ProductWish p:this.blist) {
					System.out.println(idx++ +". (♥)"+p.getName()+"상품 정보");
					System.out.println("가격:"+p.getPrice()+"원");
					System.out.println("로켓배송:"+p.getLocatOnOff());
				}
			}else {
				System.out.println("[안내메시지] 찜(♥) 되어있는 상품이 없습니다.");
				System.out.println("[안내메시지] 상품 정보 페이지에서 추가해보세요.");
			}
		}
	}

	class ProductWish{
		private String sName;
		private int iPrice;
		private String sLocatOnOff;
		
		public ProductWish(String sName, int iPrice, String locatOnOff) {
			super();
			this.sName = sName;
			this.iPrice = iPrice;
			this.sLocatOnOff = locatOnOff;
		}
		public String getName() {
			return sName;
		}
		public void setName(String name) {
			this.sName = name;
		}
		public int getPrice() {
			return iPrice;
		}
		public void setPrice(int price) {
			this.iPrice = price;
		}
		public String getLocatOnOff() {
			if(!this.sLocatOnOff.contains("로켓배송")) { // "로켓배송" 문구가 들어갔으면 O/안들어갔으면 X
				return "X\n";
			}else {
				return "O\n";
			}
		}
		public void setLocatOnOff(String locatOnOff) {
			this.sLocatOnOff = locatOnOff;
		}
	}