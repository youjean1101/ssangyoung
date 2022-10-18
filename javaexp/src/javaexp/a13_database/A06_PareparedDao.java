package javaexp.a13_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.vo.Dept;

public class A06_PareparedDao {
	// 전역변수 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// 조회 처리
	public List<Dept> getDeptList(Dept sch){
		List<Dept> dlist = new ArrayList<Dept>();
		String sql = "SELECT * FROM dept100\r\n"
				+ "WHERE dname LIKE '%'|| ? ||'%'\r\n"
				+ "AND loc LIKE '%'|| ? ||'%'";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			// 위 sql의 ?에 해당하는 문자열을 mapping해서 데이터를 전달
			// 위 형태로 ?로 설정하는 해당 데이터 형태만 입력이 되지,
			// sql injection이 처리되지 않는다.
			// 2. ?로 같은 유형을 sql을 먼저 서버에 전달되기에 한번 컴파일된 이후로는
			//		빠르게 수행될 수 있다.
			// pstmt.setString(1번부터 ?에 해당하는 순서, 데이터 );
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			rs = pstmt.executeQuery(); //sql을 넣지 않는다!!(주의)
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt("deptno"),
									rs.getString("dname"),
									rs.getString("loc")
						));
			}
			System.out.println("데이터 건수:"+dlist.size());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		
		return dlist;
	}
	public void insertDept(Dept d){
		String sql = "INSERT INTO dept100 values(?,?,?)"; 
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, d.getDeptno());
			pstmt.setString(2, d.getDname());
			pstmt.setString(3, d.getLoc());
			System.out.println("등록건수:"+pstmt.executeUpdate());
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러: "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A06_PareparedDao dao = new A06_PareparedDao();
		dao.insertDept(new Dept(11,"총무","부산"));
		for(Dept d: dao.getDeptList(new Dept("",""))) {
			System.out.print(d.getDeptno()+"\t");
			System.out.print(d.getDname()+"\t");
			System.out.print(d.getLoc()+"\n");
		}
	}
}
// ex) 부서 등록 처리(PreparedStatement)

