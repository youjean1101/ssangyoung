package a01_diexp.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
// 연결 처리 객체
// DB.con();
//a01_diexp.backend.DB
//DB(String driver,String ip, String port, String sid, String user, String pass)
public class DB {
	// 생성자를 통해서 지정된 DB연결정보 설정
	private static String driver;
	private static String ip;
	private static String port;
	private static String sid;
	private static String user;
	private static String pass;
	
	public DB() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DB(String driver,String ip, String port, String sid, String user, String pass) {
		super();
		this.driver = driver;
		this.ip = ip;
		this.port = port;
		this.sid = sid;
		this.user = user;
		this.pass = pass;
	}

	public static Connection con() throws SQLException {
		Connection con=null;
		// 1. 메모리 로딩
		try {
			Class.forName(driver);
			//System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 에러:"+e.getMessage());
		}
		// 2. 연결정보 처리.
		String info = "jdbc:oracle:thin:@"+ip+":"+port+":"+sid;
		con = DriverManager.getConnection(info,user,pass);
//		System.out.println("연결 성공");
		return con;
	}
	// DB.close(rs,stmt,con); 
	public static void close(ResultSet rs, 
						Statement stmt, Connection con) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("연결 종료 예외 발생:"+e.getMessage());
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("[ResultSet]:"+e1.getMessage());
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("[Statement]:"+e1.getMessage());
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("[Connection]:"+e1.getMessage());
				}
			}			
		}

		
	}
}
