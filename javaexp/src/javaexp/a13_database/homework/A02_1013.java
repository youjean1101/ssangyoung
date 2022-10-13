package javaexp.a13_database.homework;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo2.Emp01;
import javaexp.a13_database.vo2.Emp04;

public class A02_1013 {
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
		}
	}
	/*
	[1단계:개념] 1. sql을 통한 데이터 처리(dao)의 핵심 단계와 핵심 소스를 기술하세요.
	[1단계:코드] 2. 다음의 내용을 dao 처리를 하세요
        1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
        private Connection con;
		private Statement stmt;
		private ResultSet rs;
        
        
        2) 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
        3) 사번을 기준으로 홀/짝인 경우 홀인경우 보너스를 50%, 짝인 경우 보너스를 100% 추가하여 급여를 계산하기로 했다.
            조건(홀/짝/전체)  이름, 사번, 구분, 급여, 보너스(%), 총급여   를 출력하세요
        4) 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요    
        5) 사원명을 조건으로 해당 사원과 같은 입사일의 분기를 가진 사원전체 정보를 출력하세요.
        6) 관리자명을 기준(조건)으로 관리자 하위에 포함된 직원정보(직원명, 부서번호, 급여) 출력하세요.
        7) 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.

	[1단계:개념] 3. 액터와 유스케이스와의 관계를 기술하세요.
	[1단계:개념] 4. 유스케이스의 종류에 대하여 기술하세요.
	[1단계:개념] 5. 유스케이스의 확장관계와 포함관계의 차이점을 기술하세요
	[1단계:실습] 6. actor로 회원/비회원/쇼핑몰 관리자, 유즈케이스로 로그인, 회원가입, 회원관리, 물건조회, 구매, 물품등록
	               유즈케이스를 작성하세요.
	 */
	
