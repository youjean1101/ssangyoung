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
	
//----------------------------------------------------------- 도서번호 및 대여번호 조회(true/false) 기능메서드 (조건걸어서 insert할예정)------------------------------------------------------------------------------------
	public boolean IsIsbnSelect (String whatselect, Rental sel) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM rental \r\n";
		
		switch(whatselect) {
			case "isbn" :
				sql	+= "WHERE isbn = "+sel.getlIsbn(); // 책 대여등록된 데이터 검색(있으면 true, 없으면 false)
				break;
				
			case "rentalno" :
				sql	+= "WHERE rentalno = "+sel.getsRentalno();
				break;
			default :
				System.out.println("[안내메시지]검색할 조건을 정확히 입력해주세요.");
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
	
//------------------------------------------------------- 회원대여정보 전체조회 기능메서드(관리자) ------------------------------------------------
	public void rentalAllPrint(String userno) { 
		String sql = "SELECT * FROM rental";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("대여번호: "+rs.getString("rentalno"));
				System.out.println("회원번호: "+rs.getString("userno"));
				System.out.println("도서번호: "+rs.getInt("isbn"));
				System.out.println("대여날짜: "+rs.getString("rentaldate"));
				System.out.println("배송여부: "+rs.getString("shipwhether"));
				System.out.println("반납일자: "+rs.getString("returndate"));
				System.out.println("반납여부: "+rs.getString("returnwhether")+"\n");
			};
			
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
				
				System.out.println("[안내메시지] 회원님의 대여등록이 완료되었습니다.");
				
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
		public void callContentsUpdate(Rental turn) {
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
				
				System.out.println("[안내메시지] 회원님의 상담 수정이 완료되었습니다.");
				
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
		while(true) {
			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			String auth = sc.nextLine();
			if(auth.equals("관리자")) {
				System.out.println("☞ 다음 대여 메뉴 중 선택해주세요.");
				System.out.println("1: 대여전체조회");
				System.out.println("2: 대여삭제하기");
				System.out.println("3: 사용자 반납하기");
				System.out.println("4: 연체자 조회"); // 연체시, 문자전송(대여못하게하기) // 대여날짜 +14일 이면 대여자에게 문자전송 [web발신전송] 
													// -> 시간남으면 대여못하기하기 (회원번호로 설정)
				
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
