package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class a03_Program {
	static a03_Program dao = new a03_Program();
	static Scanner sc = new Scanner(System.in);
	static LocalDate now = LocalDate.now(); 
	static int i;
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;


//---------------------------------------------- 독서왕 TOP10 뽑기 	--------------------------------------------------------------------
	public void rentalTop10Select(){
		String sql = "SELECT * FROM (\r\n"
				+ "SELECT * FROM bookuser\r\n"
				+ "WHERE overduecnt < 3\r\n"
				+ "AND div = 'user'\r\n"
				+ "ORDER BY rentalcnt DESC)\r\n"
				+ "WHERE rownum<=10"; // 연체 3번이하 대여 횟수 TOP10 뽑기
		
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("TOP"+rs.getRow()+" 독서왕의 정보");
					System.out.println("이름:"+rs.getString("uname"));
					System.out.println("아이디:"+rs.getString("id"));
					System.out.println("대여횟수:"+rs.getInt("rentalcnt"));
					System.out.println("연체횟수:"+rs.getInt("overduecnt")+"\n");
				}
				System.out.println("☆★TOP3에겐 소정의 선물이 준비되어 있습니다.(상품 : 스타벅스 아메리카노 상품권)");
				System.out.println("상품을 못받으신 분은 다음기회에 도전하시길 바랄게요~~☆★");
				System.out.println("※ 공지 : 연체가 3번이상이신 분은 이벤트에 참여할 수 없습니다.\n");
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		}
// ---------------------------------------- 프로그램 내용 조회 ----------------------------------------------
	public boolean IsProgramSelect (int pno) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM program WHERE pno = "+pno;
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next())
			{
				int nRowCnt = rs.getRow(); // 테이블의 행 갯수 변수선언
				if(nRowCnt < 1) { // 행갯수가 1개라도 있으면 true
					bReturn = false;
				} else {
					bReturn = true;
				}
			}
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return bReturn; // 행갯수가 있으면 true를 리턴
	}
//---------------------------------------------- 자동삭제된 주간프로그램 출력 기능메서드	--------------------------------------------------------------------
	public void deleteProgramSelect(String noticetime){
		String sql = "SELECT * FROM program WHERE noticedate ='"+noticetime+"'";
		
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("\""+rs.getString("pname")+"\"");
					int nRowCnt = rs.getRow();
					if(nRowCnt > 0) { 
						System.out.println("[안내메시지] 위의 주간 프로그램은 공지날짜 지나, 자동 삭제되었습니다.\n");
					} 
				}
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		}
//---------------------------------------------- 주간프로그램 출력 기능메서드	--------------------------------------------------------------------
	public List<Program> programTime(){
		List<Program> list = new ArrayList<Program>();
		
		String sql = "select noticedate FROM program";
		
		try {
			con = DB.con();
			
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Program e = new Program(
						rs.getString("noticedate")							
						);
				list.add(e);	
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 프로그램이 없습니다.");
			DB.close(rs, stmt, con);
		}
		return list;
	}
//---------------------------------------------- 주간프로그램 출력 기능메서드	--------------------------------------------------------------------
		public void programListAllPrint() {
			try {
				con = DB.con();
				String sql = "SELECT * FROM program\r\n"
							+ "ORDER BY pno";
				
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
			String sql = "INSERT INTO program values(pno_seq.nextval,?,?,?,?)";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
									
					pstmt.setString(1, add.getPname());
					pstmt.setString(2, add.getPtime());
					pstmt.setString(3, add.getNoticedate());
					pstmt.setString(4, add.getManagerno());
					
					System.out.println("[안내메시지] 주간프로그램 추가가 완료되었습니다.");
					
					rs = pstmt.executeQuery();
					
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
				DB.close(rs, pstmt, con);
			}
		}
//----------------------------------------------주간프로그램 추가 기능메서드--------------------------------------------------------------------	
		public void programdelandInsert(Program add) {
			String sql = "INSERT INTO program values(pno_seq.currval,?,?,?,?);"; // 삭제하고 수정시, 반영해야함....
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
									
					pstmt.setString(1, add.getPname());
					pstmt.setString(2, add.getPtime());
					pstmt.setString(3, add.getNoticedate());
					pstmt.setString(4, add.getManagerno());
					
					System.out.println("[안내메시지] 주간프로그램 추가가 완료되었습니다.");
					
					rs = pstmt.executeQuery();
					System.out.println(sql);
					
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
				DB.close(rs, pstmt, con);
			}
		}

