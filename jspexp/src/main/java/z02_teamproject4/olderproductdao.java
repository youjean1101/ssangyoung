package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z02_teamproject4.vo.Olderproduct;

public class olderproductdao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//------------------------------------상품정보 출력 기능메서드------------------------------------------
	public List<Olderproduct> productInfo(Olderproduct sel){
		List<Olderproduct> productlist = new ArrayList<Olderproduct>();
		String sql = "SELECT * FROM olderproduct WHERE productno=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sel.getProductno());
			rs = pstmt.executeQuery();
			/*
			public Olderproduct(int productno, String productname, String kind, String dealmethod, int price,
			String sharewhether, String priceoffer, String information, String registdate, String dealstat,
			String faddressval, String saddressval, String caddressval, String daddressval, String writerid) 
			 */
			while(rs.next()) {
				productlist.add(new Olderproduct(rs.getInt(1),
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4),
									  rs.getInt(5),
									  rs.getString(6),
									  rs.getString(7),
									  rs.getString(8),
									  rs.getString(9),
									  rs.getString(10),
									  rs.getString(11),
									  rs.getString(12),
									  rs.getString(13),
									  rs.getString(14),
									  rs.getString(15)
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
		return productlist;
	}

//-------------------------------------메인 메서드()--------------------------------------
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
