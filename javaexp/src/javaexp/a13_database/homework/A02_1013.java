package javaexp.a13_database.homework;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Emp;
//import java.sql.*; // 해당 패키지 하위 클래스 모두 import

public class A02_1013 {
		// 전역변수 선언(공통)
		private Connection con;
		private Statement stmt;
		private ResultSet rs;
		
		public List<vo_Emp01> getSch01(String div,String dname){
		 	List<vo_Emp01> list = new ArrayList<vo_Emp01>();
		 	String sql = "SELECT ename,dname, sal, grade\r\n"
		 			+ "FROM emp e, SALGRADE s ,DEPT d \r\n"
		 			+ "WHERE  sal BETWEEN losal AND hisal\r\n"
		 			+ "AND e.DEPTNO  = d.DEPTNO\r\n"
		 			+ "AND to_char(hiredate,'q') ='"+div+"'\r\n"
		 			+ "OR dname ='"+dname+"'";
	
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp01 e = new vo_Emp01(
										rs.getString("ename"),
										rs.getString("dname"),
										rs.getDouble("sal"),
										rs.getInt("grade"));
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public List<vo_Emp02> getSch02(vo_Emp02 sch){
		 	List<vo_Emp02> list = new ArrayList<vo_Emp02>();
		 	String sql = "SELECT  to_char(hiredate,'YY') yy, count(empno) cnt, max(sal) mxsal\r\n"
		 				+ "FROM EMP e \r\n"
		 				+ "GROUP BY to_char(hiredate,'YY')\r\n"
		 				+ "HAVING to_char(hiredate,'YY')='"+sch.getIphiredate()+"'";
	
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp02 e = new vo_Emp02(
										rs.getInt("yy"),
										rs.getInt("cnt"),
										rs.getDouble("mxsal"));
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public List<vo_Emp03> getSch03(vo_Emp03 sch){
		 	List<vo_Emp03> list = new ArrayList<vo_Emp03>();
		 	String sql = "SELECT ENAME , EMPNO,\r\n"
		 			+ "		mod(empno, 2) div, sal, \r\n"
		 			+ "		decode (mod(empno, 2),0,sal,sal*0.5) bonus, \r\n"
		 			+ "		nvl2(NULLIF(mod(empno,2),0),sal+(sal*0.5),sal*2) totsal\r\n"
		 			+ "FROM EMP e";
	
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp03 e = new vo_Emp03(
										rs.getString("ename"),
										rs.getInt("empno"),
										rs.getInt("div"),
										rs.getDouble("sal"),
										rs.getDouble("bonus"),
										rs.getDouble("totsal")
										);
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public List<vo_Emp04> getSch04(vo_Emp04 sch){
	 	List<vo_Emp04> list = new ArrayList<vo_Emp04>();
	 	String sql = "SELECT floor(months_between(sysdate, hiredate)/12) yy,\r\n"
		 			+ "mod(floor(MONTHS_BETWEEN(sysdate, hiredate)),12) mm\r\n"
		 			+ "FROM emp\r\n"
		 			+ "WHERE to_char(hiredate,'YYYY/MM/DD') LIKE '%'||'"+sch.getInputdate()+"'||'%'";
	 	try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				vo_Emp04 e = new vo_Emp04(
									rs.getInt("yy"),
									rs.getInt("mm")
									);
				list.add(e);
			}
		} catch (SQLException e) {
			System.out.println("DB 관련 예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
	 	return list;
	}
		public List<vo_Emp05> getSch05(vo_Emp05 sch){
		 	List<vo_Emp05> list = new ArrayList<vo_Emp05>();
		 	String sql = "SELECT * FROM emp \r\n"
		 			+ "WHERE to_char(hiredate, 'Q') in (\r\n"
		 			+ "SELECT to_char(hiredate, 'Q') \r\n"
		 			+ "FROM emp \r\n"
		 			+ "WHERE ename LIKE '%'||'"+sch.getEname()+"'||'%')\r\n";
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp05 e = new vo_Emp05(
										rs.getInt("empno"),
										rs.getString("ename"),
										rs.getString("job"),
										rs.getInt("mgr"),
										rs.getDate("hiredate"),
										rs.getDouble("sal"),
										rs.getDouble("comm"),
										rs.getInt("deptno")										
										);
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public List<vo_Emp06> getSch06(vo_Emp06 sch){
		 	List<vo_Emp06> list = new ArrayList<vo_Emp06>();
		 	String sql = "SELECT m.ENAME mgrname,e.ENAME ename, e.deptno, e.SAL  \r\n"
		 			+ "FROM EMP e ,emp m\r\n"
		 			+ "WHERE e.mgr=m.EMPNO\r\n"
		 			+ "AND m.ENAME = '"+sch.getEname()+"'";
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp06 e = new vo_Emp06(
										rs.getString("mgrname"),
										rs.getString("ename"),
										rs.getInt("deptno"),
										rs.getDouble("sal")									
										);
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public List<vo_Emp07> getSch07(vo_Emp07 sch){
		 	List<vo_Emp07> list = new ArrayList<vo_Emp07>();
		 	String sql = "SELECT ENAME,DEPTNO,HIREDATE \r\n"
		 			+ "FROM EMP  \r\n"
		 			+ "WHERE DEPTNO IN (\r\n"
		 			+ "  	SELECT deptno\r\n"
		 			+ "	FROM EMP e \r\n"
		 			+ "	WHERE to_char(hiredate,'MM')= "+sch.getIpmm()+")";
		 	try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo_Emp07 e = new vo_Emp07(
										rs.getString("ename"),
										rs.getInt("deptno"),
										rs.getDate("hiredate")									
										);
					list.add(e);
				}
			} catch (SQLException e) {
				System.out.println("DB 관련 예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		 	return list;
		}
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			A02_1013 dao = new A02_1013();
			System.out.println("1번");
			List<vo_Emp01> list = dao.getSch01("1","");
			for(vo_Emp01 e:list) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getDname()+"\t");
				System.out.print(e.getSal()+"\t");
				System.out.print(e.getGrade()+"\n");
			}
			System.out.println("2번");
			List<vo_Emp02> list2 = dao.getSch02(new vo_Emp02(80));
			for(vo_Emp02 e:list2) {
				System.out.print(e.getYy()+"\t");
				System.out.print(e.getCnt()+"\t");
				System.out.print(e.getMxal()+"\n");
			}			
			System.out.println("3번");
			List<vo_Emp03> list3 = dao.getSch03(new vo_Emp03());
			for(vo_Emp03 e:list3) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getEmpno()+"\t");
				System.out.print(e.getDiv()+"\t");
				System.out.print(e.getSal()+"\t");
				System.out.print(e.getBonus()+"\t");
				System.out.print(e.getTotsal()+"\n");
			}			
			System.out.println("4번");
			List<vo_Emp04> list4 = dao.getSch04(new vo_Emp04("1980/12/17"));
			for(vo_Emp04 e:list4) {
				System.out.print(e.getYy()+"\t");
				System.out.print(e.getMm()+"\n");
	
			}			
			System.out.println("5번");
			List<vo_Emp05> list5 = dao.getSch05(new vo_Emp05("ALLEN"));
			for(vo_Emp05 e:list5) {
				System.out.print(e.getEmpno()+"\t");
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getJob()+"\t");
				System.out.print(e.getMgr()+"\t");
				System.out.print(e.getHiredate()+"\t");
				System.out.print(e.getSal()+"\t");
				System.out.print(e.getComm()+"\t");
				System.out.print(e.getDeptno()+"\n");
			}			
			System.out.println("6번");
			List<vo_Emp06> list6 = dao.getSch06(new vo_Emp06("BLAKE"));
			for(vo_Emp06 e:list6) {
				System.out.print(e.getMgrname()+"\t");
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getSal()+"\t");
				System.out.print(e.getDeptno()+"\n");
			}		
			System.out.println("7번");
			List<vo_Emp07> list7 = dao.getSch07(new vo_Emp07(02));
			for(vo_Emp07 e:list7) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getDeptno()+"\t");
				System.out.print(e.getHiredate()+"\n");
			}
			System.out.println("2번 정답");
			for(Exp02_as e:dao.getExp02List()) {
				System.out.print(e.getYear()+"\t");
				System.out.print(e.getCnt()+"\t");
				System.out.print(e.getSal()+"\n");
			}
			System.out.println("3번 정답");
			for(Exp03_as e:dao.getExp03List("홀")) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getBonus_per()+"\t");
				System.out.print(e.getSal()+"\t");
				System.out.print(e.getTotpay()+"\n");
			}
			System.out.println("4번 정답");
			for(Exp04_as e:dao.getExp04List("2001년01월01일")) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getWorkmonth()+"\n");
			}
			System.out.println("5번 정답");
			for(Emp e:dao.getExp05List("ALLEN")) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getEmpno()+"\t");
				System.out.print(e.getDeptno()+"\t");
				System.out.print(e.getJob()+"\t");
				System.out.print(e.getSal()+"\n");
			}
			System.out.println("6번 정답");
			for(Emp e:dao.getExp06List("BLAKE")) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getJob()+"\t");
				System.out.print(e.getDeptno()+"\n");
			}
			System.out.println("7번 정답");
			for(Emp e:dao.getExp07List("12")) {
				System.out.print(e.getEname()+"\t");
				System.out.print(e.getEmpno()+"\t");
				System.out.print(e.getDeptno()+"\t");
				System.out.print(e.getJob()+"\t");
				System.out.print(e.getSal()+"\n");
			}
		}
	/*
	[1단계:개념] 1. sql을 통한 데이터 처리(dao)의 핵심 단계와 핵심 소스를 기술하세요.
	[1단계:코드] 2. 다음의 내용을 dao 처리를 하세요
        # 처리순서
        1. sql
        2. vo
        3. 기능메서드 선언
        4. 내용처리
        
        1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
        private Connection con;
		private Statement stmt;
		private ResultSet rs;
        
        2)* 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
*/

