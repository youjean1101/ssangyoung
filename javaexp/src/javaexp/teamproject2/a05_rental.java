package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class a05_rental {
	static  a05_rental dao = new  a05_rental();
	static Scanner sc = new Scanner(System.in);
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	 
// ---------------------------------------------- 연체자 정보 조회 기능메서드 --------------------------------------------------------------------			
	public List<SignUp> delayUserPush(int userno) {
	 	List<SignUp> list = new ArrayList<SignUp>();
	
//	public void delayUserPush(SignUp delayUserinfo){
				
				String sql ="SELECT * FROM bookUser\r\n"
						+ "WHERE userno = '"+userno+"'";
				
				try {
					con=DB.con();
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						SignUp s = new SignUp(rs.getString("userno"),
												rs.getString("div"),
												rs.getString("uname"),
												rs.getString("rrn"),
												rs.getString("address"),
												rs.getString("phone_number"),
												rs.getString("id"),
												rs.getString("password"),
												rs.getInt("rentalcnt")
												);
						list.add(s);
					}
					
					while(rs.next()) {
						System.out.println("회원번호: "+rs.getString("userno"));
						System.out.println("회원이름: "+rs.getString("uname"));
						System.out.println("회원전화번호: "+rs.getString("phone_number"));
						System.out.println("회원아이디: "+rs.getString("id"));
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
				return list;
			}
//---------------------------------------------- 대여날짜 조회 기능메서드	--------------------------------------------------------------------
	public void delayreturn(){
		String sql = "SELECT * FROM rental \r\n"
				+ "WHERE (sysdate-rentaldate) >= 14\r\n" // 현재날짜가 14일이상이고, 반납일자가 입력되지 않을 때,
				+ "AND (rentaldate-returndate) IS NULL\r\n"
				+ "OR (returndate-rentaldate) >= 14";	// 또는, 대여기간이 14일 넘었을때,
		
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("대여번호: "+rs.getString("rentalno"));
					System.out.println("회원번호: "+rs.getString("userno"));
					System.out.println("도서번호: "+rs.getLong("isbn"));
					System.out.println("대여날짜: "+rs.getString("rentaldate"));
					System.out.println("배송여부: "+rs.getString("shipwhether"));
					System.out.println("반납일자: "+rs.getString("returndate"));
					System.out.println("반납여부: "+rs.getString("returnwhether")+"\n");
				}
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		}
//----------------------------------------------------------- 도서번호 및 대여번호 조회(true/false) 기능메서드 (조건걸어서 insert할예정)------------------------------------------------------------------------------------
	public boolean IsRentalSelect (String whatselect, Rental sel) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM rental \r\n";
		
		switch(whatselect) {
			case "isbn" :
				sql	+= "WHERE isbn = "+sel.getlIsbn(); // 책 대여등록된 데이터 검색(있으면 true, 없으면 false)
				break;
				
			case "rentalno" :
				sql	+= "WHERE rentalno = '"+sel.getsRentalno()+"'";
				break;
			
			case "returnwhether" :
				sql	+= "WHERE RETURNWHETHER ='O' AND RETURNDATE IS not null AND USERNO = ";
				break;
				
			default :
				System.out.println("[안내메시지]검색할 조건을 정확히 입력해주세요.\n");
		}
		
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
	
//----------------------------------------------------------- 대여테이블에 대여 책번호가 있으면 O넣는 기능메서드 ------------------------------------------------------------------------------------
		public void bookWhetherAdd(String bookwhether,String isbn) { 
			String sql = "UPDATE BOOKS \r\n"
					+ " SET rentalwhether = '"+bookwhether+"'\r\n"
					+ " WHERE isbn = '"+isbn+"'"; // 대여테이블에 데이터가 있으면 책테이블 대여여부에 O/X 넣기
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}

//-------------------------------------------------------- 회원대여정보 조회 기능메서드 ------------------------------------------------------
	public List<Rental> rentalUserSelect(String userno){
		List<Rental> list = new ArrayList<Rental>();
		
		String sql = "SELECT rentalno,userno,r.isbn,b.bname,shipwhether,returndate,returnwhether\r\n"
				+ "FROM rental r, books b\r\n"
				+ "where r.isbn=b.isbn\r\n"
				+ "AND userno = "+userno+"'";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
			
				System.out.println("# 나의 대여정보 #");
				while(rs.next()) {
						System.out.println("대여번호: "+rs.getString("rentalno"));
						System.out.println("회원번호: "+rs.getString("userno"));
						System.out.println("도서번호: "+rs.getInt("isbn"));
						System.out.println("도서명: "+ rs.getString("bname"));
						System.out.println("배송여부: "+rs.getString("shipwhether")); // 배송여부 물어보고 데이터 넣기
						System.out.println("반납일자: "+rs.getString("returndate"));  // 반납일자 입력받은 date 등록 ( 대
						System.out.println("반납여부: "+rs.getString("returnwhether")); //반납입력받기 (관리자)
				};
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
			return list;
	}
	
//------------------------------------------------------- 회원대여정보 전체조회(반납/미반납 구분) 기능메서드(관리자) ------------------------------------------------
	public void rentalAllPrint(String sReturnUpDown) { 
		String sql = "SELECT * FROM rental\r\n";
		
		switch(sReturnUpDown) {
			case "반납":
				sql += "WHERE RETURNWHETHER = 'O'\r\n"
						+ "AND returndate IS not null";
				break;
				
			case "미반납":
				sql +=  "WHERE RETURNWHETHER = 'X'\r\n"
						+ "AND returndate IS null";
				break;
				
			case "전체":
				break;
			
			default :
				System.out.println("[안내메시지]반납/미반납 여부를 입력해주세요.\n");
		}	
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("대여번호: "+rs.getString("rentalno"));
				System.out.println("회원번호: "+rs.getString("userno"));
				System.out.println("도서번호: "+rs.getLong("isbn"));
				System.out.println("대여날짜: "+rs.getString("rentaldate"));
				System.out.println("배송여부: "+rs.getString("shipwhether"));
				System.out.println("반납일자: "+rs.getString("returndate"));
				System.out.println("반납여부: "+rs.getString("returnwhether")+"\n");
			};
			
			int cnt = stmt.executeUpdate(sql);
			if (cnt < 1) { // 테이블에 데이터가 없을 경우
				System.out.println("[안내메시지] 대여정보가 없습니다.");
			}

			
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
	}
	
