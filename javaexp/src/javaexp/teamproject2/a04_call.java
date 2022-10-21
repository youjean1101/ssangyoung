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
	
// ---------------------------------------- 상담 내용 및 답변 조회(회원 조회) ---------------------------------------------- 
	public void callUserSelect(String userno) { 
		String sql = "select callno,callcontents,callanswer FROM CALL WHERE userno = '"+userno+"'";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				System.out.println(" # 내가 신청했던 상담정보 #");
				
				while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
				};
				int cnt = stmt.executeUpdate(sql);
				if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
}
// ---------------------------------------- 상담 내용 조회(관리자 조회) ----------------------------------------------
	public void callManagerSelect(String callno) { 
		String sql = "select * FROM CALL WHERE callno = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("상담번호: "+rs.getString("callno"));
				System.out.println("상담신청회원번호: "+rs.getString("userno"));
				System.out.println("상담내용: "+rs.getString("callcontents"));
				System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
				System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
			};
			int cnt = stmt.executeUpdate(sql);
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
	}
// ---------------------------------------- 상담 내용 추가(회원) ----------------------------------------------
	public void callInsert(Call add) {
		String sql = "INSERT INTO CALL VALUES(?,?,?,null,null)";
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsCallno());
				pstmt.setString(2, add.getsUserno());
				pstmt.setString(3, add.getsCallcontents());
				
				System.out.println("[안내메시지] 회원님의 상담등록이 완료되었습니다.");
				
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
// ---------------------------------------- 상담 답변이 없는 상담 조회 (관리자) ----------------------------------------------
	public void callAnswerExpected() { // 해당 상담 중 무슨 상담을 답변하시겠습니까? 질문하기
		String sql = "SELECT callno,userno,callcontents FROM CALL WHERE MANAGERNO is null"; //상담 답변이 안되어있는 상담 조회
						// 나중에 join으로 상담신청 아이디 출력
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("상담번호:"+rs.getString("callno"));
				System.out.println("상담등록회원번호:"+rs.getString("userno"));
				System.out.println("상담내용:"+rs.getString("callcontents"));
			};
			
			int cnt = stmt.executeUpdate(sql);
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
			
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
// ---------------------------------------- 상담 답변 추가(관리자) ----------------------------------------------
	public void callanswerUpdate(Call add) { // 해당 상담 중 무슨 상담을 답변 및 수정 하시겠습니까? 질문하기
		String sql = "UPDATE CALL \r\n"
				+ "SET managerno = ?,\r\n"
				+ "callanswer = ?\r\n"
				+ "WHERE callno = ?"; // 상담 추가한 상담번호 선택
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, add.getsManagerno());
			pstmt.setString(2, add.getsCallanswer());
			pstmt.setString(3, add.getsCallno());
			
			System.out.println("[안내메시지] 관리자님의 상담 답변이 완료되었습니다.");
			
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
// ---------------------------------------- 상담 삭제(회원) ----------------------------------------------
	public void callDelete(String callno) {
		String sql = "DELETE FROM call WHERE callno = '"+callno+"'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
						
			System.out.println("[안내메시지] 요청하신 상담 삭제가 완료되었습니다.");
			
			int cnt = stmt.executeUpdate(sql);
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
			
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
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			System.out.println();
	}

}
class Call{
	 private String sCallno;
	 private String sUserno;
	 private String sCallcontents;
	 private String sManagerno;
	 private String sCallanswer;
	public Call() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Call(String sCallno) {
		super();
		this.sCallno = sCallno;
	}

	public Call(String sCallno, String sUserno, String sCallcontents, String sManagerno, String sCallanswer) {
		super();
		this.sCallno = sCallno;
		this.sUserno = sUserno;
		this.sCallcontents = sCallcontents;
		this.sManagerno = sManagerno;
		this.sCallanswer = sCallanswer;
	}

	public String getsCallno() {
		return sCallno;
	}

	public void setsCallno(String sCallno) {
		this.sCallno = sCallno;
	}

	public String getsUserno() {
		return sUserno;
	}

	public void setsUserno(String sUserno) {
		this.sUserno = sUserno;
	}

	public String getsCallcontents() {
		return sCallcontents;
	}

	public void setsCallcontents(String sCallcontents) {
		this.sCallcontents = sCallcontents;
	}

	public String getsManagerno() {
		return sManagerno;
	}

	public void setsManagerno(String sManagerno) {
		this.sManagerno = sManagerno;
	}

	public String getsCallanswer() {
		return sCallanswer;
	}

	public void setsCallanswer(String sCallanswer) {
		this.sCallanswer = sCallanswer;
	}	
}