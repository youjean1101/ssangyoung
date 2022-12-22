package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z01_studyteam01.vo.NoticeBoardUser;
import z02_teamproject4.vo.User;

//z02_teamproject4.userdao
public class userdao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//------------------------------------------아이디중복확인 기능메서드------------------------------------------------	
	public boolean userIDConfirm(String id){
		boolean isIdhave = false;
		String sql = "SELECT * FROM olddealuser WHERE id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			isIdhave=rs.next();
			System.out.println(isIdhave);
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return isIdhave;
	}
//------------------------------------------회원가입 기능메서드------------------------------------------------	
	public List<User> userAdd(User ins){
		List<User> userlist = new ArrayList<User>();
		String sql = "INSERT INTO olddealuser values(?,?,'회원',?,?,?,?,?,?,?,?,0,0,0,0)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getsId());
			pstmt.setString(2, ins.getsPassword());
			pstmt.setString(3, ins.getsProfileimg());
			pstmt.setString(4, ins.getsUsername());
			pstmt.setString(5, ins.getsBirthday());
			pstmt.setString(6, ins.getsGender());
			pstmt.setString(7, ins.getsPhonenumber());
			pstmt.setString(8, ins.getsAddress());
			pstmt.setString(9, ins.getsDetailaddress());
			pstmt.setString(10, ins.getsEmail());
			rs = pstmt.executeQuery();
			con.commit();
			/*
			public User(String sId, String sPassword, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail)
			 */
			while(rs.next()) {
				userlist.add(new User
									(rs.getString("id"),
									 rs.getString("password"),
									 rs.getString("profileimg"),
									 rs.getString("username"),
									 rs.getString("phonenumber"),
									 rs.getString("birthday"),
									 rs.getString("gender"),
									 rs.getString("address"),
									 rs.getString("detailaddress"),
									 rs.getString("email")
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
//------------------------------------------로그인 기능메서드------------------------------------------------
	public boolean login(String id, String passwd){
		boolean isIdhave = false;
		String sql = "SELECT * FROM olddealuser WHERE id=? AND password=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			isIdhave=rs.next();
			System.out.println(isIdhave);
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return isIdhave;
	}
//------------------------------------------로그인 기능메서드------------------------------------------------
	public List<User> userInfo(User sel){
		List<User> userlist = new ArrayList<User>();
		String sql = "SELECT * FROM olddealuser WHERE id=? AND password=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sel.getsId());
			pstmt.setString(2, sel.getsPassword());
			rs = pstmt.executeQuery();
			/*
			public User(String sId, String sPassword, String sDiv, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail, int iPoint,
			int iSalecount, int iBuycount, int iDeclarationcount)
			 */
			while(rs.next()) {
				userlist.add(new User(rs.getString("id"),
									  rs.getString("password"),
									  rs.getString("div"),
									  rs.getString("profileimg"),
									  rs.getString("username"),
									  rs.getString("phonenumber"),
									  rs.getString("birthday"),
									  rs.getString("gender"),
									  rs.getString("address"),
									  rs.getString("detailaddress"),
									  rs.getString("email"),
									  rs.getInt("point"),
									  rs.getInt("salecount"),
									  rs.getInt("buycount"),
									  rs.getInt("declarationcount")
						));
			}
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
//------------------------------------------회원탈퇴 기능메서드------------------------------------------------	
	public List<User> userdel(User del){
		List<User> userlist = new ArrayList<User>();
		String sql = "DELETE FROM olddealuser WHERE id=? AND password=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getsId());
			pstmt.setString(2, del.getsPassword());
			rs = pstmt.executeQuery();
			if(rs.next()==true) System.out.println("삭제가 완료되었습니다.");
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
//------------------------------------------회원수정 기능메서드------------------------------------------------	
	public List<User> userUpdate(User upt){
		List<User> userlist = new ArrayList<User>();
		String sql = "UPDATE olddealuser \r\n"
				+ "SET password=?, profileimg=?,birthday=?, \r\n"
				+ "gender=?,phonenumber=?,address=?,detailaddress=?,email=? WHERE id=?";
		
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getsPassword());
			pstmt.setString(2, upt.getsProfileimg());
			pstmt.setString(3, upt.getsBirthday());
			pstmt.setString(4, upt.getsGender());
			pstmt.setString(5, upt.getsPhonenumber());
			pstmt.setString(6, upt.getsAddress());
			pstmt.setString(7, upt.getsDetailaddress());
			pstmt.setString(8, upt.getsEmail());
			pstmt.setString(9, upt.getsId());
			rs = pstmt.executeQuery();
			//System.out.println(pstmt.executeUpdate());
			if(pstmt.executeUpdate()>=1) System.out.println("수정이 완료되었습니다.");
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		userdao dao = new userdao();
		//dao.userAdd(new User("himan","7777","하이맨","010-1200-7777","인천계양구","계산1동","himan@naver.com"));
		//dao.userdel(new User("test","1234"));
		//dao.userIDConfirm("t");
		//User(String sId, String sPassword, String sProfileimg, String sPhonenumber, String sBirthday, String sGender,
		//String sAddress, String sDetailaddress, String sEmail)
		//dao.userUpdate(new User("test2","1234","프로필사진","010-7985-4444","20221231","여자","서울","홍대입구역","test2@daum.net"));
	}

}
