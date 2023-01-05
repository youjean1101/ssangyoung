package webproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Alert {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int insertAlert(AlertVO d) {
		String sql = "INSERT INTO alert values('alert-'||alert_seq.nextval,?,?,sysdate,?,?,?)";
		int Success = 0;
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getId());
			pstmt.setString(2, d.getAlertcontent());
			pstmt.setString(3, d.getMoveurl());
			pstmt.setInt(4, d.getQnano());
			pstmt.setInt(5, d.getProductno());


			Success= pstmt.executeUpdate();
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
		return Success;
	}
	
	//=============================================================================
	public int countMAlert(AlertVO alert){
		int count=0;
		String sql = "SELECT count(*) FROM alert\r\n"
				+ "WHERE id=? or id=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,alert.getId());
			pstmt.setString(2,alert.getName());
			rs = pstmt.executeQuery();
			rs.next(); 
			count= rs.getInt(1);
			System.out.println("카운트:"+count);
					
			
		
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}		
		return count;
	}
	
	public List<AlertVO> getAlertList(AlertVO alert){
	      List<AlertVO> tlist = new ArrayList<AlertVO>();
	      String sql = "SELECT * FROM alert\r\n"
	      		+ "WHERE id=?\r\n"
	      		+ "OR id = ?";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, alert.getId());
	         pstmt.setString(2, alert.getName());
	         rs = pstmt.executeQuery(); 
	         while(rs.next()) {
	        	 int qnano= rs.getInt("qnano");
	        	 int productno= rs.getInt("productno");
	        	 int number = 0;
	        	 String messege = "";
	        	 if(qnano==0) {
	        		 number=productno;
	        		 messege="판매번호";
	        	 }else if(productno==0){
	        		 number=qnano;
	        		 messege="문의번호";
	        	 }
	        	 	
	        	 	
	        	 	
	            tlist.add(new AlertVO(
	            		   rs.getString("alertno"),
	                       rs.getString("alertcontent"),
	                       rs.getDate("alertdate"),
	                       rs.getString("moveurl"),
	                       number,
	                       messege
	            		));
	         }
	         System.out.println("데이터 건수:"+tlist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return tlist;
	   }
	
	//======================================================================
	public int DeleteAlert(AlertVO d) {
		 String sql = "DELETE alert\r\n"
		 		+ "WHERE alertno=?";
		 int Success2 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, d.getAlertno());

			 Success2 = pstmt.executeUpdate();
				
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
		 return Success2;
	 }
	public static void main(String[] args) {
		
	}

}
