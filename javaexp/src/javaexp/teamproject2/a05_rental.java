package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

//----------------------------------------------------------- 책 대여 여부 조회 기능메서드 (조건걸어서 insert할예정)------------------------------------------------------------------------------------
	public boolean IsIsbnSelect (int isbn) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM rental WHERE isbn = '"+isbn+"'"; // 책 대여등록된 데이터 검색(있으면 true, 없으면 false)
		
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
		


//----------------------------------------------------------- 회원대여정보 조회 기능메서드 ------------------------------------------------------------------------------------
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
				
			}return list;
	}
//----------------------------------------------------------- 회원대여정보 전체조회 기능메서드(관리자) ------------------------------------------------------------------------------------
	public void callUserSelect(String userno) { 
		String sql = "SELECT * FROM rental where userno='"+userno+"'";
		
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
				System.out.println("반납여부: "+rs.getString("returnwhether"));
			};
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
	}

}
class Rental {
	private String rentalno; // 대여번호
	private String userno; //회원번호
	private long isbn; // 책번호
	private String shipwhether; // 배송여부
	private String renturndate; // 반납날짜
	private String returnwhether; // 반납여부
	private String bname;
	
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rental(String rentalno, String userno,String bname, long isbn, String shipwhether, String renturndate,
			String returnwhether) {
		super();
		this.rentalno = rentalno;
		this.userno = userno;
		this.isbn = isbn;
		this.shipwhether = shipwhether;
		this.renturndate = renturndate;
		this.returnwhether = returnwhether;
	}
	public String getRentalno() {
		return rentalno;
	}
	public void setRentalno(String rentalno) {
		this.rentalno = rentalno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public long getIsbn() {
		return isbn;
	}
	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
	public String getShipwhether() {
		return shipwhether;
	}
	public void setShipwhether(String shipwhether) {
		this.shipwhether = shipwhether;
	}
	public String getRenturndate() {
		return renturndate;
	}
	public void setRenturndate(String renturndate) {
		this.renturndate = renturndate;
	}
	public String getReturnwhether() {
		return returnwhether;
	}
	public void setReturnwhether(String returnwhether) {
		this.returnwhether = returnwhether;
	}
	
}
