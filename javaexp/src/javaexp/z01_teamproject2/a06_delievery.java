package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javaexp.a13_database.DB;

public class a06_delievery {
	
	
	
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
// ---------------------------------------------대여/연체 갯수 업데이트-----------------------------------------	
	public void rentalAndOverdueCntUpdate(String userno,SignUp update) {
		String sql = "UPDATE BOOKUSER \r\n"
					+ "SET rentalcnt = ?,\r\n"
					+ "overduecnt = ?\r\n"
					+ "WHERE USERNO = ?\r\n"
					+ "AND div = 'user'"; 
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setInt(1, update.getRentalcnt());
				pstmt.setInt(2, update.getOverduecnt());
				pstmt.setString(3, userno);
				
				con.commit();
				
		} catch (SQLException e) {
			System.out.println("DB 처리:"+e.getMessage());
			System.out.println("[안내메시지] 대여/연체 갯수 반영이 안되었습니다. 관리자에게 문의하세요.");
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
	
// ---------------------------------------------대여갯수 조회-----------------------------------------
	public int rentalcnt(String userno) {
		String sql = "SELECT count(*) rentalcnt FROM rental\r\n"
				+ "WHERE userno = '"+userno+"'";
		
		int rentalcnt = 0; 
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rentalcnt = rs.getInt("rentalcnt");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
		return rentalcnt;
	}	
	
// ---------------------------------------------연체갯수 조회-----------------------------------------
	public int overduecnt(String userno) {
		String sql = "SELECT count(*) overduecnt FROM rental \r\n"
				+ "WHERE userno = '"+ userno +"'\r\n"
				+ "AND (((sysdate-rentaldate) >= 14\r\n"
				+ "AND (rentaldate-returndate) IS NULL)\r\n"
				+ "OR (returndate-rentaldate) >= 14)";
		
		int overduecnt = 0; 
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				overduecnt = rs.getInt("overduecnt");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
		return overduecnt;
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		a06_delievery dao = new a06_delievery();
		System.out.println(dao.rentalcnt("1022"));
		System.out.println(dao.overduecnt("1022"));
		dao.rentalAndOverdueCntUpdate("1022", new SignUp(dao.rentalcnt("1022"),dao.overduecnt("1022")));
		
	}

}
