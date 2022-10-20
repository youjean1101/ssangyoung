package javaexp.a13_database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javaexp.a13_database.vo.Dept;

public class A03_DeptDao {
	//  공통 필드 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	// 출력 기능메서드
	public void showDepAll() {
		// 연결객체
		try {
			con = DB.con();
			// 대화객체
			stmt = con.createStatement();
			// 결과객체
			String sql = "SELECT * FROM dept100";
			rs = stmt.executeQuery(sql);
			// while문처리 - 부서번호 출력 select * FROM dept100
			while(rs.next()) {
				// String s = ""+25; (O) : 문자열로 다 표현하는 건 가능
				// int num = "홍길동"; (X)
				// 데이터 유형은 가능한한 맞게 처리하여야 한다.
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
			} 
			//자원해제 : 제일 마지막에 생성 ==> 가장 최초 생성
			rs.close();	// 중간에 예외가 발생해서 자원해제가 안되는 경우.
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외 처리:"+e.getMessage());
		}finally { // 예외 여부에 상관없이 처리할 내용
			if(rs!=null) rs = null;
			if(stmt!=null) stmt = null;
			if(con!=null) con = null;
		}
		System.out.println("종료!!");
	}

//	select * 
//	FROM dept100 
//	where dname like '%'||'O'||'%'
//	AND loc LIKE '%' ||''||'%'	
//	1. vo 만들기
//	2. 메서드 선언
	public void deptSch(String dname, String loc) {
//		3. 연결
		try {
			con = DB.con();
//			4. 대화 - sql
			String sql = "select * \r\n"
					+ "FROM dept100 \r\n"
					+ "where dname like '%'||'"+dname+"'||'%'\r\n"
					+ "AND loc LIKE '%' ||'"+loc+"'||'%'";
			stmt = con.createStatement();
//			5. 결과
			rs = stmt.executeQuery(sql);
//				while()
			while(rs.next()) {
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
			}
//			6. 자원해제 및 기타 예외
		DB.close(rs, stmt, con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("기타예외:"+e.getMessage());
		}
}
	
	//	select * 
	//	FROM dept100 
	//	where dname like '%'||'O'||'%'
	//	AND loc LIKE '%' ||''||'%'	
	//	1. vo 만들기
	//	2. 메서드 선언
		public void deptSch(Dept sch) {
	//		3. 연결
			try {
				con = DB.con();
	//			4. 대화 - sql
				String sql = "select * \r\n"
						+ "FROM dept100 \r\n"
						+ "where dname like '%'||'"+sch.getDname()+"'||'%'\r\n"
						+ "AND loc LIKE '%' ||'"+sch.getLoc()+"'||'%'";
				stmt = con.createStatement();
	//			5. 결과
				rs = stmt.executeQuery(sql);
	//				while()
				while(rs.next()) {
					System.out.print(rs.getInt("deptno")+"\t");
					System.out.print(rs.getString("dname")+"\t");
					System.out.print(rs.getString("loc")+"\n");
				}
	//			6. 자원해제 및 기타 예외
			DB.close(rs, stmt, con);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("기타예외:"+e.getMessage());
			}
	}
		public void insertDept(Dept ins){
			String sql = "INSERT INTO dept100\r\n"
					+ "values("+ins.getDeptno()+",'"+ins.getDname()+"','"+ins.getLoc()+"')";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
//				int cnt = stmt.executeUpdate(sql);
//				System.out.println("등록 건수:"+cnt);
				con.commit();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB 처리:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
		


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 객체 생성
		A03_DeptDao dao = new A03_DeptDao();
		// 부서정보 호출 기능메서드
//		dao.showDepAll();
//		dao.deptSch("SALES", "");
		
		System.out.println("#dept insert문#");
		dao.insertDept(new Dept(12,"회계","대전"));
		dao.deptSch("", "");
		//외부에서 불러와서 검색된 내용
	}
}
