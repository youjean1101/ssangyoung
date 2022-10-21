package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class a04_call {
	static a04_call dao = new a04_call();
	static Scanner sc = new Scanner(System.in);
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
// ---------------------------------------- 상담 내용 조회 ----------------------------------------------
	public void callSelect(String callno) {
		String sql = "select * FROM CALL WHERE callno = ?";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
							System.out.println("프로그램명: "+rs.getString("pname"));
							System.out.println("프로그램시간: "+rs.getString("ptime"));
							System.out.println("프로그램 공지시간: "+rs.getString("noticedate"));
							System.out.println("관리자번호: "+rs.getInt("managerno")+"\n");
				};
				int cnt = stmt.executeUpdate(sql);
				if(cnt==0) System.out.println("[안내메시지] 등록된 프로그램이 없습니다.");
				
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
class call{
	 private int iCallno;
	 private int iUserno;
	 private String sCallcontents;
	 private int iManagerno;
	 private String sCallanswer;
	public call() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public call(int iCallno) {
		super();
		this.iCallno = iCallno;
	}

	public call(int iCallno, int iUserno, String sCallcontents, int iManagerno, String sCallanswer) {
		super();
		this.iCallno = iCallno;
		this.iUserno = iUserno;
		this.sCallcontents = sCallcontents;
		this.iManagerno = iManagerno;
		this.sCallanswer = sCallanswer;
	}
	public int getiCallno() {
		return iCallno;
	}
	public void setiCallno(int iCallno) {
		this.iCallno = iCallno;
	}
	public int getiUserno() {
		return iUserno;
	}
	public void setiUserno(int iUserno) {
		this.iUserno = iUserno;
	}
	public String getsCallcontents() {
		return sCallcontents;
	}
	public void setsCallcontents(String sCallcontents) {
		this.sCallcontents = sCallcontents;
	}
	public int getiManagerno() {
		return iManagerno;
	}
	public void setiManagerno(int iManagerno) {
		this.iManagerno = iManagerno;
	}
	public String getsCallanswer() {
		return sCallanswer;
	}
	public void setsCallanswer(String sCallanswer) {
		this.sCallanswer = sCallanswer;
	}
	 
}