package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z02_teamproject4.vo.Cartlist;
import z02_teamproject4.vo.Olddealuser;
import z02_teamproject4.vo.Olderproduct;
import z02_teamproject4.vo.Social;

public class cartlistdao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//-------------------------------------------찜 리스트 추가-----------------------------------------------
	public void cartlistAdd(Cartlist ins){
		String sql = "INSERT INTO cartlist values(?,?)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getProductno());
			pstmt.setString(2, ins.getId());
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
//-------------------------------------------찜 리스트 추가-----------------------------------------------
	public void cartlistRemove(Cartlist ins){
		String sql = "DELETE FROM cartlist WHERE productno=? and id=? ";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getProductno());
			pstmt.setString(2, ins.getId());
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
//---------------------------------------찜 중복추가방지기능메서드-------------------------------------
	public boolean isCartlist(Cartlist sel){
		boolean isCarthave = false;
		String sql = "SELECT * FROM cartlist WHERE productno=? AND id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sel.getProductno());
			pstmt.setString(2, sel.getId());
			rs = pstmt.executeQuery();
			isCarthave=rs.next();
			System.out.println("찜 유무:"+isCarthave);
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return isCarthave;
	}
//----------------------------------------찜 조회--------------------------------------------------------
	public List<Olderproduct> cartProductInfo(String id){
		List<Olderproduct> plist = new ArrayList<Olderproduct>();
		String sql = "SELECT * FROM olderproduct p,cartlist c\r\n"
					+ "WHERE c.productno = p.productno\r\n"
					+ "and id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			/*
			public Olderproduct(int productno, String productname, String kind, String dealmethod, int price,
			String sharewhether, String priceoffer, String information, String registdate, String dealstat,
			String faddressval, String saddressval, String caddressval, String daddressval, String writerid)
			 */
			while(rs.next()) {
				 plist.add(new Olderproduct(rs.getInt("productno"),
											  rs.getString("productname"),
											  rs.getString("kind"),
											  rs.getString("dealmethod"),
											  rs.getInt("price"),
											  rs.getString("sharewhether"),
											  rs.getString("priceoffer"),
											  rs.getString("information"),
											  rs.getString("registdate"),
											  rs.getString("dealstat"),
											  rs.getString("faddressval"),
											  rs.getString("saddressval"),
											  rs.getString("caddressval"),
											  rs.getString("daddressval"),
											  rs.getString("writerid")
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
		return plist;
	}
//----------------------------------------찜 유/무 조회--------------------------------------------------------
	public boolean isCartProd(String id){
		boolean haspro = false;
		String sql = "SELECT * FROM olderproduct p,cartlist c\r\n"
				+ "WHERE c.productno = p.productno\r\n"
				+ "and id=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			haspro =rs.next();
			System.out.println("찜상품유무:"+haspro);
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return haspro;
	}
//-----------------------------------------물건 찜갯수 기능메서드-----------------------------------------------
	public int cartProductCnt(int pno){
		String sql = "SELECT * FROM cartlist WHERE productno=?";
		int productcnt=0;
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//System.out.println(rs.getRow());
				productcnt = rs.getRow();
			}
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return productcnt;
	}
	
//-----------------------------------------Main()기능메서드---------------------------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		cartlistdao dao = new cartlistdao();
		System.out.println(dao.cartProductCnt(2));
	}

}