public List<Exp02_as> getExp02List() {
	List<Exp02_as> list = new ArrayList<Exp02_as>();
	String sql = "SELECT to_char(hiredate, 'YYYY') year, \r\n"
			+ "		count(*) count, max(sal) sal\r\n"
			+ "FROM emp e\r\n"
			+ "GROUP BY to_char(hiredate,'YYYY')";
	// 1. 연결
	try {
		con = DB.con();
		// 2. 대화
		stmt = con.createStatement();
		// 3. 결과/반복문
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			list.add(
			new Exp02_as(
			rs.getString("year"), rs.getInt("count"),
			rs.getDouble("sal")));
		}
		System.out.println("데이터 건수:"+list.size());
		// 4. 예외/자원해제
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("DB에러: "+e.getMessage());
	} catch (Exception e) {
		System.out.println("기타에러: "+e.getMessage());
	}finally {
		DB.close(rs, stmt, con);
	}
	return list;
}
/*
        3)* 사번을 기준으로 홀/짝인 경우 홀인경우 보너스를 50%, 짝인 경우 보너스를 100% 추가하여 급여를 계산하기로 했다.
            조건(홀/짝/전체)  이름, 사번, 구분, 급여, 보너스(%), 총급여   를 출력하세요
*/
public List<Exp03_as> getExp03List(String div){
	if(div!=null) {
		if(div.equals("") || div.equals("전체")) {
			div = "0,1";
		}
		if(div.equals("짝")) div="0";
		if(div.equals("홀")) div="1";
	}else {
		div  = "0,1";
	}
	List<Exp03_as> list = new ArrayList<Exp03_as>();
	String sql = "SELECT e.*,decode(div,0,'짝','홀') div,\r\n"
			+ "		decode(div,0,'100%','50%') bonus_per,\r\n"
			+ "		round(decode(div,0,1,0.5)*sal) bonus,\r\n"
			+ "		sal + round(decode(div,0,1,0.5)*sal) totpay\r\n"
			+ "FROM (	\r\n"
			+ "	SELECT empno, MOD(empno,2) div,\r\n"
			+ "				ename, sal\r\n"
			+ "	FROM emp\r\n"
			+ ") e\r\n"
			+ "WHERE div IN ("+div+")";
	try {
		con = DB.con();
		// 2. 대화
		stmt = con.createStatement();
		// 3. 결과/반복문
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			list.add(
			new Exp03_as(
			rs.getString("ename"), rs.getInt("empno"),
			rs.getString("div"), rs.getDouble("sal"),
			rs.getString("bonus_per"),rs.getInt("bonus"),
			rs.getInt("totpay")));
		}
		System.out.println("데이터 건수:"+list.size());
		// 4. 예외/자원해제
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("DB에러: "+e.getMessage());
	} catch (Exception e) {
		System.out.println("기타에러: "+e.getMessage());
	}finally {
		DB.close(rs, stmt, con);
	}
	return list;
}

