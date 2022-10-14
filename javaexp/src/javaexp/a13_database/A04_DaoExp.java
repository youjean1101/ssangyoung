package javaexp.a13_database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.vo.Emp;
import javaexp.a13_database.vo.Person;
import javaexp.a13_database.vo2.Emp01;
import javaexp.a13_database.vo2.Emp02;
import javaexp.a13_database.vo2.Emp03;
import javaexp.a13_database.vo2.Emp04;
import javaexp.a13_database.vo2.Emp05;

public class A04_DaoExp {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	/*
	 여러가지 sql을 통해 vo ==> 기능메서드 선언
	ex) 기능 메서드 선언 : 리턴값, 매개변수, 기본 객체 생성

	*/
	public List<Emp01> getSch01(int deptno){
	 	List<Emp01> list = new ArrayList<Emp01>();
	 	String sql = "SELECT deptno, ename, job, sal\r\n"
	 				+ "FROM EMP\r\n"
	 				+ "WHERE deptno ="+deptno;
	 	// 1. 연결
	 	try {
			con = DB.con();
			//2. 대화
			stmt = con.createStatement();
			//3. 결과
			rs = stmt.executeQuery(sql);
			// 4. while 처리 - 이해를 바탕으로 코딩
			while(rs.next()) {
				Emp01 e = new Emp01(rs.getInt("deptno"),
									rs.getString("ename"),
									rs.getString("job"),
									rs.getDouble("sal"));
				list.add(e);
			}
			System.out.println("데이터의 건수:"+list.size());
		} catch (SQLException e) {
			System.out.println("DB 관련 예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
	 	return list;
	 }
	
	public List<Emp02> getSch02(Emp02 sch){
		List<Emp02> list = new ArrayList<Emp02>();
		String sql = "SELECT empno, ename, sal\r\n"
				+ "FROM emp\r\n"
				+ "WHERE ename LIKE '%'||'"+sch.getEname()+"'||'%'\r\n"
				+ "AND sal BETWEEN'"+sch.getFrSal()+"' AND '"+sch.getToSal()+"'";
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			//4. while 처리 - 이해를 바탕으로 코딩
			//	while문과 resultSet처리 후, getSch02()하고 손들기..
			while(rs.next()) {
				Emp02 e = new Emp02(rs.getInt("empno"),
									rs.getString("ename"),
									rs.getDouble("sal"));
				list.add(e);
			}
		} catch (SQLException e) {
			System.out.println("DB 관려 예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
	
	
	
	//기능메서드 - sql 처리까지
	public List<Emp03> getSch03(Emp03 sch){
		List<Emp03> list = new ArrayList<Emp03>();
		String sql = "SELECT empno, ename, job, deptno\r\n"
					+ "FROM emp\r\n"
					+ "WHERE job LIKE '%'||'"+sch.getJob()+"'||'%'\r\n"
					+ "OR deptno = "+sch.getDeptno();
		// 1. 연결
				try {
					con = DB.con();
					// 2. 대화
					stmt = con.createStatement();
					// 3. 결과
					rs = stmt.executeQuery(sql);
					//4. while 처리 - 이해를 바탕으로 코딩
					//	while문과 resultSet처리 후
					while(rs.next()) {
						list.add( 
								new Emp03(
										rs.getInt("empno"),
										rs.getString("ename"),
										rs.getString("job"),
										rs.getInt("deptno")
									)
								);
					}
				} catch (SQLException e) {
					System.out.println("DB 관려 예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("일반예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
		return list;
	}
	
	public List<Emp04> getSch04(Emp04 sch){
		List<Emp04> list = new ArrayList<Emp04>();
		String sql = "SELECT dname, ename, hiredate, sal\r\n"
					+ "FROM emp e, dept d\r\n"
					+ "WHERE e.deptno = d.deptno\r\n"
					+ "AND dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
					+ "AND to_char(hiredate,'Q')='"+sch.getDiv()+"'";
		// 1. 연결
				try {
					con = DB.con();
					// 2. 대화
					stmt = con.createStatement();
					// 3. 결과
					rs = stmt.executeQuery(sql);
					//4. while 처리 - 이해를 바탕으로 코딩
					while(rs.next()) {
						Emp04 e = new Emp04(rs.getString("dname"),
											rs.getString("ename"),
											rs.getDate("hiredate"),
											rs.getDouble("sal"));
						list.add(e);
					}
				} catch (SQLException e) {
					System.out.println("DB 관려 예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("일반예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
		return list;
	}
	// select * from emp where empno = 7000;
	// 1. vo
	//	private int empno;
	//	private String ename;
	//	private String job;
	//	private int mgr;
	//	private Date hiredate;
	//	private double sal;
	//	private double comm;
	//	private int deptno;

	// 2. 기능메서드
	public Emp05 getEmpSch05(int empno){
		Emp05 emp = null;
		String sql = "select * from emp where empno='"+empno+"'";
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			//4. while 처리 - 이해를 바탕으로 코딩
			// 단일 데이터의 경우 한번만 호출 while ==> if
			if(rs.next()) {
				emp = new Emp05(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
								);
			}
		} catch (SQLException e) {
			System.out.println("DB 관려 예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return emp;
	}
	private void insertPerson(Person ins) {
		String sql = "INSERT INTO person values('"+ins.getName()+"',"+ins.getAge()+",'"+ins.getLoc()+"')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			System.out.println("등록건수:"+stmt.executeUpdate(sql));
//			stmt.executeUpdate(sql);
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
	public void personList() {
		try {
			con = DB.con();
			String sql = "SELECT * FROM person";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.print(rs.getString("name")+"\t");
				System.out.print(rs.getInt("age")+"\t");
				System.out.print(rs.getString("loc")+"\n");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_DaoExp dao = new A04_DaoExp();
		System.out.println("#emp1#");
		List<Emp01> list = dao.getSch01(10);
		for(Emp01 e:list) {
			System.out.print(e.getDeptno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("#emp2#");
		List<Emp02> list2 = dao.getSch02(new Emp02("A",1000,3000));
		for(Emp02 e:list2) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("#emp3#");
		List<Emp03> list3 = dao.getSch03(new Emp03("",10));
		for(Emp03 e:list3) { //empno, ename,job,deptno
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getDeptno()+"\n");
		}
		System.out.println("#emp4#");
		List<Emp04> list4 = dao.getSch04(new Emp04("SALES","1"));
		for(Emp04 e:list4) { //dname, ename, hiredate, sal
			System.out.print(e.getDname()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getHiredate()+"\t");
			System.out.print(e.getSal()+"\n");
		}
				
		System.out.println("#emp5#");
		Emp05 empOne = dao.getEmpSch05(7369);
		if(empOne!=null) {
			System.out.print(empOne.getEmpno()+"\t");
			System.out.print(empOne.getEname()+"\t");
			System.out.print(empOne.getJob()+"\n");
		}else {
			System.out.println("데이터 없음");
		}
		System.out.println("#person테이블등록#");
		dao.insertPerson(new Person("홍길동",25,"서울 신림"));
		dao.personList();
	}

}
