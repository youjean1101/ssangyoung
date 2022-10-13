package javaexp.z01_homework;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Emp;
import javaexp.a13_database.vo.Vo;

public class A25_1012 {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	/*
	public void empListMaxSalPrint() {
		try {
			con = DB.con();
			
			String sql = "SELECT *\r\n"
						+ "FROM emp01\r\n"
						+ "WHERE sal IN (\r\n"
						+ "	SELECT max(sal)\r\n"
						+ "	FROM emp01\r\n"
						+ "	GROUP BY deptno)";
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
				System.out.print(rs.getInt("deptno")+"\n");
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
	*/
	public List<Vo> empSchList(Vo sch){
		List<Vo> list = new ArrayList<Vo>();
		try {
			con = DB.con();
			String sql = "SELECT deptno, empno, ename, job, sal\r\n"
					+ "FROM emp01\r\n"
					+ "WHERE sal BETWEEN "+sch.getFrSal()+" AND "+sch.getToSal();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Emp e = new Emp(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getDouble(4),
							rs.getInt(5)							
						);
			}
		} catch (SQLException e) {
			System.out.println("DB관련 예외:"+ e.getMessage());
		}catch (Exception e) {
			System.out.println("일반예외:"+ e.getMessage());
		} 
		return list;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A25_1012 dao = new A25_1012();
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 부서번호:");
		int deptno = sc.nextInt();
		System.out.print("검색할 사원번호:");
		int empno = sc.nextInt();
		sc.nextLine();
		System.out.print("검색할 사원명:");
		String ename = sc.nextLine();
		System.out.print("검색할 직책:");
		String job = sc.nextLine();
		System.out.print("검색할 급여:");
		int sal = sc.nextInt();
	
		System.out.println("# 검색 결과 #");
		List<Vo> voList = dao.empSchList(new Vo(deptno,empno, ename,job, sal));
		for(Vo e:voList) {
			System.out.print(e.getDeptno()+"\t");
			System.out.print(e.getEmpno()+"\n");
			System.out.print(e.getEname()+"\n");
			System.out.print(e.getJob()+"\n");
			System.out.print(e.getSal()+"\n");
		}
		
	}
}

	/*
	 2022-10-12
	[1단계:개념] 1. 데이터베이스의 연결 공통 객체 생성에 필요한 객체들과 정보를 소스를 통해 설명하세요.
	[1단계:개념] 2. select문을 통해서 데이터를 가져와서 출력할려고 한다. 객체들간의 연관관계를 기술하세요.
	[1단계:코드] 3. 부서별 최고 급여자를 sql를 만들고 이것을 출력하는 기능메서드를 만들고 출력처리하세요.
	
	[1단계:개념] 4. ResultSet 객체의 기능메서드를 기능별로 분류하여 기술하세요.
	[1단계:개념] 5. Dao의 자원해제 순서와 방법을 기술하세요
	[1단계:순서] 6. 검색조건에 대한 dao 처리를 위하여 처리되는 순서를 기술하세요.
	[1단계:코드] 7. salgrade테이블을 등급별, 급여별 데이터를 검색할려고 한다. Dao에 추가하여 처리하세요.
	
	[1단계:코드] 8. select deptno, empno, ename, job, sal 
	         from emp01 where sal between @@@ and @@#
	      를 처리할려고 한다. VO를 만들고 ArrayList<VO>로 리턴한 결과를 처리하세요.
	 */

