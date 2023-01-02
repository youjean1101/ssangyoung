package z02_teamproject4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspexp.a13_database.DB;
import z02_teamproject4.vo.Olderproduct;
import z02_teamproject4.vo.Reserve;

public class reservedao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//--------------------------------예약하기 기능메서드-----------------------------------------
	public void reserveAdd(Reserve ins){
		String sql = "INSERT INTO reserve values('buy'||reserve_seq.nextval,?,?,?,?,?)";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			//Reserve(String date, int sugprice, String reservation, String id, int productno)
			pstmt.setString(1, ins.getDate());
			pstmt.setInt(2, ins.getSugprice());
			pstmt.setString(3, ins.getReservation());
			pstmt.setString(4, ins.getId());
			pstmt.setInt(5, ins.getProductno());
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
//--------------------------------예약중 변경 기능메서드-----------------------------------------
	public void dealstatUpdate(int productno){
		String sql = "UPDATE olderproduct SET dealstat='예약중' WHERE productno=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productno);
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
//-------------------------------구매/판매목록 예약하기 조회 기능메서드---------------------------------
	public List<Olderproduct> buysalesReservePro(String reserveSel,String id){
		List<Olderproduct> plist = new ArrayList<Olderproduct>();
		String sql = "SELECT * FROM reserve r,olderproduct p \r\n"
					+ "WHERE r.productno=p.productno\r\n"
					+ "AND dealstat ='예약중'";
		switch(reserveSel) {
			case "구매예약" :
				sql += "AND r.id=?";
				break;
			case "판매예약" :
				sql += "AND p.writerid=?";
				break;
			default : 
				System.out.println("[안내메시지]구매/판매중에 선택해주세요.");
				break;
		}
		
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
//-------------------------------판매내역 판매중/거래완료/숨김 조회 기능메서드---------------------------------
	public List<Olderproduct> salesViewPro(String id,String salesSel){
		List<Olderproduct> plist = new ArrayList<Olderproduct>();
		String sql = "SELECT * FROM olderproduct \r\n"
					+ "WHERE writerid=?\r\n"
					+ "AND dealstat=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, salesSel);
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
//-------------------------------구매내역 예약중/거래완료 조회 기능메서드---------------------------------
	public List<Olderproduct> buyViewPro(String id,String buySel){
		List<Olderproduct> plist = new ArrayList<Olderproduct>();
		String sql = "SELECT * FROM olderproduct p, reserve r\r\n"
					+ "WHERE p.productno = r.productno\r\n"
					+ "AND r.id=?\r\n"
					+ "AND p.dealstat=?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, buySel);
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

//-------------------------------- main()-----------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