//--------------------------------------------------------- 대여테이블 데이터 생성 기능메서드 ----------------------------------------------------
	public void rentalInsert(Rental add) {
		String sql = "INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,?,?,?,?,?,?);"; 
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsUserno());
				pstmt.setLong(2, add.getlIsbn());
				pstmt.setString(3, add.getsRentaldate());
				pstmt.setString(4, add.getsShipwhether());
				pstmt.setString(5, add.getsRenturndate());
				pstmt.setString(6, add.getsReturnwhether());
				
				System.out.println("[안내메시지] 회원님의 대여등록이 완료되었습니다.\n");
				
				rs = pstmt.executeQuery();
				
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
	
// ----------------------------------------------------- 대여테이블 수정(반납등록) 기능메서드 -------------------------------------------------------------------
		public void returnupUpdate(Rental turn) {
			String sql = "UPDATE rental\r\n"
						+ "SET returnwhether = ?,\r\n"
						+ " returndate = ? \r\n"
						+ "WHERE rentalno= ?\r\n"
						+ "AND returndate is NULL \r\n"
						+ "AND returnwhether='X'";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, turn.getsReturnwhether());
				pstmt.setString(2, turn.getsRenturndate());
				pstmt.setString(3, turn.getsRentalno());
				
				rs = pstmt.executeQuery();
				
				System.out.println("[안내메시지]"+ turn.getsRentalno()+"이 반납처리가 완료되었습니다.\n");
				
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
		
//----------------------------------------------------- 대여테이블 수동삭제(관리자) 기능메서드 ---------------------------------------------------	
		public void rentalMgrDelete(String rentalno) {
			
			String sql = "DELETE FROM rental WHERE rentalno = '"+rentalno+"'";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				System.out.println("[안내메시지] 선택하신 대여정보가 삭제 완료되었습니다.\n");
				
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
				DB.close(rs, stmt, con);
			}	
		}
		
