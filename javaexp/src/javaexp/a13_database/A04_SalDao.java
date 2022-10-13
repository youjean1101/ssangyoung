package javaexp.a13_database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A04_SalDao {
	
// [1단계:코드] 7. salgrade테이블을 등급별, 급여별 데이터를 검색할려고 한다. Dao에 추가하여 처리하세요.
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	public void empListSalGradePrint() {

		try {
			con = DB.con();
			
			String sql = "SELECT * FROM salgrade";
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			System.out.println("grade\tlosal\thisal");
			while(rs.next()) {
				System.out.print(rs.getInt("grade")+"\t");
				System.out.print(rs.getInt("losal")+"\t");
				System.out.print(rs.getInt("hisal")+"\n");
			}
			
			DB.close(rs, stmt, con);

		} catch (SQLException e) {
			
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs!=null) rs=null;
			if(stmt!=null) stmt=null;
			if(con!=null) con=null;
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_SalDao dao = new A04_SalDao();
		dao.empListSalGradePrint();
	}

}
