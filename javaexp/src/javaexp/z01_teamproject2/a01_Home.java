package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class a01_Home {
	
		static a01_Home dao = new a01_Home();
		static Scanner sc = new Scanner(System.in);
		static String sLoginout;
		static String sDoubleId;
		
		public static void signUp(){ // 회원가입 함수선언
			while(true) {
				System.out.println("☞ 회원가입을 하시겠습니까?(Y/N)");
				String sSignup = sc.nextLine();
				
				if(sSignup.toUpperCase().equals("Y")) {
					String sId;
					while(true) {
						System.out.print("☞ 아이디: " ); //중복 확인 
						sId = sc.nextLine();
						dao.doubleIdConfirm(sId);
						if(sDoubleId.equals("신규")) {
							System.out.println("[안내메시지] 가입가능한 아이디 입니다.");
							break;
						}else {
							System.out.println("[안내메시지] 이미 존재하는 아이디입니다. 다시 등록해주세요.");
							continue;
						}
					}
					System.out.print("☞ 패스워드: " ); 
					String sPassWd = sc.nextLine();
					System.out.print("☞ 이름: "); 
					String sUname = sc.nextLine();
					System.out.print("☞ 주민번호(000000-0000000): " ); 
					String sRrn = sc.nextLine();
					if (dao.IsRNNSelect(sRrn)==true) {
						System.out.println("[안내메시지] 등록 되어있는 주민등록번호입니다. 다시 입력하시거나,회원이신지 아이디 찾기를 해주세요.");
					}
					
					System.out.print("☞ 주소: " ); 
					String sAddress = sc.nextLine();
					System.out.print("☞ 전화번호(010-0000-0000): " ); 
					String sPhoneNumber = sc.nextLine();
					
					String sDiv = null;
					while(true) {
					System.out.print("☞ 권한(관리자/사용자): " ); 
					String sAuth = sc.nextLine();
						if(sAuth.equals("관리자")) {
							sDiv = "manager";
							break;
		
						}else if(sAuth.equals("사용자")) {
							sDiv = "user";
							break;
							
						}else {
							System.out.println("[안내메시지]권한은 관리자/사용자로 입력하세요.");
						}
					}
						
					int iCnt = 3; // 대여횟수는 연동 후 적용 (임시로 정수 배정)
					
					dao.signUpinsert(new SignUp(sDiv, sUname,sRrn, sAddress, sPhoneNumber ,sId,sPassWd, iCnt));
					break;
		
				} else if(sSignup.toUpperCase().equals("N")) {
					System.out.println("[안내메시지] 회원가입을 하셔야 도서관 이용이 가능합니다.\n");
					break;
					
				} else {
					System.out.println("[안내메시지] Y/N으로 입력해주세요.");
					continue;
				}
			}
		}
	
		private Connection con;
		private Statement stmt;
		private ResultSet rs;
		private PreparedStatement pstmt;
		
// ----------------------------------------------회원가입 기능메서드	--------------------------------------------------------------------
		public void signUpinsert(SignUp useradd) {
			String sql = "INSERT INTO bookUser values(userno_seq.nextval,?,?,?,?,?,?,?,0,0)";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, useradd.getDiv());
					pstmt.setString(2, useradd.getUname());
					pstmt.setString(3, useradd.getRrn());
					pstmt.setString(4, useradd.getAddress());
					pstmt.setString(5, useradd.getPhone_Number());
					pstmt.setString(6, useradd.getId());
					pstmt.setString(7, useradd.getPassword());
					System.out.println("[안내메시지] 회원등록이 완료되었습니다.");
					
				rs = pstmt.executeQuery();
				con.commit();
				
			} catch (SQLException e) {
				System.out.println("DB 처리:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				DB.close(rs, pstmt, con);
			}
		}

// ---------------------------------------------- 도서관 조회 기능메서드	--------------------------------------------------------------------
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
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		 }
		