/*            
        4)* 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요  
 */
public List<Exp04_as> getExp04List(String std){ // "2001년01월01일"
	System.out.println("# 기준일:"+std);
	List<Exp04_as> list = new ArrayList<Exp04_as>();
	if(std==null || std.equals("")) std="2022년10월14일";
	String sql = "SELECT ename,\r\n"
			+ "		floor(mm/12)||'년 '||floor(MOD(mm,12))||'개월' workmonth\r\n"
			+ "FROM (\r\n"
			+ "	SELECT ename,months_between(to_date('"+std+"','YYYY\"년\"MM\"월\"DD\"일\"'), hiredate) mm\r\n"
			+ "	FROM emp\r\n)"; //'2001년01월01일','YYYY"년"MM"월"DD"일"' , '2001/01/01','YYYY/MM/DD'
	try {
		con = DB.con();
		// 2. 대화
		stmt = con.createStatement();
		// 3. 결과/반복문
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			list.add(
				new Exp04_as(
				rs.getString("ename"), rs.getString("workmonth"))
			);
		}
		System.out.println("데이터 건수:"+list.size());
		// 4. 예외/자원해제
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("DB에러: "+e.getMessage());
	} catch (Exception e) {
		System.out.println("기타에러: "+e.getMessage());
	}finally {
		DB.close(rs, stmt, con);
	}
	return list;
}
/*         
        5)* 사원명을 조건으로 해당 사원과 같은 입사일의 분기를 가진 사원전체 정보를 출력하세요.
*/
public List<Emp> getExp05List(String ename){
	List<Emp> list = new ArrayList<Emp>();
	
	String sql = "SELECT *\r\n"
			+ "FROM emp\r\n"
			+ "WHERE to_char(hiredate,'Q') = (\r\n"
			+ "	SELECT to_char(hiredate,'Q')\r\n"
			+ "	FROM emp\r\n"
			+ "	WHERE ename = '"+ename+"'\r\n"
			+ ")";
	try {
		con = DB.con();
		// 2. 대화
		stmt = con.createStatement();
		// 3. 결과/반복문
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			list.add(
				new Emp(
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getString("job"),
						rs.getInt("mgr"),
						rs.getDate("hiredate"),
						rs.getDouble("sal"),
						rs.getDouble("comm"),
						rs.getInt("deptno")										
						)
			);
		}
		System.out.println("데이터 건수:"+list.size());
		// 4. 예외/자원해제
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("DB에러: "+e.getMessage());
	} catch (Exception e) {
		System.out.println("기타에러: "+e.getMessage());
	} finally {
		DB.close(rs, stmt, con);
	}
	return list;
}
/* 
        6)* 관리자명을 기준(조건)으로 관리자 하위에 포함된 직원정보(직원명, 부서번호, 급여) 출력하세요.
 */
