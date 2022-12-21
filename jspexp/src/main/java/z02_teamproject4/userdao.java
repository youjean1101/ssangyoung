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
		String sql = "INSERT INTO olddealuser values(?,?,'회원',?,?,?,?,?,0,0,0,0)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getsId());
			pstmt.setString(2, ins.getsPassword());
			pstmt.setString(3, ins.getsUsername());
			pstmt.setString(4, ins.getsPhonenumber());
			pstmt.setString(5, ins.getsAddress());
			pstmt.setString(6, ins.getsDetailaddress());
			pstmt.setString(7, ins.getsEmail());
			rs = pstmt.executeQuery();
			con.commit();
			
			while(rs.next()) {
				userlist.add(new User
						(rs.getString("id"),
								rs.getString("password"),
								rs.getString("username"),
								rs.getString("phonenumber"),
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
			
			while(rs.next()) {
				userlist.add(new User(rs.getString("id"),
										rs.getString("password"),
										rs.getString("div"),
										rs.getString("username"),
										rs.getString("phonenumber"),
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
	public List<User> userUpdate(String col,String id,String upt){
		List<User> userlist = new ArrayList<User>();
		String sql = "UPDATE olddealuser \r\n";
		
		switch(col) {
			case "password":
				sql += "SET password=? WHERE id=?";
				break;
				
			case "phonenumber":
				sql += "SET phonenumber=? WHERE id=?";
				break;
				
			case "address":
				sql += "SET address=? WHERE id=?";
				break;
				
			case "detailaddress":
				sql += "SET detailaddress=? WHERE id=?";
				break;
				
			case "email":
				sql += "SET email=? WHERE id=?";
				break;
			
			default: 
				System.out.println("[안내메시지] 테이블에 있는 컬럼을 선택해주세요.");
		}
				
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt);
			pstmt.setString(2, id);
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
		dao.userAdd(new User("himan","7777","하이맨","010-1200-7777","인천계양구","계산1동","himan@naver.com"));
		//dao.userdel(new User("test","1234"));
		//dao.userIDConfirm("t");
		//dao.userUpdate("password", "test", "0000");
	}

}
