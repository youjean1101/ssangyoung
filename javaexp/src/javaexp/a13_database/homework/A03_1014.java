package javaexp.a13_database.homework;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class A03_1014 {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	/*
	[1단계:확인] 2. 등급테이블의  salgrade1000 테이블을 복사 만들고, 해당 정보를 메서드를 만드세요.
	*/
	public void salgradeAllPrint() {
		try {
			con = DB.con();
			String sql = "SELECT * FROM salgrade1000";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.print(rs.getInt("grade")+"\t");
				System.out.print(rs.getDouble("losal")+"\t");
				System.out.print(rs.getDouble("hisal")+"\n");
			}
	
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
			if(rs!=null) rs=null;
			if(stmt!=null) stmt=null;
			if(con!=null) con=null;
		}
	}
	
	/*

	[1단계:확인] 3. 사원명과 부서명의 통합테이블 EmpDept100 테이블을 복사 만들고, 해당 정보를 메서드를 만들고 데이터를 입력하세요.
	-  empdept100 테이블에 데이터를 입력하는 문제입니다. 오늘 주로 다룬 내용..
	*/
	public void empdeptAllPrint() {
		try {
			con = DB.con();
			String sql = "SELECT * FROM EmpDept100";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.print(rs.getInt("empno")+"\t");
				System.out.print(rs.getString("ename")+"\t");
				System.out.print(rs.getString("job")+"\t");
				System.out.print(rs.getInt("mgr")+"\t");
				System.out.print(rs.getDate("hiredate")+"\t");
				System.out.print(rs.getDouble("sal")+"\t");
				System.out.print(rs.getDouble("comm")+"\t");
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
			if(rs!=null) rs=null;
			if(stmt!=null) stmt=null;
			if(con!=null) con=null;
		}
	}
	
		public void empdeptInsert(vo_empDept100 ins) {
			String sql = "INSERT INTO EmpDept100 values("+ins.getEmpno()+",'"+ins.getEname()+"','"+ins.getJob()
							+ "',"+ins.getMgr()+",'"+ins.getHiredateS()+"',"+ins.getSal()+","+ins.getComm()+","+
							ins.getDeptno()+",'"+ins.getDname()+"','"+ins.getLoc()+"')";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
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
	/*
	 
	[1단계:확인] 4. member100(아이디, 패스워드, 이름, 권한, 포인트, 등록일) 만들고, 데이터를 등록 후, 조회하는 메서드를 선언 및 출력하세요.
	*/
	public void memberAllprint() {
			try {
				con = DB.con();
				String sql = "SELECT * FROM member100";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					System.out.print(rs.getString(1)+"\t");
					System.out.print(rs.getString(2)+"\t");
					System.out.print(rs.getString(3)+"\t");
					System.out.print(rs.getString(4)+"\t");
					System.out.print(rs.getInt(5)+"\t");
					System.out.println(rs.getDate(6)+"\n");
				}
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
				if(rs!=null) rs=null;
				if(stmt!=null) stmt=null;
				if(con!=null) con=null;
			}
		}
	
		public void memberInsert(vo_member100 ins) {
			String sql = "INSERT INTO member100 values('"+ins.getId()+"','"+ins.getPasswd()+"','"+ins.getName()+"','"+
						ins.getAuth()+"',"+ins.getPoint()+",'"+ins.getMakedate()+"')";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				
			} catch (SQLException e) {
				System.out.println("DB 처리:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
		public void memberselect(vo_member100 sel) {
			String sql = "SELECT * \r\n"
						+ "FROM member100\r\n"
						+ "WHERE id = '"+sel.getId()+"'\r\n"
						+ "AND passwd = '"+sel.getPasswd()+"')";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				
			} catch (SQLException e) {
				System.out.println("DB 처리:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
		
		/*
	[1단계:확인] 5. 위 member100테이블을 기준으로 아이디, 패스워드를 입력(Scanner)받아 select문으로 
	         데이터를 조회하여 로그인 성공 여부를 출력하는 Dao기능메서드를 만드세요.
	*/

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_1014 dao = new A03_1014();
		dao.salgradeAllPrint();
		dao.empdeptAllPrint();
//		vo_empDept100 a = new vo_empDept100();
		
		dao.empdeptInsert(new vo_empDept100(1000, "홍길동", "사원", 7902, "2022-10-14", 3000, 500, 20, "RESEARCH", "인천"));
		dao.empdeptAllPrint();
		
		
		dao.memberInsert(new vo_member100("admin","1234","홍길동","관리자",200,"2022/10/14"));
		dao.memberAllprint();
		
		Scanner sc = new Scanner(System.in);
		System.out.print("아이디: ");
		String id = sc.nextLine();
		System.out.print("패스워드: ");
		String passwd = sc.nextLine();
		
		
		
		dao.memberselect(new vo_member100(id,passwd));
				
		
	}
}
	class salgrade1000{
		private int grade;
		private double losal;
		private double hisal;
		
		public salgrade1000() {
			super();
			// TODO Auto-generated constructor stub
		}

		public salgrade1000(int grade, double losal, double hisal) {
			super();
			this.grade = grade;
			this.losal = losal;
			this.hisal = hisal;
		}

		public int getGrade() {
			return grade;
		}

		public void setGrade(int grade) {
			this.grade = grade;
		}

		public double getLosal() {
			return losal;
		}

		public void setLosal(double losal) {
			this.losal = losal;
		}

		public double getHisal() {
			return hisal;
		}

		public void setHisal(double hisal) {
			this.hisal = hisal;
		}		
	}