public List<Emp> getExp06List(String ename){
	List<Emp> list = new ArrayList<Emp>();
	
	String sql = "SELECT ename, deptno, sal\r\n"
			+ "FROM emp\r\n"
			+ "WHERE mgr IN (\r\n"
			+ "	SELECT EMPNO \r\n"
			+ "	FROM emp\r\n"
			+ "	WHERE ename ='"+ename+"'\r\n"
			+ ")";
	try {
		con = DB.con();
		// 2. 대화
		stmt = con.createStatement();
		// 3. 결과/반복문
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			list.add(
				new Emp(
						rs.getString("ename"),
						rs.getDouble("sal"),
						rs.getInt("deptno")										
						)
			);
		}
		System.out.println("데이터 건수:"+list.size());
		// 4. 예외/자원해제
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("DB에러: "+e.getMessage());
	} catch (Exception e) {
		System.out.println("기타에러: "+e.getMessage());
	}finally {
		DB.close(rs, stmt, con);
	}
	return list;	
}

/* 
        7)* 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
*/
public List<Emp> getExp07List(String mm){
	List<Emp> list = new ArrayList<Emp>();
		
		String sql = "SELECT *\r\n"
				+ "FROM EMP\r\n"
				+ "WHERE deptno IN (\r\n"
				+ "	SELECT deptno\r\n"
				+ "	FROM EMP \r\n"
				+ "	WHERE to_char(hiredate,'MM') = '"+mm+"'\r\n"
				+ ")";
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(
					new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getDouble("comm"),
							rs.getInt("deptno")										
							)
				);
			}
			System.out.println("데이터 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러: "+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
		return list;	
}
/*
	[1단계:개념] 1. sql을 통한 데이터 처리(dao)의 핵심 단계와 핵심 소스를 기술하세요.
	[1단계:코드] 2. 다음의 내용을 dao 처리를 하세요
        # 처리순서
        1. sql
        2. vo
        3. 기능메서드 선언
        4. 내용처리
        
        1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
        private Connection con;
		private Statement stmt;
		private ResultSet rs;
        
        2)* 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
*/