//---------------------------------------------------- 대여테이블 반납완료 시, 자동삭제 기능메서드 ------------------------------------------------	
	public void rentalAutoDelete(String removedate) {
		String sql = "DELETE FROM rental \r\n"
				+ " WHERE returndate='"+removedate+"'\r\n"
				+ "	AND returnwhether ='O'"; //반납여부가 O이면서, 반납일자가 2일지나서 자동삭제
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
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
			DB.close(rs, stmt, con);
		}	
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd"); // 타입을 Date 타입을 yyyy-mm-dd로 변경
		Date time = new Date(); // 현재날짜 및 시각

		String sCurrentTime = format1.format(time); //현재날짜 데이터타입 변경
		
			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			String auth = sc.nextLine();
			if(auth.equals("관리자")) {
				while(true) {
					System.out.println("☞ 다음 대여 메뉴 중 선택해주세요.");
					System.out.println("1: 대여조회");
					System.out.println("2: 대여삭제하기");
					System.out.println("3: 사용자 반납등록하기(관리자)");
					System.out.println("4: 연체자 조회"); // 연체시, 문자전송(대여못하게하기) // 대여날짜 +14일 이면 대여자에게 문자전송 [web발신전송] 
														// -> 시간남으면 대여못하게하기 (회원번호로 설정)
					int iRentalMenuChoice = sc.nextInt();
					sc.nextLine();
					
				
					switch(iRentalMenuChoice) {
						case 1:
							while(true) {
								System.out.println("☞ 대여 조회 메뉴를 고르세요.");
								System.out.println("1: 대여전체조회(반납/미반납)");
								System.out.println("2: 대여반납조회");
								System.out.println("3: 대여미반납조회");
								int iRentalSelectChoice = sc.nextInt();
								sc.nextLine();
								switch(iRentalSelectChoice) {
									
									case 1:
										dao.rentalAllPrint("전체");
										break;
										
									case 2:
										dao.rentalAllPrint("반납");
										break;
										
									case 3:
										dao.rentalAllPrint("미반납");
										break;
										
									default :
										System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
								}
							
							break;
					}
						break;
							
						case 2:
							while(true) {
								System.out.println("☞ 대여 정보를 삭제하시겠습니까?(Y/N)");
								String rantalremovequestion = sc.nextLine();
								
								if(rantalremovequestion.toUpperCase().equals("Y")) {
									dao.rentalAllPrint("전체");
									while(true) {
										System.out.println("☞ 삭제하실 대여번호를 입력해주세요.");
										String sRemoveRentalno = sc.nextLine();
										if(dao.IsRentalSelect("rentalno", new Rental(sRemoveRentalno)) == true){
											dao.rentalMgrDelete(sRemoveRentalno);
											break;
										} else {
											System.out.println("[안내메시지] 없는 대여번호입니다. 대여번호를 정확히 다시 입력해주세요.");
										}
									}
							
									break;
								} else if(rantalremovequestion.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
				break; // 대여메뉴로 돌아가기
							}
							
							break;
							
						case 3:
							while(true) {
								System.out.println("☞ 회원이 책을 반납하였습니까?(Y/N)");
								String returnup = sc.nextLine();
								
								if(returnup.toUpperCase().equals("Y")) {
									dao.rentalAllPrint("미반납"); //미반납 대여정보 조회
									while(true) {
										System.out.println("☞ 반납하실 반납 번호를 입력해주세요.");
										String returnrentalno =sc.nextLine();
										
										if(dao.IsRentalSelect("rentalno", new Rental(returnrentalno)) == true){
											dao.returnupUpdate(new Rental(returnrentalno,sCurrentTime,"O"));
											break;
										} else {
											System.out.println("[안내메시지] 없는 대여번호입니다. 대여번호를 정확히 다시 입력해주세요.");
										}
									}
									break; // 책반납여부 break;
									
								} else if(returnup.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}

							break; //case break
							
						case 4:
							dao.delayreturn();
							while(true) {
								System.out.println("☞ 연체자에게 반납을 독촉하겠습니까?(Y/N)");
								String sDelayUserPush = sc.nextLine();
								if(sDelayUserPush.toUpperCase().equals("Y")) {
									
									int pushUserno;
									while(true) {
										System.out.println("☞ 어떤 회원에게 독촉하시겠습니까?(회원번호 입력)");
										pushUserno = sc.nextInt();
										sc.nextLine();
										
										if(dao.IsRentalSelect("returnwhether",new Rental(pushUserno))==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
											break;
										} else {
											System.out.println("[안내메시지] 요청하신 회원은 반납하였습니다. \n");
										}
									}
									List<SignUp> relayRentalList = dao.delayUserPush(pushUserno);
									for(SignUp userinfo1:relayRentalList) {
										System.out.println("회원번호: "+userinfo1.getUserno());
										System.out.println("회원이름: "+userinfo1.getUname());
										System.out.println("회원전화번호: "+userinfo1.getPhone_Number());
										System.out.println("회원아이디: "+userinfo1.getId());
									}
									while(true) {
										System.out.println("☞ 문자를 전송하시겠습니까?(Y/N)");
										String sMessagePush = sc.nextLine();
										
										if(sMessagePush.toUpperCase().equals("Y")) {
											
											List<SignUp> relaySmsList = dao.delayUserPush(pushUserno);
											for(SignUp userinfo2:relayRentalList) {
												System.out.println("[Web 발신] \""+userinfo2.getUname()+"("+userinfo2.getPhone_Number()+")\"에게 반납 독촉 문자가 전송되었습니다.");
											}
											break;
		
										} else if(sMessagePush.toUpperCase().equals("N")) {
											System.out.println("[안내메시지] 미반납자에게 반납독촉 우편을 전송하시기 바랍니다.");
											
											List<SignUp> relaypostList = dao.delayUserPush(pushUserno);
											for(SignUp userinfo3:relaypostList) {
												System.out.println("미반납자 이름:"+userinfo3.getUname());
												System.out.println("미반납자 주소:"+userinfo3.getAddress());
												System.out.println("미반납자 전화번호:"+userinfo3.getPhone_Number());
											}
											System.out.println("[뒤로가기]");
											break;
											
										} else {
											System.out.println("[안내메시지] Y/N으로 입력해주세요.");
										}
									}
								
									break;
									
								} else if (sDelayUserPush.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}
							
							break;
							
						default:
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
					}
				}
				
				
			} else if (auth.equals("사용자")) {
				System.out.println("☞ 다음 대여 메뉴 중 선택해주세요.");
				System.out.println("1: 도서조회");
				System.out.println("2: 대여하기");
				System.out.println("3: 대여취소하기");
				System.out.println("4: 대여조회하기");
			} else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
			}
	}

}
class Rental {
	private String sRentalno; // 대여번호
	private String sUserno; //회원번호
	private long lIsbn; // 책번호
	private String sRentaldate; // 대여날짜
	private String sShipwhether; // 배송여부
	private String sRenturndate; // 반납날짜
	private String sReturnwhether; // 반납여부
	private String sBname;
	
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Rental(String sRentalno) {
		super();
		this.sRentalno = sRentalno;
	}

