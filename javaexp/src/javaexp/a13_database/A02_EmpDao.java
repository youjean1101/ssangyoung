package javaexp.a13_database;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.vo.Emp;

public class A02_EmpDao {
	//1. 필드 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	//2. 사원정보 조회 기능 메서드(전체조회 및 출력)
	public void empListAllPrint() {
		// 1) 연결객체 메모리 할당. : ex) 통신망, 특정한 상대방과 통화 연결
		//		- SQL 예외 처리		기타에러에 대한
		try {
			con = DB.con();
			// 2) 대화객체 생성		ex) 연결된 내용으로 대화를 시작
			String sql = "SELECT * FROM emp100";
			stmt = con.createStatement();
			// 3) 결과객체 받기		ex) 대화의 내용 중에 결과 데이터가 있는 경우 select 
			//		- while() 통해 결과객체 내용 출력
			rs = stmt.executeQuery(sql);
			while(rs.next()) {// 행단위로 커서 변경
				// 열단위 컬럼 접근 rs.get데이터유형("컬럼명")
				System.out.println(rs.getInt("empno")+"\t");
				System.out.println(rs.getString("ename"));
			}
			// 4) 자원해제			ex) 전화 끊기
//			DB.close(rs, stmt, con);	// finally 로 이동
//			rs.close();
//			stmt.close();
//			con.close();
			
			// 5) SQL예외 처리 상세 및 기타 예외 처리하기 ex) 통신 장애시 처리 방법
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
	
	//3. 사원정보 검색조건(검색조건조회 및 출력)
	//	- sql에 특정 조건을 매개변수로 하여 처리하는 경우
	public void empSchList(String ename, String job) {
//		1. 연결 - 예외 처리1
		try {
			con = DB.con();
//			2. 대화
			String sql = "SELECT * FROM emp100\r\n"
					+ "WHERE ename LIKE '%'||'"+ename+"'||'%'\r\n"
					+ "AND job LIKE '%'||'"+job+"'||'%'";
			stmt = con.createStatement();
//			3. 결과
			rs = stmt.executeQuery(sql);
//			 while문 처리..
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
//			4. 자원해제 - 예회 처리2
//			DB.close(rs, stmt, con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("기타예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}

	}
	// 객체로 검색 처리
	// 1. Emp 만들고 - ename, job 선언 후, 처리하기.
		
	
	//3. 사원정보 검색조건(검색조건조회 및 출력)
		//	- sql에 특정 조건을 매개변수로 하여 처리하는 경우
		public void empSchList(Emp sch) {
	//		1. 연결 - 예외 처리1
			try {
				con = DB.con();
	//			2. 대화
				String sql = "SELECT * FROM emp100\r\n"
						+ "WHERE ename LIKE '%'||'"+sch.getEname()+"'||'%'\r\n"
						+ "AND job LIKE '%'||'"+sch.getJob()+"'||'%'";
				stmt = con.createStatement();
	//			3. 결과
				rs = stmt.executeQuery(sql);
	//			 while문 처리..
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
	//			4. 자원해제 - 예외 처리2
//				DB.close(rs, stmt, con); //finally에위치
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
		// 4. 사원정보 List<Emp> 검색(검색조건 처리 및 List로 리턴 처리)
//		1) sql ==> VO
//		SELECT empno, ename, job, mgr, hiredate, sal, comm,deptno
//		FROM emp100
//		WHERE ename LIKE '%'||''||'%'
//		AND job LIKE '%'||''||'%'
//		AND sal BETWEEN 1000 AND 2000
//		2) 메서드 선언 리턴유형, 매개변수, 초기 리턴할 객체선언
		public List<Emp> getEmpSch(Emp sch){
			List<Emp> list = new ArrayList<Emp>();
			//1. DB연결
			try {
				con = DB.con();
			//2. 대화
				String sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm,deptno\r\n"
						+ "FROM emp100\r\n"
						+ "WHERE ename LIKE '%'||'" + sch.getEname() + "'||'%'\r\n"
						+ "AND job LIKE '%'||'" + sch.getJob() + "'||'%'\r\n"
						+ "AND sal BETWEEN '" + sch.getFrSal() + "' AND '" + sch.getToSal()+"'";
				// ORA-00920 : invalid relational operator 이 에러가
				// 나는 분들은 아래와 같이 출력해보시면 sql구문의 에러가 보일겁니다.
				// 적당하게 위 sql 문자열에 띄워쓰기가 필요할 겁니다.
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				// empno, ename, job, mgr, hiredate, sal, comm,deptno
				while(rs.next()) {
					Emp e = new Emp(
								rs.getInt("empno"),
								rs.getString(2),
								rs.getString(3),
								rs.getInt(4),
								rs.getDate(5),
								rs.getDouble(6),
								rs.getDouble(7),
								rs.getInt(8)							
							);
					list.add(e);	
				}
				System.out.println("데이터건수:"+list.size());
			} catch (SQLException e) {
				System.out.println("DB관련 예외:"+ e.getMessage());
			} catch (Exception e) {
				System.out.println("일반예외:"+ e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
			return list;
		}
	public void insertEmp(Emp insert) {
		String sql = "insert into emp100 \r\n"
				+ "values(emp100_seq.nextval, '"+insert.getEname()+"', '"+insert.getJob()+"', "
				+ insert.getMgr()+",\r\n"
				+ "to_date('"+insert.getHiredateS()+"','YYYY/MM/DD'), "+insert.getSal()+", "
				+ insert.getComm()+","+insert.getDeptno()+")";
		System.out.println("등록 sql");
		System.out.print(sql);
		try {
			con = DB.con();
			// autocommit : false
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			int cnt = stmt.executeUpdate(sql);
			System.out.println("등록 데이터:"+cnt);
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 처리:"+e.getMessage());
			try { // 
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
	/* main()
	 Emp upt = new Emp();
	 upt.setEname("오길동"); upt.setJob("대리"); upt.setSal(4200);
	 upt.setEmpno("1002");
	 dao.updateEmp(upt);
	 dao.deleteEmp(7369);
	 */
		
	public void updateEmp(Emp upt) {
		String sql =  "update emp100\r\n"
				+ "		set ename = '"+upt.getEname()+"',\r\n"
				+ "			job = '"+upt.getJob()+"',\r\n"
				+ "			sal = "+upt.getSal()+"\r\n"
				+ "		where empno = "+upt.getEmpno();
		System.out.println("수정 sql");
		System.out.print(sql);
		try {
			con = DB.con();
			// autocommit : false
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			int cnt = stmt.executeUpdate(sql);
			System.out.println("수정 데이터:"+cnt);
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 처리:"+e.getMessage());
			try { // 
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

	public void deleteEmp(int empno) {
		String sql = "delete emp100\r\n"
				+ "	where empno = "+empno;
		System.out.println("삭제 sql");
		System.out.print(sql);
		try {
			con = DB.con();
			// autocommit : false
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			int cnt = stmt.executeUpdate(sql);
			System.out.println("삭제 데이터:"+cnt);
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 처리:"+e.getMessage());
			try { // 
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
		A02_EmpDao dao = new A02_EmpDao();
//		 Emp upt = new Emp();
//		 upt.setEname("오길동"); upt.setJob("대리"); upt.setSal(4200);
//		 upt.setEmpno(1002);
//		 dao.updateEmp(upt);
//		 dao.deleteEmp(7369);
//		dao.insertEmp("");
//		dao.empListAllPrint();
//		dao.empSchList("", "");
		dao.empSchList("A", "MAN");
//		dao.empSchList(new Emp("","MAN"));
		/*
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 사원명:");
		String ename = sc.nextLine();
		System.out.print("검색할 직책명:");
		String job = sc.nextLine();
		System.out.print("검색할 급여범위 시작:");
		double frsal = sc.nextDouble();
		System.out.print("검색할 급여범위 마지막:");
		double tosal = sc.nextDouble();
		System.out.println("# 검색 내용 #");
		System.out.println("사원명:"+ename);
		System.out.println("직책명:"+job);
		System.out.println("급여:"+frsal+"~"+tosal);
		System.out.println("# 검색 결과 #");
		List<Emp> empList = dao.getEmpSch(new Emp(ename,job,frsal,tosal));
		//외부에서 불러와서 검색된 내용
		for(Emp e:empList) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\n");
			System.out.print(e.getJob()+"\n");
			System.out.print(e.getSal()+"\n");
		*/
//		System.out.println("insert문");
//		Emp ins = new Emp();
//		ins.setComm(100);
//		ins.setDeptno(10);
//		ins.setEname("등록맨");
//		ins.setHiredateS("2022/12/14");
//		ins.setJob("사원");
//		ins.setMgr(7900);
//		ins.setSal(4000);
//		dao.insertEmp(ins);
//		
//			List<Emp> empList = dao.getEmpSch(new Emp("","",1000,5000));
//			//외부에서 불러와서 검색된 내용
//			for(Emp e:empList) {
//				System.out.print(e.getEmpno()+"\t");
//				System.out.print(e.getEname()+"\t");
//				System.out.print(e.getJob()+"\t");
//				System.out.print(e.getSal()+"\n");
		}		
	}