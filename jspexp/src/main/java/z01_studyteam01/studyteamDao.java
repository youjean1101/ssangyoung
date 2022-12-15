package z01_studyteam01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z01_studyteam01.vo.NoticeBoard;
import z01_studyteam01.vo.NoticeBoardUser;

public class studyteamDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//------------------------------게시판 회원추가----------------------------------
	public List<NoticeBoardUser> NoticeBoardUserAdd(NoticeBoardUser sch){
		List<NoticeBoardUser> userlist = new ArrayList<NoticeBoardUser>();
		String sql = "INSERT INTO noticeboarduser values(?,?,?,?,?)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getsId());
			pstmt.setString(2, sch.getsPassword());
			pstmt.setString(3, sch.getsName());
			pstmt.setString(4, sch.getsEmail());
			pstmt.setString(5, sch.getsPhonNumber());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userlist.add(new NoticeBoardUser
									(rs.getString("id"),
									rs.getString("password"),
									rs.getString("name"),
									rs.getString("email"),
									rs.getString("phonenumber")
						));
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
//----------------------------게시판 회원 조회-------------------------------------
	public boolean login(String id, String pass){
	      boolean isSuccess = false;
	      String sql = "SELECT * FROM noticeBoardUser WHERE id=? AND password=?";
	      
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, pass);
	         rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
	         isSuccess = rs.next();	// 해당 id, pass로 조회 될때만 true 그 외는 false
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      return isSuccess;
	   }
//----------------------------게시판 회원 아이디 중복조회-------------------------------------
	public boolean isIDConfirm(String id){
		boolean isSuccess = false;
		String sql = "SELECT * FROM noticeBoardUser WHERE id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			isSuccess = rs.next();	// 해당 id, pass로 조회 될때만 true 그 외는 false
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return isSuccess;
	}
//----------------------------게시판 회원 정보 조회------------------------------------
	public List<NoticeBoardUser> userInfo(NoticeBoardUser sel){
		List<NoticeBoardUser> userlist = new ArrayList<NoticeBoardUser>();
	//public void userInfo(NoticeBoardUser sel) {
		String sql = "SELECT * FROM noticeBoardUser WHERE id=? AND password=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sel.getsId());
			pstmt.setString(2, sel.getsPassword());
			rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
	        while(rs.next()) {
	        	userlist.add(new NoticeBoardUser(
	                             rs.getString("id"),
	                             rs.getString("password"),
	                             rs.getString("name"),
	                             rs.getString("email"),
	                             rs.getString("phonenumber")                  
	             ));
	        }
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
//----------------------------게시판 회원 정보 수정------------------------------------
	public void updateNoticeBoardUser(NoticeBoardUser upt) {
		String sql = "UPDATE noticeboarduser SET name=? WHERE id =?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getsName());
			pstmt.setString(2, upt.getsId());
			System.out.println("수정건수:"+pstmt.executeUpdate());
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback 에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}	
//----------------------------게시판 회원 정보 삭제(탈퇴)------------------------------------
	public void userRemove(NoticeBoardUser del) {
		String sql = "DELETE FROM noticeBoardUser WHERE id=? AND password=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getsId());
			pstmt.setString(2, del.getsPassword());
			
			rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			/*
			 * while(rs.next()) { System.out.println(rs.getRow());
			 * 
			 * }
			 */
	        System.out.println("삭제가 완료되었습니다.");
	        con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}	
//----------------------------게시판 작성하기------------------------------------
	public List<NoticeBoard> NoticeBoardAdd(NoticeBoard ins){
		List<NoticeBoard> blist = new ArrayList<NoticeBoard>();
		String sql = "INSERT INTO noticeboard values(?,?,?,?,?)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getsId());
			pstmt.setString(2, ins.getsDiv());
			pstmt.setString(3, ins.getsTitle());
			pstmt.setString(4, ins.getsContent());
			pstmt.setString(5, ins.getsFileadd());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				blist.add(new NoticeBoard
								(rs.getString("id"),
								rs.getString("div"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getString("fileadd")
						));
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return blist;
	}
	
//------------------------------Main()---------------------------------
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		studyteamDao dao = new studyteamDao();
		//dao.userRemove(new NoticeBoardUser("4444","1234"));
		System.out.println(dao.isIDConfirm("2321"));
	}
}