	public Rental(long lIsbn) {
		super();
		this.lIsbn = lIsbn;
	}
	
	public Rental(String sRentalno, String sRenturndate, String sReturnwhether) {
		super();
		this.sRentalno = sRentalno;
		this.sRenturndate = sRenturndate;
		this.sReturnwhether = sReturnwhether;
	}

	public Rental(String sRenturndate, String sReturnwhether) {
		super();
		this.sRenturndate = sRenturndate;
		this.sReturnwhether = sReturnwhether;
	}

	public Rental(String sRentalno, String sUserno, long lIsbn, String sRentaldate, String sShipwhether,
			String sRenturndate, String sReturnwhether, String sBname) {
		super();
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
		this.lIsbn = lIsbn;
		this.sRentaldate = sRentaldate;
		this.sShipwhether = sShipwhether;
		this.sRenturndate = sRenturndate;
		this.sReturnwhether = sReturnwhether;
		this.sBname = sBname;
	}

	public String getsRentalno() {
		return sRentalno;
	}

	public void setsRentalno(String sRentalno) {
		this.sRentalno = sRentalno;
	}

	public String getsUserno() {
		return sUserno;
	}

	public void setsUserno(String sUserno) {
		this.sUserno = sUserno;
	}

	public long getlIsbn() {
		return lIsbn;
	}

	public void setlIsbn(long lIsbn) {
		this.lIsbn = lIsbn;
	}

	public String getsRentaldate() {
		return sRentaldate;
	}

	public void setsRentaldate(String sRentaldate) {
		this.sRentaldate = sRentaldate;
	}

	public String getsShipwhether() {
		return sShipwhether;
	}

	public void setsShipwhether(String sShipwhether) {
		this.sShipwhether = sShipwhether;
	}

	public String getsRenturndate() {
		return sRenturndate;
	}

	public void setsRenturndate(String sRenturndate) {
		this.sRenturndate = sRenturndate;
	}

	public String getsReturnwhether() {
		return sReturnwhether;
	}

	public void setsReturnwhether(String sReturnwhether) {
		this.sReturnwhether = sReturnwhether;
	}

	public String getsBname() {
		return sBname;
	}

	public void setsBname(String sBname) {
		this.sBname = sBname;
	}
	
}