/* 

	[1단계:개념] 3. 액터와 유스케이스와의 관계를 기술하세요.
	[1단계:개념] 4. 유스케이스의 종류에 대하여 기술하세요.
	[1단계:개념] 5. 유스케이스의 확장관계와 포함관계의 차이점을 기술하세요
	[1단계:실습] 6. actor로 회원/비회원/쇼핑몰 관리자, 유즈케이스로 로그인, 회원가입, 회원관리, 물건조회, 구매, 물품등록
	               유즈케이스를 작성하세요.
	 */
	class Exp04_as{
		private String ename;
		private String workmonth;
		public Exp04_as() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Exp04_as(String ename, String workmonth) {
			super();
			this.ename = ename;
			this.workmonth = workmonth;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public String getWorkmonth() {
			return workmonth;
		}
		public void setWorkmonth(String workmonth) {
			this.workmonth = workmonth;
		}
		
	}
	class Exp03_as{
		private String ename;
		private int empno;
		private String div;
		private double sal;
		private String bonus_per;
		private int bonus;
		private int totpay;
		public Exp03_as() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Exp03_as(String ename, int empno, String div, double sal, String bonus_per, int bonus, int totpay) {
			super();
			this.ename = ename;
			this.empno = empno;
			this.div = div;
			this.sal = sal;
			this.bonus_per = bonus_per;
			this.bonus = bonus;
			this.totpay = totpay;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public int getEmpno() {
			return empno;
		}
		public void setEmpno(int empno) {
			this.empno = empno;
		}
		public String getDiv() {
			return div;
		}
		public void setDiv(String div) {
			this.div = div;
		}
		public double getSal() {
			return sal;
		}
		public void setSal(double sal) {
			this.sal = sal;
		}
		public String getBonus_per() {
			return bonus_per;
		}
		public void setBonus_per(String bonus_per) {
			this.bonus_per = bonus_per;
		}
		public int getBonus() {
			return bonus;
		}
		public void setBonus(int bonus) {
			this.bonus = bonus;
		}
		public int getTotpay() {
			return totpay;
		}
		public void setTotpay(int totpay) {
			this.totpay = totpay;
		}
		
	}

	class Exp02_as{
		private String year;
		private int cnt;
		private double sal;
		public Exp02_as() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Exp02_as(String year, int cnt, double sal) {
			super();
			this.year = year;
			this.cnt = cnt;
			this.sal = sal;
		}
		public String getYear() {
			return year;
		}
		public void setYear(String year) {
			this.year = year;
		}
		public int getCnt() {
			return cnt;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
		}
		public double getSal() {
			return sal;
		}
		public void setSal(double sal) {
			this.sal = sal;
		}
	}
}
