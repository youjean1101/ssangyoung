package jspexp.a13_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.vo.Salgrade;

public class SalgradeDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public List<Salgrade> getSalgradeIndex(String lograde, String higrade){
		List<Salgrade> slist = new ArrayList<Salgrade>();
		String sql = "SELECT * FROM salgrade\r\n"
				+ "WHERE grade BETWEEN ? AND ?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lograde);
			pstmt.setString(2, higrade);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				slist.add(new Salgrade(rs.getString("grade"),
									rs.getDouble("losal"),
									rs.getDouble("hisal")
						));
				
				System.out.println(rs.getString("grade"));
				System.out.println(rs.getString("losal"));
				System.out.println(rs.getString("hisal"));
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return slist;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SalgradeDao dao = new SalgradeDao();
		dao.getSalgradeIndex("0","10");
	}

}