// ---------------------------------------------- 로그인 기능메서드	--------------------------------------------------------------------
		public List<SignUp> login(SignUp idpasswd) {
				List <SignUp> list = new ArrayList<SignUp>();
			
			String sql ="SELECT * FROM bookUser\r\n"
						+ "WHERE id = '"+idpasswd.getId()+"'\r\n"
						+ "AND password = '"+idpasswd.getPassword()+"'";
			 
			 try {
				con=DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					list.add( new SignUp(
								rs.getString("userno"),
								rs.getString("div"),
								rs.getString("uname"),
								rs.getString("rrn"),
								rs.getString("address"),
								rs.getString("phone_Number"),
								rs.getString("id"),
								rs.getString("password"),
								rs.getInt("rentalcnt")
							));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			}catch(Exception e) {
				System.out.println("일반에러:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
			if(list.size()>0) {
				sLoginout = "in";
			} else {
				System.out.println("[안내메시지]등록된 회원이 아닙니다. 회원가입을 해주세요.\n");
				sLoginout = "out";
			}
			 return list;
		}
// ---------------------------------------------- 회원삭제 기능메서드 --------------------------------------------------------------------
		public void UserDelete(String userno) {
			String sql = "DELETE FROM bookUser WHERE userno='" + userno + "'";
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs != null) System.out.println("[안내메시지] 회원 삭제가 완료되었습니다.");
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
//				System.out.println("[안내메시지] 회원삭제가 정상적으로 되지않았습니다. 관리자에게 문의바랍니다.");
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				if(rs==null) System.out.println("[안내메시지] 회원삭제가 정상적으로 되지않았습니다. 관리자에게 문의바랍니다.");
				DB.close(rs, stmt, con);
			}
		}

