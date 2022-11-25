package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.z01_teamproject3.vo.*;

public class MovieHome {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement pstmt;

//------------------------------------------------회원가입 기능메서드------------------------------------------------
	public void cgvSignUpinsert(CGVuserInfoVo useradd) {
		String sql = "INSERT INTO cgvUser VALUES('user'||userCode_seq.nextval, ?, ?, ?, ?, ?, ?, ?,0)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, useradd.getsDiv());
			pstmt.setString(2, useradd.getsName());
			pstmt.setString(3, useradd.getsId());
			pstmt.setString(4, useradd.getsPassword());
			pstmt.setString(5, useradd.getsPhonenum());
			pstmt.setString(6, useradd.getsGender());
			pstmt.setInt(7, useradd.getiAge());
			System.out.println("[안내메시지] 회원가입이 완료되었습니다. 저희 CGV를 이용해주셔서 감사합니다♥\n");

			rs = pstmt.executeQuery();
			con.commit();

		} catch (SQLException e) {
			System.out.println("DB 처리:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback에러:" + e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타 예외:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
//------------------------------------------------회원삭제 기능메서드------------------------------------------------
	public void cgvMemberRemove(CGVuserInfoVo useradd) {
		String sql = "DELETE FROM cgvUser WHERE id= ? AND password= ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, useradd.getsId());
			pstmt.setString(2, useradd.getsName());
			rs = pstmt.executeQuery();
			
			System.out.println("[안내메시지] 회원 삭제가 완료되었습니다. 그 그동안 저희 CGV를 이용해주셔서 감사합니다♡\n");
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB 처리:" + e.getMessage());
			
			try { con.rollback(); } 
			catch (SQLException e1) {
				System.out.println("rollback에러:" + e1.getMessage()); 
			}
			
		} catch (Exception e) {
			System.out.println("기타 예외:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

//--------------------------------------------아이디중복확인 기능메서드---------------------------------------------------
	public boolean isIdConfirmSel(String sIdandPass,CGVuserInfoVo sIdConfirm) {
		String sql = "SELECT * FROM cgvUser\r\n";
		boolean bIdCofirmReturn = false; // false를 default해줘야 적용이 잘됌
		
		try {
			switch(sIdandPass) {
				case "ID" : 
					sql += "WHERE id = ?";
					con = DB.con();
					con.setAutoCommit(false);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, sIdConfirm.getsId());
					break;
					
				case "PASSWORD" :
					sql += "WHERE id = ? AND password = ?";
					con = DB.con();
					con.setAutoCommit(false);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, sIdConfirm.getsId());
					pstmt.setString(2, sIdConfirm.getsPassword());
					break;
					
				default :
					System.out.println("[안내메시지] 아이디만 체크할건지, 패스워드도 함께 체크할건지 선택해주세요."); //의미없음
					break;
			}
			rs = pstmt.executeQuery();

			if(rs.next()) { 
				if(rs.getRow()>0) bIdCofirmReturn =true;
			}
			 
			con.commit();

		} catch (SQLException e) {
			System.out.println("DB 처리:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback에러:" + e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타 예외:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return bIdCofirmReturn;
	}
//--------------------------------------------로그인한 계정정보 기능메서드---------------------------------------------------
	public List<CGVuserInfoVo> login(CGVuserInfoVo idpasswd) {
		List <CGVuserInfoVo> userlist = new ArrayList<CGVuserInfoVo>();
		
		String sql = "SELECT * FROM cgvUser WHERE id = ? AND password = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, idpasswd.getsId());
			pstmt.setString(2, idpasswd.getsPassword());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userlist.add(new CGVuserInfoVo(
											rs.getString("usercode"),
											rs.getString("div"),
											rs.getString("name"),
											rs.getString("id"),
											rs.getString("password"),
											rs.getString("phonenum"),
											rs.getString("gender"),
											rs.getInt("age"),
											rs.getInt("point")
							));
			}
			con.commit();

		} catch (SQLException e) {
			System.out.println("DB 처리:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback에러:" + e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타 예외:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return userlist;
	}
//-------------------------------------------CGVHomeMenu main() 기능메서드---------------------------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		MovieHome homedao = new MovieHome();
		Movie movieInfodao = new Movie(); 
		MovieReview movieReviewdao = new MovieReview();
		MovieScreening movieScreeningdao = new MovieScreening();
		
		System.out.println("☆★☆★☆★저희 CGV에 오신걸 환영합니다.★☆★☆★☆");
		System.out.println("");

		boolean homeMenuWhile = true;

		while (homeMenuWhile) {
			System.out.println("☞ 실행하실 메뉴를 골라주세요.");
			System.out.println("1:회원가입");
			System.out.println("2:로그인");
			System.out.println("3:비회원예매하기");
			int iHomeMenuChoice = sc.nextInt();
			sc.nextLine();
			switch (iHomeMenuChoice) {
			case 1:
				String sManagerDiv;
				String sGender;
				String sID;

				while (true) {
					System.out.println("☞ 관리자입니까?(Y/N)");
					String sManagerDivQue = sc.nextLine();

					if (sManagerDivQue.toUpperCase().equals("Y")) {
						sManagerDiv = "관리자";
						break;

					} else if (sManagerDivQue.toUpperCase().equals("N")) {
						sManagerDiv = "사용자";
						break;

					} else {
						System.out.println("[안내메시지] Y/N으로 입력해주세요");
					}
				}

				while (true) {
					System.out.print("☞ 아이디: ");
					sID = sc.nextLine();
					if (homedao.isIdConfirmSel("ID",new CGVuserInfoVo(sID)) == true) {
						System.out.println("[안내메시지] 입력하신 ID는 이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
					} else {
						break;
					}
				}

				System.out.print("☞ 패스워드: ");
				String sPassword = sc.nextLine();

				System.out.print("☞ 이름: ");
				String sName = sc.nextLine();

				System.out.print("☞ 휴대폰번호: ");
				String sPhoneNumber = sc.nextLine();

				while (true) {
					System.out.println("☞ 성별\n 1:남\n 2:여");
					int iGenderChoice = sc.nextInt();
					sc.nextLine();

					if (iGenderChoice == 1) {
						sGender = "남";
						break;
					} else if (iGenderChoice == 2) {
						sGender = "여"; // 주민번호를 입력받아서 gender에 남/여를 넣을까말까..
						break;
					} else {
						System.out.println("[안내메시지] 1/2 중에 선택바랍니다.");
					}
				}

				System.out.print("☞ 나이: ");
				int iAge = sc.nextInt();
				sc.nextLine();

				homedao.cgvSignUpinsert(new CGVuserInfoVo(sManagerDiv, sName, sID, sPassword, sPhoneNumber, sGender, iAge));
				homeMenuWhile = true;
				break;

			case 2:
				System.out.print("☞ 아이디:");
				String sLoginID = sc.nextLine();
				System.out.print("☞ 패스워드:");
				String sLoginPass = sc.nextLine();
				String auth = null;
				String loginID = null;
				
				if(homedao.isIdConfirmSel("PASSWORD", new CGVuserInfoVo(sLoginID, sLoginPass))==true) { //회원정보테이블에 계정이 있으면, 
					
					List<CGVuserInfoVo> userlist = homedao.login(new CGVuserInfoVo(sLoginID, sLoginPass));
					for(CGVuserInfoVo userinfo:userlist) {
						auth = userinfo.getsDiv();
						loginID = userinfo.getsId();
						System.out.println("[안내메시지]\""+userinfo.getsDiv()+"\"인 "+userinfo.getsId()+" 님이 정상적으로 로그인 되었습니다.\n");
					}
					
					if(auth.equals("관리자")) {
						boolean managerMenuWhile = true;
						while(managerMenuWhile) {
							System.out.println("☞ 실행하실 메뉴를 선택해주세요.(관리자) ");
							System.out.println("1:영화정보");
							System.out.println("2:영화리뷰");
							System.out.println("3:상영정보등록");
							System.out.println("4:회원정보");
							System.out.println("5:로그아웃");
							int iMgrMenuChoice = sc.nextInt();
							sc.nextLine();
							switch(iMgrMenuChoice) {
								case 1 :
									movieInfodao.movieInfo(auth,loginID);
									managerMenuWhile = true;
									homeMenuWhile = false;
									break;
									
								case 2 :
									movieReviewdao.movieReview(auth,loginID);
									managerMenuWhile = true;
									homeMenuWhile = false;
									break;
								
								case 3 :
									movieScreeningdao.movieScreening(auth,loginID);
									break;
									
								case 4 :
									System.out.println("☞ 메뉴를 선택해주세요.");
									System.out.println("1:회원조회");
									System.out.println("2:회원수정");
									System.out.println("3:회원삭제");
									System.out.println("4:뒤로가기");
									int memberMenuChoice = sc.nextInt();
									sc.nextLine();
									switch(memberMenuChoice) {
										case 1:
											for(CGVuserInfoVo userinfo:userlist) {
												System.out.println("▼ My 회원정보 ▼");
												System.out.println("▶ 회원권한: "+userinfo.getsDiv());
												System.out.println("▶ ID: "+userinfo.getsId());
												System.out.println("▶ Password: "+userinfo.getsPassword());
												System.out.println("▶ 이름: "+userinfo.getsName());
												System.out.println("▶ 휴대폰번호: "+userinfo.getsPhonenum());
												System.out.println("▶ 성별: "+userinfo.getsGender());
												System.out.println("▶ 나이: "+userinfo.getiAge() +"세");
												System.out.println("▶ 포인트: "+userinfo.getdPoint()+" P\n");
											}
											break;
											
										case 2:
											
											break;
											
										case 3:
											while(true) {
												System.out.println("☞ 정말 회원탈퇴를 하시겠습니까?(Y/N)");
												String memberRemove = sc.nextLine();
												
												if(memberRemove.toUpperCase().equals("Y")) {
													homedao.cgvMemberRemove(new CGVuserInfoVo(sLoginID, sLoginPass));
													break;
												}else if(memberRemove.toUpperCase().equals("N")) {
													break;
												}else {
													System.out.println("[안내메시지] Y/N으로 입력해주세요.");
												}
											}
											break;
											
										case 4:
											
											break;
										
										default:
											System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
											break;
									}
									managerMenuWhile = true;
									homeMenuWhile = false;
									break;
									
								case 5 :
									managerMenuWhile = false;
									homeMenuWhile = true;
									break;
								
								default : 
									System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
									break;
							}
						}
						
					} else if(auth.equals("사용자")) {
						boolean userMenuWhile = true;
						while(userMenuWhile) {
							System.out.println("☞ 실행하실 메뉴를 선택해주세요.(사용자)");
							System.out.println("1:영화정보");
							System.out.println("2:영화리뷰");
							System.out.println("3:예매하기");
							System.out.println("4:회원정보");
							System.out.println("5:로그아웃");
							int iUserMenuChoice = sc.nextInt();
							sc.nextLine();
							switch(iUserMenuChoice) {
								case 1 :
									movieInfodao.movieInfo(auth, loginID);
									userMenuWhile = true;
									homeMenuWhile = false;
									break;
									
								case 2 :
									movieReviewdao.movieReview(auth,loginID);
									userMenuWhile = true;
									homeMenuWhile = false;
									break;
									
								case 3:
									movieScreeningdao.movieScreening(auth,loginID);
									userMenuWhile = true;
									homeMenuWhile = false;
									break;
								
								case 4 :
									System.out.println("☞ 메뉴를 선택해주세요.");
									System.out.println("1:회원조회");
									System.out.println("2:회원수정");
									System.out.println("3:회원삭제");
									System.out.println("4:뒤로가기");
									int memberMenuChoice = sc.nextInt();
									sc.nextLine();
									switch(memberMenuChoice) {
										case 1:
											for(CGVuserInfoVo userinfo:userlist) {
												System.out.println("▼ My 회원정보 ▼");
												System.out.println("▶ 회원권한: "+userinfo.getsDiv());
												System.out.println("▶ ID: "+userinfo.getsId());
												System.out.println("▶ Password: "+userinfo.getsPassword());
												System.out.println("▶ 이름: "+userinfo.getsName());
												System.out.println("▶ 휴대폰번호: "+userinfo.getsPhonenum());
												System.out.println("▶ 성별: "+userinfo.getsGender());
												System.out.println("▶ 나이: "+userinfo.getiAge() +"세");
												System.out.println("▶ 포인트: "+userinfo.getdPoint()+" P\n");
											}
											break;
											
										case 2:
											
											break;
											
										case 3:
											while(true) {
												System.out.println("☞ 정말 회원탈퇴를 하시겠습니까?(Y/N)");
												String memberRemove = sc.nextLine();
												
												if(memberRemove.toUpperCase().equals("Y")) {
													for(CGVuserInfoVo userinfo:userlist) {
														movieReviewdao.reviewRemove(userinfo.getsUsercode());
													}
													homedao.cgvMemberRemove(new CGVuserInfoVo(sLoginID, sLoginPass)); //탈퇴 진행이 안됌
													break;
												}else if(memberRemove.toUpperCase().equals("N")) {
													break;
												}else {
													System.out.println("[안내메시지] Y/N으로 입력해주세요.");
												}
											}
											break;
											
										case 4:
											
											break;
										
										default:
											System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
											break;
									}
									userMenuWhile = true;
									homeMenuWhile = false;
									break;
									
								case 5 :
									userMenuWhile = false;
									homeMenuWhile = true;
									break;
									
								default : 
									System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
									break;
							}
						}
						
					} else {
						System.out.println("[안내메시지] 관리자/사용자 error!"); //의미없음
					}
					
				} else {
					System.out.println("[안내메시지] 회원정보가 없습니다. 아이디/비밀번호를 정확히 입력해주세요.\n");
					homeMenuWhile = true;
				}
				break;

			case 3:
				System.out.println("비회원예매");
				homeMenuWhile = false;
				break;

			default:
				System.out.println("[안내메시지] 메뉴에 있는 번호를 입력해주세요.");
				homeMenuWhile = true;
				break;

			}
		}

	}

}