// ----------------------------------------------주간프로그램 수정 기능메서드--------------------------------------------------------------------

		public void programUpdate(int updatepno, String sUpdateChoice,Program upProgram) {
			String sql =  " UPDATE program\r\n ";
			
			switch(sUpdateChoice) { 
			case "프로그램명" : 		
				sql +=  " SET pname = '"+upProgram.getPname()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case "프로그램일정" : 
				sql +=  " SET ptime = '"+upProgram.getPtime()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case "공지날짜" : 
				sql +=  " SET noticedate = '"+upProgram.getNoticedate()+"'\r\n "
						+ "	WHERE pno = "+updatepno;
				break;
				
			case "관리자번호" : 
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
// ----------------------------------------------주간프로그램 삭제 기능메서드--------------------------------------------------------------------
		public void programAutoDelete(String delAutoPro) {
			String sql = "DELETE FROM program WHERE noticedate ='"+delAutoPro+"'";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
//				System.out.println("[안내메시지]위의 주간 프로그램은 공지날짜 지나, 자동 삭제되었습니다.");
				
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
//----------------------------------------------주간프로그램출력 main()--------------------------------------------------------------------	
//	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	public void ProgramMenu(String auth, String userno) {
//		System.out.println("☞ 관리자/사용자 중 무엇입니까?");
//		String auth = sc.nextLine();
		while(true) {
			if(auth.equals("관리자")) {
				
				// 주간프로그램 공지날짜에 따른 자동 삭제 기능
				SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd"); // 타입을 Date 타입을 yyyy-mm-dd로 변경
				Date time = new Date(); // 현재날짜 및 시각
				
				String time1 = format1.format(time); //현재날짜 데이터타입 변경
				
				dao.deleteProgramSelect(time1);
				List<Program> proList = dao.programTime();
				for(Program e:proList) {
		//			String time2 = format1.formate(e.getNoticedate()); // Date 타입에 스트링을 넣으면 안되서 에러발생
					
					String time2 = e.getNoticedate().split(" ")[0]; 
					// 공지날짜 데이터타입변경(time2) yyyy-mm-dd tt:mm:ss(공지시각타입) 이므로 구분자 띄어쓰기를 넣어 yyyy-mm-dd만 time2로 선언
					if(time1.equals(time2)) { // 공지날짜가 오늘날짜와 같으면 삭제 진행
						dao.programAutoDelete(time2);
					}
				}
				
				while(true) { //관리자/사용자 구분
					System.out.println("☞ 프로그램 메뉴를 고르세요.");
					System.out.println("1:프로그램조회");
					System.out.println("2:프로그램추가");
					System.out.println("3:프로그램수정");
					System.out.println("4:프로그램삭제");
					System.out.println("5:뒤로가기");
					
					int iProgramMenu = sc.nextInt();
					sc.nextLine(); //int 입력 초기화 처리
					switch(iProgramMenu) {
						case 1:
							System.out.println("☞ 어떤 프로그램을 조회하겠습니까?");
							System.out.println("\n[안내메시지] 프로그램명으로 검색해주세요!");
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
									System.out.print("☞ 공지끝나는날짜: ");
									String sNoticeDate = sc.nextLine();
									System.out.print("☞ 관리자번호(※ 입력안할 시, 나의 회원번호가 등록): ");
									String iManagerno = sc.nextLine();
									
									if(iManagerno == null) {
										dao.programInsert(new Program(sPname, sPtime, sNoticeDate,userno));
									}else {
										dao.programInsert(new Program(sPname, sPtime, sNoticeDate,iManagerno));
									}
					
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
							
							int iUpdateProgram;
							while(true) {
								System.out.println("☞ 다음 중 수정할 프로그램번호를 입력하세요.");
								iUpdateProgram = sc.nextInt();
								sc.nextLine();
								if (dao.IsProgramSelect(iUpdateProgram)==true) {
									break;
								} else {
									System.out.println("[안내메시지] 없는 프로그램 번호입니다. 프로그램번호를 정확히 입력해주세요.");
								}
							}
							
							Program updateProgramData = new Program();			
						
							System.out.println("☞ 해당 프로그램의 무엇을 수정하시겠습니까?");
							System.out.println("1:프로그램명");
							System.out.println("2:프로그램일정");
							System.out.println("3:공지끝나는날짜");
							System.out.println("4:관리자번호");
							
							int iProgramUpdateMenu = sc.nextInt();
							sc.nextLine();
							
							switch(iProgramUpdateMenu) {
								case 1 : 
									System.out.print("☞ 변경할 프로그램명: ");
									String sUpdatePname = sc.nextLine();
									updateProgramData.setPname(sUpdatePname);
									dao.programUpdate(iUpdateProgram, "프로그램명", updateProgramData);
									System.out.println("[안내메시지] 프로그램명이 변경 완료되었습니다.");
									break;
									
								case 2 : 
									System.out.print("☞ 변경할 프로그램일정: ");
									String sUpdatePtime = sc.nextLine();
									updateProgramData.setPtime(sUpdatePtime);
									dao.programUpdate(iUpdateProgram, "프로그램일정", updateProgramData);
									System.out.println("[안내메시지] 프로그램 일정이 변경 완료되었습니다.");
									break;
									
								case 3 : 
									System.out.print("☞ 변경할 공지끝나는날짜: ");
									String sUpdatenoticedate = sc.nextLine();
									updateProgramData.setNoticedate(sUpdatenoticedate);
									dao.programUpdate(iUpdateProgram, "공지날짜", updateProgramData);
									System.out.println("[안내메시지] 공지끝나는날짜가 변경 완료되었습니다.");
									break;
									
								case 4 : 
									System.out.print("☞ 변경할 관리자번호: ");
									String iUpdateManagerno = sc.nextLine();
									updateProgramData.setManagerno(iUpdateManagerno);
									dao.programUpdate(iUpdateProgram, "관리자번호", updateProgramData);
									System.out.println("[안내메시지] 관리자 변경이 완료되었습니다.");
									break;
								
								default :
									System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");	
							}
						
							break;
							
						case 4:
							
							dao.programListAllPrint();
							System.out.println("☞ 다음 중 삭제할 프로그램 번호를 입력하세요.");
							int iDeletePno = sc.nextInt();
							sc.nextLine();
							dao.programDelete(iDeletePno);
							break;
							
						case 5:
							break;
							
						default : 
							System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");
							
					}
					break;
				}
				
			} else if(auth.equals("사용자")) {
				while(true) {
					System.out.println("☞ 이벤트 메뉴를 고르세요");
					System.out.println("1: 주간프로그램 조회");
					System.out.println("2: 독서왕 조회");
					System.out.println("3: 뒤로가기");
					int iEventMenuChoice = sc.nextInt();
					sc.nextLine();
					
					switch(iEventMenuChoice) {
						case 1:
							dao.programListAllPrint();
							// 주간프로그램 조회
							break;
							
						case 2:
							dao.rentalTop10Select();
							// 독서왕 조회
							break;
							
						case 3:
							//뒤로가기
							break;
							
						default :
							System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");	
					}
					break;
				}
				
				
			} else {
				System.out.println("[안내메시지] 관리자/사용자 중에 입력해주세요.");
			}
		break;
		}
	}
}
//----------------------------------------------프로그램 멤버변수--------------------------------------------------------------------
class Program{
	private int pno; //프로그램번호
	private String pname; // 프로그램명
 	private String ptime; // 프로그램일정
 	private String noticedate; // 공지끝나는날짜
 	private String managerno; // 관리자번호
	public Program() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Program(String pname, String ptime, String noticedate, String managerno) {
		super();
		this.pname = pname;
		this.ptime = ptime;
		this.noticedate = noticedate;
		this.managerno = managerno;
	}


	public Program(int pno, String pname, String ptime, String noticedate, String managerno) {
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
	
	
	public Program(String noticedate) {
		super();
		this.noticedate = noticedate;
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
	public String getManagerno() {
		return managerno;
	}
	public void setManagerno(String managerno) {
		this.managerno = managerno;
	} 
	
}