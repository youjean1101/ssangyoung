package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Dept;
import javaexp.a13_database.vo.Emp;

public class a03_Program {
	static a03_Program dao = new a03_Program();
	static Scanner sc = new Scanner(System.in);
	static int i = 0;
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

//---------------------------------------------- 주간프로그램 출력 기능메서드	--------------------------------------------------------------------
		public void programListAllPrint() {
			try {
				con = DB.con();
				String sql = "select * FROM program ORDER by pno";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				System.out.println("프로그램번호\t프로그램이름\t프로그램일정\t프로그램공지날짜\t관리자번호");
				while(rs.next()) {
					System.out.print(rs.getInt("pno")+"\t");
					System.out.print("\t"+rs.getString("pname")+"\t");
					System.out.print(rs.getString("ptime")+"\t");
					System.out.print(rs.getString("noticedate")+"\t");
					System.out.print(rs.getString("managerno")+"\n");
				}
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				if(rs==null) System.out.println("[안내메시지] 등록된 프로그램이 없습니다.");
				DB.close(rs, stmt, con);
			}
		}
//---------------------------------------------- 주간프로그램 조회 기능메서드	--------------------------------------------------------------------
		public void ProgramSelect(String name) {
				String sql = "SELECT * FROM program \r\n"
					+ "WHERE pname LIKE '%'|| '"+name+"' ||'%'";
					try {
						con = DB.con();
						con.setAutoCommit(false);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
									System.out.println("프로그램명: "+rs.getString("pname"));
									System.out.println("프로그램시간: "+rs.getString("ptime"));
									System.out.println("프로그램 공지시간: "+rs.getString("noticedate"));
									System.out.println("관리자번호: "+rs.getInt("managerno")+"\n");
						};
						int cnt = stmt.executeUpdate(sql);
						if(cnt==0) System.out.println("[안내메시지] 등록된 프로그램이 없습니다.");
						
					} catch (SQLException e) {
						System.out.println("DB처리예외:"+e.getMessage());
					} catch (Exception e) {
						System.out.println("기타예외:"+e.getMessage());
					} finally {
						DB.close(rs, stmt, con);
					}
		}
//----------------------------------------------주간프로그램 추가 기능메서드--------------------------------------------------------------------	
		public void programInsert(Program add) {
			String sql = "INSERT INTO program VALUES(?,?,?,?,?)";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1,add.getPno());
					pstmt.setString(2, add.getPname());
					pstmt.setString(3, add.getPtime());
					pstmt.setString(4, add.getNoticedate());
					pstmt.setInt(5, add.getManagerno());
					System.out.println("[안내메시지] 주간프로그램 추가가 완료되었습니다.");

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
// ----------------------------------------------주간프로그램 수정 기능메서드--------------------------------------------------------------------

		public void programUpdate(int updatepno, int i,Program upProgram) {
			String sql =  " UPDATE program\r\n ";
			
			switch(i) { 
			 /* 동적 sql
			 * 1. sql 구문이 데이터에 따라, 조건에 따라 변경되는 것을 말한다.
			 * 2. 데이터는 가능한한 ?로 처리하고 preparedStatement에 처리한다.
			 * 3. 조건문에 따른 내용으 sql조건도 처리하고*/
			case 1 : 		
				sql +=  " SET pname ="+upProgram.getPname()+"\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case 2 : 
				sql +=  " SET ptime = '"+upProgram.getPtime()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case 3 : 
				sql +=  " SET noticedate = '"+upProgram.getNoticedate()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case 4 : 
				sql +=  " SET managerno = '"+upProgram.getManagerno()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
							
			default : 
				System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");
				break;
			}
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				int cnt = stmt.executeUpdate(sql);
				if(cnt==0) {
					System.out.println("[안내메시지]수정 요청하신 프로그램이 없습니다.");
					System.out.println("[안내메시지]다른 프로그램을 신청하시기 바랍니다.");
				}			
			} catch (SQLException e) {
				System.out.println("DB 처리:"+e.getMessage());
				try { // 
					con.rollback();
				} catch (SQLException e1) {
					System.out.println("rollback에러:"+e1.getMessage());
				}
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {
				if(rs==null) System.out.println("[안내메시지] 등록된 프로그램이 없습니다.");
				DB.close(rs, stmt, con);
			}
		}
