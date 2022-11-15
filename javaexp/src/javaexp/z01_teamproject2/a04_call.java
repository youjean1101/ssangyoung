package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;

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
			
				while(rs.next()) {
						System.out.println("상담번호: "+rs.getString("callno"));
						System.out.println("상담내용: "+rs.getString("callcontents"));
						System.out.println("상담답변: "+rs.getString("callanswer")+"\n");
				};
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
	}
// ---------------------------------------- 상담 내용 조회(관리자 조회) ----------------------------------------------
	public void callManagerSelect(String wherewhether,ManagerCall callno) { 
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
				String sql2 = "select * FROM CALL where callno = '"+callno.getsMgCallno()+"'";
				
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

// ---------------------------------------- 상담 내용 추가(회원) ----------------------------------------------
	public void callInsert(UserCall add) {
		String sql = "INSERT INTO CALL VALUES('A'||call_seq.nextval,?,?,null,null)"; // 상담번호는 자동으로 배정받고 상담내용만 입력받기
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsUsUserno());
				pstmt.setString(2, add.getsUsCallcontents());
				
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
	public void callanswerUpdate(String inAndUp,ManagerCall add) { // 해당 상담 중 무슨 상담을 답변 및 수정 하시겠습니까? 질문하기
		String sql = "UPDATE CALL \r\n"
				+ "SET managerno = ? ,\r\n"
				+ "callanswer = ? \r\n"
				+ "WHERE callno = ? "; // 상담 추가한 상담번호 선택
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, add.getsMgManagerno());
			pstmt.setString(2, add.getsMgCallanswer());
			pstmt.setString(3, add.getsMgCallno());
			
			rs = pstmt.executeQuery();
			
			System.out.println("[안내메시지] 관리자님의 상담 답변이 "+inAndUp+"완료되었습니다.");
			
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
	public void callContentsUpdate(UserCall update) {
		String sql = "UPDATE CALL \r\n"
					+ "SET callcontents = ?\r\n"
					+ "WHERE callno = ?\r\n" 
					+ "AND userno = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, update.getsUsCallcontents());
			pstmt.setString(2, update.getsUsCallno());
			pstmt.setString(3, update.getsUsUserno());
			
			rs = pstmt.executeQuery();
			
			System.out.println("[안내메시지] 회원님의 상담 수정이 완료되었습니다.");
			
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
//public static void main(String[] args) {
		// TODO Auto-generated method stub
	public void CallMenu(String auth, String userno) {
		while(true) {
//			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
//			String sUserAuth = sc.nextLine(); //일단 입력받고 나중에 적용시키기
			
			
			if(auth.equals("관리자")) {
				
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
							dao.callManagerSelect("전체",new ManagerCall("")); // 관리자번호 입력받아 쓰기
							continue;
							
						case 2:
							dao.callAnswerExpected("null"); // 답변안한 상담 조회
							continue;
							
						case 3:
							String sInputCallNo;
							
							while(true) { // 상담번호를 정확히 입력하지 않을시, 반복
								
								System.out.println("☞ 무슨 상담을 답변하시겠습니까?(상담번호로 입력해주세요.)");
								dao.callAnswerExpected("null");
								sInputCallNo = sc.nextLine();
								dao.callManagerSelect("선택",new ManagerCall(sInputCallNo));  // 입력받은 상담번호 데이터 출력시키기
								
								if(dao.IscallSelect(sInputCallNo)==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
									break;
								} else {
									System.out.println("[안내메시지] 답변요청하신 상담이 없습니다. 상담번호를 정확히 입력해주세요.\n");
								}
							}
			
							System.out.println("☞ 상담의 답변 입력해주세요.");
							String sInputCallAnswer = sc.nextLine();
							dao.callanswerUpdate("등록",new ManagerCall(sInputCallNo,userno,sInputCallAnswer)); // 상담답변 달기(선택한 상담번호,관리자회원번호,상담답변)
							continue;
							
						case 4:
							String sUpInputCallNo;
							
							while(true) {
								dao.callAnswerExpected("not null"); // 상담 답변이 있는 테이블데이터 출력
								System.out.println("☞ 수정할 상담의 상담번호를 입력해주세요."); 
								sUpInputCallNo = sc.nextLine();
								
								if(dao.IscallSelect(sUpInputCallNo)==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
									break;
								} else {
									System.out.println("[안내메시지] 수정 요청하신 상담번호가 없습니다. 상담번호를 다시 입력해주세요. \n");
								}
							}
							
							System.out.println("☞ 상담의 수정할 답변 입력해주세요."); 
							String sUpInputCallAnswer = sc.nextLine();
							dao.callanswerUpdate("수정",new ManagerCall(sUpInputCallNo,userno,sUpInputCallAnswer)); //관리자회원번호 넣기
							continue;

						default:
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
							break;
					}
				break;
				}
		break;
	
			} else if (auth.equals("사용자")) {
				while(true) {
					System.out.println("☞ 다음 상담메뉴 중에 무엇을 하시겠습니까?(회원)");
					System.out.println("1: 내가 등록한 상담 확인하기");
					System.out.println("2: 상담하기");
					System.out.println("3: 상담수정하기");
					System.out.println("4: 상담삭제하기");
					int callUserMenuChoice = sc.nextInt();
					sc.nextLine();
					
					switch(callUserMenuChoice) {
						case 1:
							System.out.println("# 내가 신청했던 상담정보 #");
							dao.callUserSelect(userno); // 회원번호 넣기
							continue;
						
						case 2:
							while(true) {
								System.out.println("☞ 상담을 등록하시겠습니까?(Y/N)");
								String sAddCall = sc.nextLine();
								if(sAddCall.toUpperCase().equals("Y")) {
									
									System.out.println("☞ 상담내용을 입력해주세요.");
									String sInputCallContents = sc.nextLine();
									
									dao.callInsert(new UserCall(userno,sInputCallContents)); // 상담번호 배정
									break;
									
								} else if(sAddCall.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}
							
							continue;
							
						case 3:
							String sUpdateCallChoice;
							
							while(true) {
								dao.callUserSelect(userno);
								System.out.println("☞ 수정할 상담의 상담번호를 입력해주세요.");
								sUpdateCallChoice = sc.nextLine();
								
								if(dao.IscallSelect(sUpdateCallChoice)==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
									break;
								} else {
									System.out.println("[안내메시지] 수정 요청하신 상담번호가 없습니다. 상담번호를 다시 입력해주세요. \n");
								}
							}
							System.out.println("☞ 수정할 상담내용을 입력해주세요.");
							String sUpdateCallContents = sc.nextLine();
							
							dao.callContentsUpdate(new UserCall(sUpdateCallChoice,userno,sUpdateCallContents));
							continue;
						
						case 4:
							dao.callUserSelect(userno);
							while(true) {
								System.out.println("☞ 정말 상담을 삭제하시겠습니까?(Y/N)");
								String sCallRemoveAnswer = sc.nextLine();
								if(sCallRemoveAnswer.toUpperCase().equals("Y")) {
									String sDeleteCallnoChoice;
									
									while(true) {
										System.out.println("☞ 삭제하실 상담번호를 입력해주세요.");
										sDeleteCallnoChoice = sc.nextLine();
										
										if(dao.IscallSelect(sDeleteCallnoChoice)==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
											break;
										} else {
											System.out.println("[안내메시지] 삭제 요청하신 상담번호가 없습니다. 상담번호를 다시 입력해주세요. \n");
										}
									}
									
									dao.callDelete(sDeleteCallnoChoice);
									
									break;
									
								} else if (sCallRemoveAnswer.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}
							
							continue;
							
						default :
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
							break;
						}		
				break;
				}
		break;
				
			} else {
				System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
			}
		}
				
	}
}

//---------------------------------------- 상담 관리자 멤버변수 ----------------------------------------------
class ManagerCall{
	 private String sMgCallno;
	 private String sMgUserno;
	 private String sMgCallcontents;
	 private String sMgManagerno;
	 private String sMgCallanswer;
	 
	public ManagerCall() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ManagerCall(String sMgCallno, String sMgUserno, String sMgCallcontents, String sMgManagerno,
			String sMgCallanswer) {
		super();
		this.sMgCallno = sMgCallno;
		this.sMgUserno = sMgUserno;
		this.sMgCallcontents = sMgCallcontents;
		this.sMgManagerno = sMgManagerno;
		this.sMgCallanswer = sMgCallanswer;
	}
	
	public ManagerCall(String sMgCallno, String sMgManagerno, String sMgCallanswer) {
		super();
		this.sMgCallno = sMgCallno;
		this.sMgManagerno = sMgManagerno;
		this.sMgCallanswer = sMgCallanswer;
	}

	public ManagerCall(String sMgCallno) {
		super();
		this.sMgCallno = sMgCallno;
	}
	
	
	public String getsMgCallno() {
		return sMgCallno;
	}
	public void setsMgCallno(String sMgCallno) {
		this.sMgCallno = sMgCallno;
	}
	public String getsMgUserno() {
		return sMgUserno;
	}
	public void setsMgUserno(String sMgUserno) {
		this.sMgUserno = sMgUserno;
	}
	public String getsMgCallcontents() {
		return sMgCallcontents;
	}
	public void setsMgCallcontents(String sMgCallcontents) {
		this.sMgCallcontents = sMgCallcontents;
	}
	public String getsMgManagerno() {
		return sMgManagerno;
	}
	public void setsMgManagerno(String sMgManagerno) {
		this.sMgManagerno = sMgManagerno;
	}
	public String getsMgCallanswer() {
		return sMgCallanswer;
	}
	public void setsMgCallanswer(String sMgCallanswer) {
		this.sMgCallanswer = sMgCallanswer;
	}
}
//---------------------------------------- 상담 회원 멤버변수 ----------------------------------------------
class UserCall{
	 private String sUsCallno;
	 private String sUsUserno;
	 private String sUsCallcontents;
	 private String sUsManagerno;
	 private String sUsCallanswer;
	 
	public UserCall() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserCall(String sUsCallno, String sUsUserno, String sUsCallcontents, String sUsManagerno,
			String sUsCallanswer) {
		super();
		this.sUsCallno = sUsCallno;
		this.sUsUserno = sUsUserno;
		this.sUsCallcontents = sUsCallcontents;
		this.sUsManagerno = sUsManagerno;
		this.sUsCallanswer = sUsCallanswer;
	}
	
	public UserCall(String sUsCallno, String sUsUserno, String sUsCallcontents) {
		super();
		this.sUsCallno = sUsCallno;
		this.sUsUserno = sUsUserno;
		this.sUsCallcontents = sUsCallcontents;
	}
	
	public UserCall(String sUsUserno, String sUsCallcontents) {
		super();
		this.sUsUserno = sUsUserno;
		this.sUsCallcontents = sUsCallcontents;
	}
	
	public UserCall(String sUsCallno) {
		super();
		this.sUsCallno = sUsCallno;
	}
	
	
	public String getsUsCallno() {
		return sUsCallno;
	}
	public void setsUsCallno(String sUsCallno) {
		this.sUsCallno = sUsCallno;
	}
	public String getsUsUserno() {
		return sUsUserno;
	}
	public void setsUsUserno(String sUsUserno) {
		this.sUsUserno = sUsUserno;
	}
	public String getsUsCallcontents() {
		return sUsCallcontents;
	}
	public void setsUsCallcontents(String sUsCallcontents) {
		this.sUsCallcontents = sUsCallcontents;
	}
	public String getsUsManagerno() {
		return sUsManagerno;
	}
	public void setsUsManagerno(String sUsManagerno) {
		this.sUsManagerno = sUsManagerno;
	}
	public String getsUsCallanswer() {
		return sUsCallanswer;
	}
	public void setsUsCallanswer(String sUsCallanswer) {
		this.sUsCallanswer = sUsCallanswer;
	}
	
}