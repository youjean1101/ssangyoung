package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z02_teamproject4.vo.Social;
import z02_teamproject4.vo.User;

public class socialdao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//-----------------------------모아보기/차단하기 추가-----------------------------------
	public void collectAdd(Social ins){
		String sql = "INSERT INTO social values(?,?,?)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getTypediv());
			pstmt.setString(3, ins.getOtherid());
			rs = pstmt.executeQuery();
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
//-----------------------------모아보기/차단하기 삭제하기-----------------------------------
	public void collcutremove(Social ins){
		String sql = "DELETE FROM social \r\n"
					+ "WHERE id=? \r\n"
					+ "AND typediv=?\r\n"
					+ "AND otherid=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getTypediv());
			pstmt.setString(3, ins.getOtherid());
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------차단하기/모아보기 회원 조회하기------------------------------
	public List<User> cutoutView(Social sel){
		List<User> socialUserlist = new ArrayList<User>();
		String sql = "SELECT*FROM social s, olddealuser u\r\n"
					+ "WHERE s.otherid = u.id\r\n"
					+ "AND s.id=? \r\n"
					+ "AND s.typediv=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sel.getId());
			pstmt.setString(2, sel.getTypediv());
			rs = pstmt.executeQuery();
			/*
			public Social(String sId, String sTypediv, String sOtherid)
			public User(String sId, String sAddress, String sDetailaddress)
			 */
			while(rs.next()) {
				socialUserlist.add(new User(rs.getString("otherid"),
										  rs.getString("address"),
										  rs.getString("detailaddress")
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
		return socialUserlist;
	}
	
//------------------------------main()기능메서드----------------------------------
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		socialdao dao = new socialdao();
		//dao.collectAdd(new Social("test","차단","yujin"));
		//dao.cutoutView(new Social("yujin","모아"));
		List<User> cutUserList= dao.cutoutView(new Social("yujin","모아"));
		for(int idx=1;idx<cutUserList.size();idx++) {
			System.out.println(idx);
			System.out.println(cutUserList.get(idx));
		}
//		for(User userinfo:dao.cutoutView(new Social("yujin","모아"))) {
//			System.out.println(userinfo.getsId());
//			System.out.println(userinfo.getsAddress());
//			System.out.println(userinfo.getsDetailaddress());
//		}
	}

}
