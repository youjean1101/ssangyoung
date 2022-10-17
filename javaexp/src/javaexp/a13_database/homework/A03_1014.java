package javaexp.a13_database.homework;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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

	[1단계:확인] * 3. 사원명과 부서명의 통합테이블 EmpDept100 테이블을 복사 만들고, 해당 정보를 메서드를 만들고 데이터를 입력하세요.
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
	//정답
	// 1. 테이블 만들기
//		CREATE TABLE EmpDept100
//		AS SELECT e.*, dname, loc
//		FROM emp e, dept d
//		WHERE e.deptno = d.deptno
	// 2. sql 만들기
	// 3. 입력한 Vo객체 만들기
	// 4. 기능 메서드 선언 메서드 선언
	// 5. 입력 처리 코드
//		public EmpDept100_as(String ename, String job, int mgr, String hiredateS, double sal, double comm, String dname,
//		String loc)
		public void insertEmpDept(EmpDept100_as ins) {
			String sql ="INSERT INTO empdept100 values(empdept100_seq.nextval, '"+ins.getEname()+"',"
					+ " '"+ins.getJob()+"', "+ins.getMgr()+",\r\n"
					+ "	to_date('"+ins.getHiredateS()+"','YYYYMMDD'),\r\n"
					+ ins.getSal()+","+ins.getComm()+", '"+ins.getDname()+"', '"+ins.getLoc()+"')";
		
		 System.out.println("입력:");
		 System.out.println(sql);
		 
		 try {
			con=DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.commit();
			System.out.println("등록성공");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback에러:"+e1.getMessage());
			}
		}catch(Exception e) {
			System.out.println("일반에러:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
		}
		
		
	/*
	 
	[1단계:확인] *
	4. member100(아이디, 패스워드, 이름, 권한, 포인트, 등록일) 만들고, 데이터를 등록 후, 조회하는 메서드를 선언 및 출력하세요.
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
				System.out.println("등록성공");
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
//		정답
	// 1. 테이블 만들기
	// 2. sql 만들기
	// 3. 입력한 Vo객체 만들기
	// 4. 기능 메서드 선언 메서드 선언
	// 5. 입력 처리 코드
		public void memberInsert_as(Member100_as ins) {
			String sql = "INSERT INTO member100_as values('"+ins.getId()+"','"+ins.getPass()+"','"+ins.getName()+"','"+ins.getAuth()
					+"',"+ins.getPoint()+",sysdate)";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				System.out.println("등록성공");
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
		
		public List<Member100_as> memberList(Member100_as ins) {
			List<Member100_as> list = new ArrayList<Member100_as>();
			String sql ="SELECT * FROM member100_as\r\n"
					+ "WHERE id LIKE '%'||'"+ins.getId()+"'||'%'\r\n"
					+ "OR name LIKE '%'||'"+ins.getName()+"'||'%'";
		
			 System.out.println("입력:");
			 System.out.println(sql);
			 
			 try {
				con=DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					list.add(new Member100_as(
								rs.getString("id"),
								rs.getString("pass"),
								rs.getString("name"),
								rs.getString("auth"),
								rs.getInt("point"),
								rs.getDate("regdate")
							
							));
				}
				System.out.println("조회 건수:"+list.size());
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			}catch(Exception e) {
				System.out.println("일반에러:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
			 return list;
		}
		
		/*
		[1단계:확인]* 5. 위 member100테이블을 기준으로 아이디, 패스워드를 입력(Scanner)받아 select문으로 
		         데이터를 조회하여 로그인 성공 여부를 출력하는 Dao기능메서드를 만드세요.
		*/
		
		public List<vo_member100> memberselect(vo_member100 sel) {
			List <vo_member100> list = new ArrayList<vo_member100>();
			
			String sql = "SELECT * \r\n"
					+ "FROM member100\r\n"
					+ "WHERE id = '"+sel.getId()+"'\r\n"
					+ "AND passwd = '"+sel.getPasswd()+"'";
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					list.add( new vo_member100(
								rs.getString("id"),
								rs.getString("passwd"),
								rs.getString("name"),
								rs.getString("auth"),
								rs.getInt("point"),
								rs.getString("makedate")
							));
				}
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
			if(list.size()>0) {
				System.out.println("로그인이 정상적으로 되었습니다.");
			}else {
				System.out.println("등록된 회원이 아닙니다.");
			}
			return list;
		}
		
		//정답
		public boolean login(Member100_as sch) {
			boolean isLogin = false;
			String sql ="SELECT * FROM member100_as where id = '"+sch.getId()+
						"'and pass = '"+sch.getPass()+"' ";

//			 System.out.println("조회:");
//			 System.out.println(sql);
			 
			 try {
				con=DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				isLogin = rs.next();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rollback에러:"+e1.getMessage());
				}
			}catch(Exception e) {
				System.out.println("일반에러:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
			 return isLogin;
		}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_1014 dao = new A03_1014();
		dao.salgradeAllPrint();
		dao.empdeptAllPrint();
		
//		dao.empdeptInsert(new vo_empDept100(1000, "홍길동", "사원", 7902, "2022-10-14", 3000, 500, 20, "RESEARCH", "인천"));
		dao.empdeptAllPrint();
		
		
//		dao.memberInsert(new vo_member100("admin","1234","홍길동","관리자",10000,"2022/10/14"));
//		dao.memberInsert(new vo_member100("himan","5678","마길동","일반",100,"2022/10/13"));
//		dao.memberInsert(new vo_member100("higirl","9101","이길동","일반",300,"2022/10/12"));
//		dao.memberInsert(new vo_member100("goodman","1121","김길동","일반",200,"2022/10/11"));
		dao.memberAllprint();
//		dao.memberselect(new vo_member100("admin","1234"));
		
		Scanner sc = new Scanner(System.in);
//		System.out.print("아이디: ");
//		String id = sc.nextLine();
//		System.out.print("패스워드: ");
//		String passwd = sc.nextLine();
//		
//		List<vo_member100> memberList = dao.memberselect(new vo_member100(id,passwd));
//		for(vo_member100 v:memberList) {
//			System.out.print("회원명: "+v.getName()+"\t");
//			System.out.print("아이디: "+v.getId()+"\t");
//		}
		//blic EmpDept100_as(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm,
		//String dname, String loc) 
//		EmpDept100_as ins = new EmpDept100_as(
//				"마길동","대리",7800,"20221001",4000,1000,"회계", "서울 신림동");
//				dao.insertEmpDept(ins);
////				dao.memberInsert_as(new Member100_as("goodMan","8888","오길동","일반사용자",1000,null));
//				for(Member100_as mem:dao.memberList(new Member100_as("",""))) {
//					System.out.print(mem.getId()+"\t");
//					System.out.print(mem.getName()+"\t");
//					System.out.print(mem.getAuth()+"\n");
//				}
		
		Member100_as mLogin = new Member100_as();
		boolean isFirst = true;
		do {
			if(!isFirst) {
				System.out.println("로그인 실패! 다시~");
			}
			System.out.println("# 로그인 #");
			System.out.println("아이디를 입력하세요:");
			String id = sc.nextLine();
			System.out.println("패스워드를 입력하세요:");
			String pass = sc.nextLine();
			mLogin.setId(id);
			mLogin.setPass(pass);
			isFirst=false;
		}while(!dao.login(mLogin)); { // do문은 해당 데이터가 false
			System.out.println("로그인 성공!!");
		}		
		
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
class EmpDept100_as{
	 private int empno;
	 private String ename;
	 private String job;
	 private int mgr;
	 private String hiredateS;
	 private Date hiredate;
	 private double sal;
	 private double comm;
	 private String dname;
	 private String loc;
	 //기본생성자
	 // 조회를 위한 생성자 : hiredateS 삭제
	 // 입력을 위한 생성자 : empno, hiredate 삭제
	public EmpDept100_as() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpDept100_as(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm,
			String dname, String loc) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.dname = dname;
		this.loc = loc;
	}
	public EmpDept100_as(String ename, String job, int mgr, String hiredateS, double sal, double comm, String dname,
			String loc) {
		super();
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredateS = hiredateS;
		this.sal = sal;
		this.comm = comm;
		this.dname = dname;
		this.loc = loc;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}
	public String getHiredateS() {
		return hiredateS;
	}
	public void setHiredateS(String hiredateS) {
		this.hiredateS = hiredateS;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public double getComm() {
		return comm;
	}
	public void setComm(double comm) {
		this.comm = comm;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
}
class Member100_as{
	private String id;
	private String pass;
	private String name;
	private String auth;
	private int point;
	private Date regdate;
	public Member100_as() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member100_as(String id, String pass, String name, String auth, int point, Date regdate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.point = point;
		this.regdate = regdate;
	}
	
	public Member100_as(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}

