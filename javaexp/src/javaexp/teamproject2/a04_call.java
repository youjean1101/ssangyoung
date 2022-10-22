package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Emp;

public class a04_call {
	static a04_call dao = new a04_call();
	static Scanner sc = new Scanner(System.in);
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
//---------------------------------------- 회원/관리자 조건----------------------------------------------
	public List<SignUp> getbookUserDiv(String div){
		List<SignUp> list = new ArrayList<SignUp>();

		String sql = "SELECT * FROM bookUser WHERE div = '"+div+"'";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				System.out.println(" # 내가 신청했던 상담정보 #");
				
				while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
				};
				int cnt = stmt.executeUpdate(sql);
				if(cnt==0) System.out.println("[안내메시지] 등록된 권한이 없습니다.");
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
			return list;
	}
	
//---------------------------------------- 상담 내용 및 답변 조회(회원 조회) ---------------------------------------------- 
	public void callUserSelect(String userno) { 
		String sql = "select callno,callcontents,callanswer FROM CALL WHERE userno = '"+userno+"'";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				System.out.println(" # 내가 신청했던 상담정보 #");
				
				while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
				};
				int cnt = stmt.executeUpdate(sql);
				if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
	}
// ---------------------------------------- 상담 내용 조회(관리자 조회) ----------------------------------------------
	public void callManagerSelect(String wherewhether,Call callno) { 
		switch(wherewhether) {
			case "전체" :
				String sql = "select * FROM CALL";
				try {
					con = DB.con();
					con.setAutoCommit(false);
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담신청회원번호: "+rs.getString("userno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
					};
					int cnt = stmt.executeUpdate(sql);
					System.out.println("※ 상담 건수: "+cnt+"\n");
					
					if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
					
				} catch (SQLException e) {
					System.out.println("DB처리예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
				break;
			
				
			case "선택" :
				String sql2 = "select * FROM CALL where callno = '"+callno.getsCallno()+"'";
				
				try {
					con = DB.con();
					con.setAutoCommit(false);
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql2);
					
					while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담신청회원번호: "+rs.getString("userno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
					};
					int cnt = stmt.executeUpdate(sql2);
					if(cnt==0) System.out.println("[안내메시지] 수정요청하신 상담이 없습니다. 상담번호를 정확히 입력해주세요.");
					
				} catch (SQLException e) {
					System.out.println("DB처리예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
				break;
				
			default : 
				System.out.println("[안내메시지] 전체조회/선택조회 중에 선택해주세요.");
				break;
		}
	}
		
		
	// ---------------------------------------- 상담 내용 조회(관리자 조회) ----------------------------------------------
	public boolean IscallSelect (String callno) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM CALL WHERE CALLNO = '"+callno+"'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
//			int nRowCnt = rs.getRow(); // 조회데이터 건수를 반환한다.
//			
//			System.out.println(nRowCnt +"/"+callno + "/" +sql);
			if(rs.next())
			{
				int nRowCnt = rs.getRow();
				if(nRowCnt < 1) {
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
		
		System.out.println("bReturn:" + bReturn);
		return bReturn;
	}

	// ---------------------------------------- 상담 내용 추가(회원) ----------------------------------------------
	public void callInsert(Call add) {
		String sql = "INSERT INTO CALL VALUES(?,?,?,null,null)";
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsCallno());
				pstmt.setString(2, add.getsUserno());
				pstmt.setString(3, add.getsCallcontents());
				
				System.out.println("[안내메시지] 회원님의 상담등록이 완료되었습니다.");
				
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
// ---------------------------------------- 상담 답변이 없는 상담 조회 (관리자) ----------------------------------------------
	public void callAnswerExpected(String nullwhether) { // 해당 상담 중 무슨 상담을 답변하시겠습니까? 질문하기
		String sql = "SELECT * FROM CALL WHERE MANAGERNO is "+nullwhether; //상담 답변이 안되어있는 상담 조회
						// 나중에 join으로 상담신청 아이디 출력
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(nullwhether.equals("null")) { // 상담답변이 없는 경우
				while(rs.next()) {
					System.out.println("상담번호:"+rs.getString("callno"));
					System.out.println("상담등록회원번호:"+rs.getString("userno"));
					System.out.println("상담내용:"+rs.getString("callcontents")+"\n");
				};
			} else { // 상담답변이 있는 경우
				while(rs.next()) {
					System.out.println("상담번호:"+rs.getString("callno"));
					System.out.println("상담등록회원번호:"+rs.getString("userno"));
					System.out.println("상담내용:"+rs.getString("callcontents"));
					System.out.println("상담답변관리자번호 : "+rs.getString("managerno"));
					System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
				};
			}
			
			int cnt = stmt.executeUpdate(sql);
			System.out.println("※ 답변없는 상담 건수: "+cnt+"\n");
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
			
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
// ---------------------------------------- 상담 답변 추가(관리자) ----------------------------------------------
	public void callanswerUpdate(String inandup,Call add) { // 해당 상담 중 무슨 상담을 답변 및 수정 하시겠습니까? 질문하기
		String sql = "UPDATE CALL \r\n"
				+ "SET managerno = ?,\r\n"
				+ "callanswer = ?\r\n"
				+ "WHERE callno = ?"; // 상담 추가한 상담번호 선택
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, add.getsManagerno());
			pstmt.setString(2, add.getsCallanswer());
			pstmt.setString(3, add.getsCallno());
			
			System.out.println("[안내메시지] 관리자님의 상담 답변이 "+inandup+"완료되었습니다.");
			
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
// ---------------------------------------- 상담 수정(회원) ----------------------------------------------
	public void callContentsUpdate(String upcall,Call update) {
		String sql = "UPDATE CALL \r\n"
					+ "SET callcontents = ?\r\n"
					+ "WHERE callno = ?\r\n" 
					+ "AND userno = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, upcall);
			pstmt.setString(2, update.getsCallno());
			pstmt.setString(3, update.getsUserno());
			
			System.out.println("[안내메시지] 회원님의 상담 수정이 완료되었습니다.");
			
			rs = pstmt.executeQuery();
			
			int cnt = pstmt.executeUpdate(sql);
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
			
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
// ---------------------------------------- 상담 삭제(회원) ----------------------------------------------
	public void callDelete(String callno) {
		String sql = "DELETE FROM call WHERE callno = '"+callno+"'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			System.out.println("[안내메시지] 요청하신 상담 삭제가 완료되었습니다.");
			
			int cnt = stmt.executeUpdate(sql);
			if(cnt==0) System.out.println("[안내메시지] 등록된 상담이 없습니다.");
			
			
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
//---------------------------------------- 상담출력 main()문 ----------------------------------------------
public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			String sUserAuth = sc.nextLine(); //일단 입력받고 나중에 적용시키기
//			dao.getbookUserDiv(sUserAuth); // 출력
			
			
			if(sUserAuth.equals("관리자")) {
				
				while(true) {
					System.out.println("☞ 다음 상담메뉴 중에 무엇을 하시겠습니까?(관리자)");
					System.out.println("1: 전체 상담 확인");
					System.out.println("2: 답변없는 상담확인하기");
					System.out.println("3: 상담 답변하기");
					System.out.println("4: 상담 답변 수정하기");
					int callManagerMenuChoice = sc.nextInt();
					sc.nextLine();
					
					switch(callManagerMenuChoice) {
						case 1:
							dao.callManagerSelect("전체",new Call("")); // 관리자번호 입력받아 쓰기
							continue;
							
						case 2:
							dao.callAnswerExpected("null"); // 답변안한 상담 조회
							continue;
							
						case 3:
							String sInputCallNo;
							while(true) {
									System.out.println("☞ 무슨 상담을 답변하시겠습니까?(상담번호로 입력해주세요.)");
									dao.callAnswerExpected("null");
									sInputCallNo = sc.nextLine();
									dao.callManagerSelect("선택",new Call(sInputCallNo)); // 상담번호가 없는 상담을 입력할 경우 break;하는법
								if(dao.IscallSelect(sInputCallNo)) {
									break;
								} else {
									System.out.println("[안내메시지] 없는 상담번호입니다. 다시 입력해주세요.");
									continue;
								}
							}
			
							System.out.println("☞ 상담의 답변 입력해주세요.");
							String sInputCallAnswer = sc.nextLine();
							dao.callanswerUpdate("등록",new Call(sInputCallNo,"9999",sInputCallAnswer));
							continue;
							
						case 4:
							dao.callAnswerExpected("not null");
							System.out.println("☞ 수정할 상담의 상담번호를 입력해주세요.");
							String sUpInputCallNo = sc.nextLine();
							System.out.println("☞ 상담의 수정할 답변 입력해주세요.");
							String sUpInputCallAnswer = sc.nextLine();
							dao.callanswerUpdate("수정",new Call(sUpInputCallNo,"9999",sUpInputCallAnswer));
							continue;

						default:
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
							break;
					}
					
				break;
				}
		break;
	
			} else if (sUserAuth.equals("사용자")) {
				
				System.out.println("☞ 다음 상담메뉴 중에 무엇을 하시겠습니까?(회원)");
				System.out.println("1: 내가 등록한 상담 확인하기");
				System.out.println("2: 상담하기");
				System.out.println("3: 상담수정하기");
				System.out.println("4: 상담삭제하기");
				int callUserMenuChoice = sc.nextInt();
				sc.nextLine();
				
				switch(callUserMenuChoice) {
				case 1:
					dao.callUserSelect("9996");
					continue;
					
				case 2:
					while(true) {
						System.out.println("상담을 등록하시겠습니까?(Y/N");
						String sAddCall = sc.nextLine();
						if(sAddCall.toUpperCase().equals("Y")) {
							
							System.out.println("☞ 상담내용을 입력해주세요.");
							String sInputCallContents = sc.nextLine();
							
							
							dao.callInsert(new Call("A1000006","9995",sInputCallContents));
							break;
							
						} else if(sAddCall.toUpperCase().equals("N")) {
							break;
						} else {
							System.out.println("[안내메시지] Y/N으로 입력해주세요.");
						}
					}
					
					continue;
					
				case 3:
					
					continue;
				
				case 4:
					
					continue;
					
				default :
					
					break;
				}
				dao.callUserSelect(sUserAuth);
				
		break;
				
			} else {
				System.out.println("[안내메시지] 관리자/사용자 중에 선택해주세요.");
			}
		}
				
	}
}

//---------------------------------------- 상담 멤버변수 ----------------------------------------------
class Call{
	 private String sCallno;
	 private String sUserno;
	 private String sCallcontents;
	 private String sManagerno;
	 private String sCallanswer;
	public Call() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Call(String sCallno) {
		super();
		this.sCallno = sCallno;
	}
	
	public Call(String sCallno, String sManagerno, String sCallanswer) {
		super();
		this.sCallno = sCallno;
		this.sManagerno = sManagerno;
		this.sCallanswer = sCallanswer;
	}

	public Call(String sCallno, String sUserno, String sCallcontents, String sManagerno, String sCallanswer) {
		super();
		this.sCallno = sCallno;
		this.sUserno = sUserno;
		this.sCallcontents = sCallcontents;
		this.sManagerno = sManagerno;
		this.sCallanswer = sCallanswer;
	}

	public String getsCallno() {
		return sCallno;
	}

	public void setsCallno(String sCallno) {
		this.sCallno = sCallno;
	}

	public String getsUserno() {
		return sUserno;
	}

	public void setsUserno(String sUserno) {
		this.sUserno = sUserno;
	}

	public String getsCallcontents() {
		return sCallcontents;
	}

	public void setsCallcontents(String sCallcontents) {
		this.sCallcontents = sCallcontents;
	}

	public String getsManagerno() {
		return sManagerno;
	}

	public void setsManagerno(String sManagerno) {
		this.sManagerno = sManagerno;
	}

	public String getsCallanswer() {
		return sCallanswer;
	}

	public void setsCallanswer(String sCallanswer) {
		this.sCallanswer = sCallanswer;
	}	
}