// ----------------------------------------------주간프로그램 삭제 기능메서드--------------------------------------------------------------------
		public void programDelete(int delpno) {
			String sql = "DELETE FROM program WHERE pno = " + delpno;
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				
			} catch (SQLException e) {
				System.out.println("DB 처리:"+e.getMessage());
				try { // 
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
//----------------------------------------------주간프로그램출력 main()--------------------------------------------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println("☞ 프로그램 메뉴를 고르세요.");
			System.out.println("1:프로그램조회");
			System.out.println("2:프로그램추가");
			System.out.println("3:프로그램수정");
			System.out.println("4:프로그램삭제");
			int iProgramMenu = sc.nextInt();
			sc.nextLine(); //int 입력 초기화 처리
			switch(iProgramMenu) {
				case 1:
					System.out.println("☞ 어떤 프로그램을 조회하겠습니까?");
					System.out.println("[안내메시지] 프로그램명으로 검색해주세요!");
					String sProgramChoice = sc.nextLine();
					dao.ProgramSelect(sProgramChoice);
					break;
					
				case 2:
					while(true) {
						System.out.println("☞ 프로그램을 추가하시겠습니까?(Y/N)");
						String sAddProgram = sc.nextLine();
						if(sAddProgram.toUpperCase().equals("Y")) {
							System.out.print("☞ 프로그램명: ");
							String sPname = sc.nextLine();
							System.out.print("☞ 프로그램일정: ");
							String sPtime = sc.nextLine();
							System.out.print("☞ 비고(공지날짜): ");
							String sNoticeDate = sc.nextLine();
							System.out.print("☞ 관리자번호: ");
							int iManagerno = sc.nextInt();
							dao.programInsert(new Program(++i,sPname, sPtime, sNoticeDate,iManagerno));
//							List<Program> proList = dao.programInsert(new Program(++i,sPname, sPtime, sNoticeDate,iManagerno));
//							for(Program p:prolist) {
//							dao.programInsert(new Program(i,sPname, sPtime, sNoticeDate,iManagerno));
//							}
							
							break;
							
						} else if(sAddProgram.toUpperCase().equals("N")) {
							System.out.println("[뒤로가기]\n");
			break;
						} else {
							System.out.println("[안내메시지] Y/N으로 입력해주세요.");
					continue;
						}
					}
					break;
					
				case 3:
					dao.programListAllPrint();
					
					System.out.println("☞ 다음 중 수정할 프로그램번호를 입력하세요.");
					int iUpdateProgram = sc.nextInt();
					sc.nextLine();
					
					Program upp = new Program();
				
					System.out.println("☞ 해당 프로그램의 무엇을 수정하시겠습니까?");
					System.out.println("1:프로그램명");
					System.out.println("2:프로그램일정");
					System.out.println("3:비고(공지날짜)");
					System.out.println("4:관리자번호");
					
					int iProgramUpdateMenu = sc.nextInt();
					sc.nextLine();
					
					switch(iProgramUpdateMenu) {
						case 1 : 
							System.out.print("☞ 변경할 프로그램명: ");
							String sUpdatePname = sc.nextLine();
							upp.setPname(sUpdatePname);
							dao.programUpdate(iUpdateProgram, iProgramMenu, upp);
							System.out.println("[안내메시지] 프로그램명이 변경 완료되었습니다.");
							break;
							
						case 2 : 
							System.out.print("☞ 변경할 프로그램일정: ");
							String sUpdatePtime = sc.nextLine();
							upp.setPtime(sUpdatePtime);
							dao.programUpdate(iUpdateProgram, iProgramMenu, upp);
							System.out.println("[안내메시지] 프로그램 일정이 변경 완료되었습니다.");
							break;
							
						case 3 : 
							System.out.print("☞ 변경할 비고(공지날짜): ");
							String sUpdatenoticedate = sc.nextLine();
							upp.setNoticedate(sUpdatenoticedate);
							dao.programUpdate(iUpdateProgram, iProgramMenu, upp);
							System.out.println("[안내메시지] 비고(공지날짜)가 변경 완료되었습니다.");
							break;
							
						case 4 : 
							System.out.print("☞ 변경할 관리자번호: ");
							int iUpdateManagerno = sc.nextInt();
							upp.setManagerno(iUpdateManagerno);
							dao.programUpdate(iUpdateProgram, iProgramMenu, upp);
							System.out.println("[안내메시지] 관리자 변경이 완료되었습니다.");
							break;
						
						default :
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
							break;	
					}
				
					break;
					
				case 4:
					dao.programListAllPrint();
					System.out.println("☞ 다음 중 삭제할 프로그램 번호를 입력하세요.");
					int iDeletePno = sc.nextInt();
					dao.programDelete(iDeletePno);
					break;
					
				default : 
					System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");
					break;
			}
		}
	}
}
//----------------------------------------------프로그램 멤버변수--------------------------------------------------------------------
class Program{
	private int pno; //프로그램번호
	private String pname; // 프로그램명
 	private String ptime; // 프로그램일정
 	private String noticedate; // 비고(공지날짜)
 	private int managerno; // 관리자번호
	public Program() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Program(int pno, String pname, String ptime, String noticedate, int managerno) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.ptime = ptime;
		this.noticedate = noticedate;
		this.managerno = managerno;
	}
	
	public Program(int pno) {
		super();
		this.pno = pno;
	}
	
	public Program(String pname) {
		super();
		this.pname = pname;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	public String getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	public int getManagerno() {
		return managerno;
	}
	public void setManagerno(int managerno) {
		this.managerno = managerno;
	} 
	
}