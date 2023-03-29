package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z02_teamproject4.vo.Olddealuser;

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
//---------------------------------아이디로 회원정보 불러오기 기능메서드------------------------------
	public List<Olddealuser> productWriterInfo(String id){
		List<Olddealuser> userlist = new ArrayList<Olddealuser>();
		String sql = "SELECT * FROM olddealuser WHERE id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			/*
			public User(String sId, String sPassword, String sDiv, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail, int iPoint,
			int iSalecount, int iBuycount, int iDeclarationcount)
			 */
			while(rs.next()) {
				userlist.add(new Olddealuser(rs.getString("id"),
											  rs.getString("password"),
											  rs.getString("userdiv"),
											  rs.getString("username"),
											  rs.getString("nickname"),
											  rs.getString("rrn"),
											  rs.getString("phonenumber"),
											  rs.getString("zipcode"),
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
//------------------------------------------회원가입 기능메서드------------------------------------------------	
	public List<Olddealuser> userAdd(Olddealuser ins){
		List<Olddealuser> userlist = new ArrayList<Olddealuser>();
		String sql = "INSERT INTO olddealuser values(?,?,?,?,?,?,?,?,?,?,?,0,0,0,0)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPassword());
			pstmt.setString(3, ins.getUserdiv());
			pstmt.setString(4, ins.getUsername());
			pstmt.setString(5, ins.getNickname());
			pstmt.setString(6, ins.getRrn());
			pstmt.setString(7, ins.getPhonenumber());
			pstmt.setString(8, ins.getZipcode());
			pstmt.setString(9, ins.getAddress());
			pstmt.setString(10, ins.getDetailaddress());
			pstmt.setString(11, ins.getEmail());
			rs = pstmt.executeQuery();
			con.commit();
			/*
			public User(String sId, String sPassword, String sProfileimg, String sUsername, String sPhonenumber,
			String sBirthday, String sGender, String sAddress, String sDetailaddress, String sEmail)
			 */
			
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
	public List<Olddealuser> userInfo(Olddealuser sel){
		List<Olddealuser> userlist = new ArrayList<Olddealuser>();
		String sql = "SELECT * FROM olddealuser WHERE id=? AND password=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sel.getId());
			pstmt.setString(2, sel.getPassword());
			rs = pstmt.executeQuery();
			/*
			public Olddealuser(String id, String password, String userdiv, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email, int point,
			int salecount, int buycount, int declarationcount)
			 */
			while(rs.next()) {
				userlist.add(new Olddealuser(rs.getString("id"),
											  rs.getString("password"),
											  rs.getString("userdiv"),
											  rs.getString("username"),
											  rs.getString("nickname"),
											  rs.getString("rrn"),
											  rs.getString("phonenumber"),
											  rs.getString("zipcode"),
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
	public List<Olddealuser> userdel(Olddealuser del){
		List<Olddealuser> userlist = new ArrayList<Olddealuser>();
		String sql = "DELETE FROM olddealuser WHERE id=? AND password=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getId());
			pstmt.setString(2, del.getPassword());
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
	public List<Olddealuser> userUpdate(Olddealuser upt){
		List<Olddealuser> userlist = new ArrayList<Olddealuser>();
		String sql = "UPDATE olddealuser \r\n"
				+ "SET password=? ,nickname=?,phonenumber=?,zipcode=?,address=?,detailaddress=?,email=? WHERE id=?";
		
		/*
		 public Olddealuser(String id, String password, String nickname, String phonenumber, String zipcode, String address,
			String detailaddress, String email) 
		 */
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getPassword());
			pstmt.setString(2, upt.getNickname());
			pstmt.setString(3, upt.getPhonenumber());
			pstmt.setString(4, upt.getZipcode());
			pstmt.setString(5, upt.getAddress());
			pstmt.setString(6, upt.getDetailaddress());
			pstmt.setString(7, upt.getEmail());
			pstmt.setString(8, upt.getId());
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