// ---------------------------------------------- 아이디 중복 조회 기능메서드 --------------------------------------------------------------------			
		public List<SignUp> doubleIdConfirm(String id) {
			List <SignUp> list = new ArrayList<SignUp>();
			
			String sql ="SELECT * FROM bookUser\r\n"
					+ "WHERE id = '"+id+"'";
			
			
			try {
				con=DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					list.add(new SignUp(rs.getString("id")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			}catch(Exception e) {
				System.out.println("일반에러:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
			if (list.size()>0) {
				sDoubleId = "중복";
			}else {
				sDoubleId = "신규";
			}
			return list;
		}
//-----------------------------------------------주민등록 중복 조회--------------------------------------
	   public boolean IsRNNSelect(String rrn) { 
	         
	         boolean bReturn = false;
	         String sql = "SELECT * FROM bookuser WHERE rrn = '"+ rrn +"'";
	         
	         try {
	            con = DB.con();
	            con.setAutoCommit(false);
	            stmt = con.createStatement();
	            rs = stmt.executeQuery(sql);
	   
	            if(rs.next())
	            {
	               int nRowCnt = rs.getRow(); // 테이블의 행 갯수 변수선언
	               if(nRowCnt < 1) { // 행갯수가 1개라도 있으면 true
	                  bReturn = false;
	               } else {
	                  bReturn = true;
	               }
	            }
	            
	         } catch (SQLException e) {
	            System.out.println("DB처리예외:"+e.getMessage());
	         } catch (Exception e) {
	            System.out.println("기타예외:"+e.getMessage());
	         } finally {
	            DB.close(rs, stmt, con);
	         }
	         return bReturn; // 행갯수가 있으면 true를 리턴   
	   }
// ------------------------------------------- 아이디 조회-------------------------------------------------------
	  public void findID(String name,String phonenumber) {
			
			String sql ="SELECT * FROM bookuser\r\n"
					+ "WHERE uname = '"+name+"'\r\n"
					+ "AND phone_number = '"+phonenumber+"'";
			
			try {
				con=DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("[안내메시지]"+rs.getString("uname")+"님의 ID는 "+rs.getString("id")+" 입니다."); 
				}
				if(rs == null) System.out.println("[안내메시지] 입력하신 정보의 회원이 없습니다. 이름과 전화번호(010-000-0000)를 정확히 입력해주세요. ");
				//수정하기
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			}catch(Exception e) {
				System.out.println("일반에러:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}	
		}
// ---------------------------------------------- 홈 출력 main() --------------------------------------------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		a02_book book = new a02_book();
		a03_Program program = new a03_Program();
		a04_call call = new a04_call();
		a05_rental rental = new a05_rental();
		boolean logout = true;
		
		
		while(true) {
//		do {
			System.out.println("☞ 메뉴를 선택해주세요.");
			System.out.println("1: 회원가입");
			System.out.println("2: 로그인");
			System.out.println("3: 아이디 찾기");
			System.out.println("4: 도서관 찾기");
			
			a01_Home dao = new a01_Home();
			int iHome = sc.nextInt();
			sc.nextLine(); // int 입력 초기화
			
			switch(iHome) {
				case 1 : //회원가입
					signUp(); // 회원가입 함수 선언
					break;
					
				case 2 : //로그인
					
					System.out.print("아이디: ");
					String id = sc.nextLine();
					System.out.print("패스워드: ");
					String passwd = sc.nextLine();
					
					String sLoginDiv = null;
					String sLoginUserno = null;
					
					List<SignUp> loginList = dao.login(new SignUp(id,passwd));
					for(SignUp lo:loginList) {
						System.out.println("[안내메시지]"+lo.getDiv()+"인 \""+lo.getUname()+"\"님이 정상적으로 로그인 되었습니다.\n");
						sLoginDiv = lo.getDiv();
						sLoginUserno = lo.getUserno();
					}
					if(sLoginout.equals("in")) {
						if(sLoginDiv.equals("manager")) {
		
							while(true) {
								System.out.println("#관리자#");
								System.out.println("1: 도서 조회/등록/수정/삭제");
								System.out.println("2: 주간프로그램 조회/등록/수정/삭제");
								System.out.println("3: 상담답변하기");
								System.out.println("4: 대여/배달/연체자 조회");
								System.out.println("5: 로그아웃");
								
								int iManagerMenu = sc.nextInt();
								sc.nextLine();
								switch(iManagerMenu) {
									case 1:
										//도서
										book.BookMenu("관리자",sLoginUserno); 
										break;
										
									case 2: 
										//주간프로그램
										program.ProgramMenu("관리자",sLoginUserno);
										break;
										
									case 3:
										// 상담
										call.CallMenu("관리자",sLoginUserno);
										break;
										
									case 4:
										//대여조회
										rental.RentalMenu("관리자",sLoginUserno);
										break;
										
									case 5:
										//로그아웃
//										logout = false;
//										while(true) {
//											System.out.println("[안내메시지] 로그아웃을 하시려면 Q!를 입력해주세요.");
//											logout = sc.nextLine();
//											if(logout.equals("Q!")) {
//												System.out.println("[안내메시지] 로그아웃되었습니다.");
//												break; // 사용자로 넘어감 -> 회원가입 메뉴로 돌아가야함
//											}
//										}
										break;
										
									default :
										System.out.println("[안내메시지]보기에 있는 메뉴번호를 입력해주세요");
								}
//								break;
							}
						
						} else if(sLoginDiv.equals("user")) {
						// 로그인한 계정이 user일경우
						while(true) {
							System.out.println("#사용자#");
							System.out.println("1: 도서조회");
							System.out.println("2: 대여/반납하기");
							System.out.println("3: 상담하기");
							System.out.println("4: 회원삭제하기");
							System.out.println("5: 공지사항");
							System.out.println("6: 로그아웃");
							int iUserMenu = sc.nextInt();
							sc.nextLine();
							
							switch(iUserMenu) {
								case 1:
									// 도서
									book.BookMenu("사용자",sLoginUserno); 
									break;
									
								case 2: 
									// 대여/반납
									rental.RentalMenu("사용자",sLoginUserno);
									break;
									
								case 3:
									// 상담
									call.CallMenu("사용자",sLoginUserno);
									break;
									
								case 4:
									// 회원삭제
									dao.UserDelete(sLoginUserno);
									break;
									
								case 5:
									//공지사항
									program.ProgramMenu("사용자",sLoginUserno);
									break;
									
								case 6:
									//로그아웃
//									logout = false;
//									while(true) {
//										System.out.println("[안내메시지] 로그아웃을 하시려면 Q!를 입력해주세요.");
//										logout = sc.nextLine();
//										if(logout.equals("Q!")) {
//											// 로그아웃상태
//											System.out.println("[안내메시지] 로그아웃이 되었습니다.");
//											break;
//										}
//									}
									break;
												
								default :
									System.out.println("[안내메시지]보기에 있는 메뉴번호를 입력해주세요");
							}
						}
					} else {
						System.out.println("[안내메시지] 관리자/사용자의 구분이 되지 않습니다. 관리자에게 문의하세요.");
					}
					break;
				}
//					break;
					
				case 3 : // 아이디 찾기
					System.out.println("# 개인정보확인 #");
					System.out.print("☞ 이름 : ");
					String findIDName = sc.nextLine();
					System.out.print("☞ 전화번호:");
					String findIDCallNumber = sc.nextLine();
					dao.findID(findIDName, findIDCallNumber);
					break;
					
				case 4 :  //도서관 찾기
					System.out.println("☞ 도서관 찾을 지역을 검색하세요.");
					String sLocalLib = sc.nextLine();
					
					List<Library> list = dao.librarySelect(sLocalLib);
					for(Library e:list) { 
						System.out.println("["+e.getLoc()+" 지역 도서관: "+e.getLibraryname()+"]\n");
					}
					break;
					
				default : 
					System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");
					break;
					
				}
			
			}
//		while(logout=false);
			
	}
}
//---------------------------------------------- 회원가입 멤버변수 --------------------------------------------------------------------	
class SignUp{ //회원가입 멤버변수
	 private String userno; //회원번호
	 private String div; // user/manager구분
	 private String uname; // 회원이름
	 private String rrn; // 회원주민번호
	 private String address; // 회원주소
	 private String phone_Number; // 회원전화번호
	 private String id; // 회원아이디
	 private String password; // 회원패스워드
	 private int rentalcnt; // 회원대여횟수
	 private int overduecnt; // 연체횟수
	 
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public SignUp(String userno, String div, String uname, String rrn, String address, String phone_Number, String id,
			String password, int rentalcnt, int overduecnt) {
		super();
		this.userno = userno;
		this.div = div;
		this.uname = uname;
		this.rrn = rrn;
		this.address = address;
		this.phone_Number = phone_Number;
		this.id = id;
		this.password = password;
		this.rentalcnt = rentalcnt;
		this.overduecnt = overduecnt;
	}


	public SignUp(String userno,String div, String uname, String rrn, String address, String phone_Number, String id, String password, int rentalcnt) {
		super();
		this.userno = userno;	
		this.div = div;
		this.uname = uname;
		this.rrn = rrn;
		this.address = address;
		this.phone_Number = phone_Number;
		this.id = id;
		this.password = password;
		this.rentalcnt = rentalcnt;
	}
	
	public SignUp(String div, String uname, String rrn, String address, String phone_Number, String id, String password,
			int rentalcnt) {
		super();
		this.div = div;
		this.uname = uname;
		this.rrn = rrn;
		this.address = address;
		this.phone_Number = phone_Number;
		this.id = id;
		this.password = password;
		this.rentalcnt = rentalcnt;
	}

	public SignUp(String id, String password) {
		super();
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

	public SignUp(int rentalcnt, int overduecnt) {
		super();
		this.rentalcnt = rentalcnt;
		this.overduecnt = overduecnt;
	}

	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
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
	public int getOverduecnt() {
		return overduecnt;
	}
	public void setOverduecnt(int overduecnt) {
		this.overduecnt = overduecnt;
	}
}
//---------------------------------------------- 도서관 멤버변수 --------------------------------------------------------------------	
class Library{ //도서관 멤버변수
	private String loc; // 지역
	private String libraryname; //지역별 도서관
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
