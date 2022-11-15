package jspexp.a13_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.vo.*;

public class z01_memberInfoDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Memberinfo> getMemberinfoList(){
		List<Memberinfo> mlist = new ArrayList<Memberinfo>();
		String sql = "SELECT * FROM MembersInfo";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				mlist.add(new Memberinfo(rs.getInt("userno"),
								    rs.getString("div"),
								    rs.getString("uname"),
									rs.getString("rrn"),
									rs.getString("address"),
									rs.getString("phone_Number"),
									rs.getString("id"),
									rs.getString("password")
						 ));
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return mlist;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		z01_memberInfoDao dao1 = new z01_memberInfoDao();
		for(Memberinfo m:dao1.getMemberinfoList()) {
			System.out.println(m.getUserno() );
			System.out.println(m.getDiv());
			System.out.println(m.getUname());
			System.out.println(m.getRrn() );
			System.out.println(m.getAddress());
			System.out.println(m.getPhonenumber());
			System.out.println(m.getId());
			System.out.println(m.getPassword());
		} 

	}

}
