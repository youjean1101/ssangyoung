package javaexp2.a01_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class A01_Dao {
//	--[1단계:실습] 9. javaexp2프로젝트를 만들어, javaexp2.a01_database 패키지와 
//	-- A01_Dao.java를 만들어 연결처리하세요.  
//	--처리한 내용캡쳐하시고, java 소스 코드를 text를 붙여주세요.
	private static Connection con;
	
	public static void setConnection() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("오타확인:"+e.getMessage());
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info,"scott","tiger");
		}
	
	public static void main(String[] args) {
		try {
			setConnection();
			System.out.println("접속성공!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("접속에러:"+e.getMessage());
		}

	}

}
