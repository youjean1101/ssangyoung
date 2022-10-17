package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo2.Emp01;
import javaexp.a13_database.vo2.Emp04;

public class a01_SignUp {
	
		private Connection con;
		private Statement stmt;
		private ResultSet rs;
		
		public void signUpinsert(SignUp ins) {
			String sql = "INSERT INTO bookUser values('"+ins.getUserno()+"','"+ins.getDiv()+"',"
					+ "'"+ins.getUname()+"','"+ins.getRrn()+"','"+ins.getAddress()+"',"
					+ "'"+ins.getPhone_Number()+"','"+ins.getId()+"',"
					+ "'"+ins.getPassword()+"',null)";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
//				System.out.println("등록성공");
				
			} catch (SQLException e) {
//				System.out.println("DB 처리:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
//					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
//				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
			
		public List<Library> librarySelect(String loc) {
		 	List<Library> list = new ArrayList<Library>();
		 	String sql = "SELECT * FROM library WHERE local = '"+loc+"'";
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Library l = new Library(rs.getString("local"),
											rs.getString("libraryname"));
					list.add(l);
				}
				if(list.size()== 0) {
					System.out.println("[안내 메시지]해당 지역의 도서관 정보는 없습니다.");
				}
			} catch (SQLException e) {
//				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
//				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		 }

	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("☞ 메뉴를 선택해주세요.");
		System.out.println("1: 회원가입");
		System.out.println("2: 로그인");
		System.out.println("3: 도서관 찾기");
		a01_SignUp dao = new a01_SignUp();
		int iHome = sc.nextInt();
		sc.nextLine();
		switch(iHome) {
			case 1 :
				while(true) {
					System.out.println("☞ 회원가입을 하시겠습니까?(Y/N)");
					String sSignup = sc.nextLine();
					
					if(sSignup.toUpperCase().equals("Y")) {
						System.out.print("☞ 아이디: " ); //중복 확인
						String sId = sc.nextLine();
						System.out.print("☞ 패스워드: " ); //중복 확인
						String sPassWd = sc.nextLine();
						System.out.print("☞ 이름: "); //중복 확인
						String sUname = sc.nextLine();
						System.out.print("☞ 주민번호: " ); //중복 확인
						String sRrn = sc.nextLine();
						System.out.print("☞ 주소: " ); //중복 확인
						String sAddress = sc.nextLine();
						System.out.print("☞ 전화번호: " ); //중복 확인
						String sPhoneNumber = sc.nextLine();
						System.out.print("☞ 권한(관리자/사용자): " ); //중복 확인
						String sAuth = sc.nextLine();
						
						String sDiv = null;
							if(sAuth.equals("관리자")) {
								sDiv = "manager";
			
							}else if(sAuth.equals("사용자")) {
								sDiv = "user";
								
							}else {
								System.out.println("[안내메시지]권한은 관리자/사용자로 입력하세요.");
							}
							
						int iUserNo = (int)(Math.random()*9000+1000);
						int iCnt = 3; 
			//			ins.setRentalcnt();  대여횟수는 대여갯수 반영 - 헬일듯
						
						dao.signUpinsert(new SignUp(iUserNo, sDiv, sUname,sRrn, sAddress, sPhoneNumber ,sId,sPassWd ));
						dao.signUpinsert(new SignUp(iCnt));
						break;
						
					} else if(sSignup.toUpperCase().equals("N")) {
						System.out.println("[안내메시지] 회원가입을 하셔야 도서관 이용이 가능합니다.");
						break;
					} else {
						System.out.println("[안내메시지] Y/N으로 입력해주세요.");
						continue;
					}
				}
				
			case 2 :
				
			case 3 : 
				System.out.println("☞ 도서관 찾을 지역을 검색하세요.");
				String sLocalLib = sc.nextLine();
				
				List<Library> list = dao.librarySelect(sLocalLib);
				for(Library e:list) { 
					System.out.println(e.getLoc()+" 지역 도서관: "+e.getLibraryname());
				}
				
		}		
	}
}
class SignUp{
	 private int userno; //회원번호
	 private String div; // user/manager구분
	 private String uname; // 회원이름
	 private String rrn; // 회원주민번호
	 private String address; // 회원주소
	 private String phone_Number; // 회원전화번호
	 private String id; // 회원아이디
	 private String password; // 회원패스워드
	 private int rentalcnt; // 회원대여횟수
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SignUp(int userno,String div, String uname, String rrn, String address, String phone_Number, String id, String password) {
		super();
		this.userno = userno;	
		this.div = div;
		this.uname = uname;
		this.rrn = rrn;
		this.address = address;
		this.phone_Number = phone_Number;
		this.id = id;
		this.password = password;
	}
	
	public SignUp(String div) {
		super();
		this.div = div;
	}
	
	public SignUp(int rentalcnt) {
		this.rentalcnt = rentalcnt;
	}

	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone_Number() {
		return phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		this.phone_Number = phone_Number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRentalcnt() {
		return rentalcnt;
	}
	public void setRentalcnt(int rentalcnt) {
		this.rentalcnt = rentalcnt;
	}
}

class Library{
	private String loc;
	private String libraryname;
	public Library() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Library(String loc) {
		super();
		this.loc = loc;
	}

	public Library(String loc, String libraryname) {
		super();
		this.loc = loc;
		this.libraryname = libraryname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getLibraryname() {
		return libraryname;
	}

	public void setLibraryname(String libraryname) {
		this.libraryname = libraryname;
	}
}
