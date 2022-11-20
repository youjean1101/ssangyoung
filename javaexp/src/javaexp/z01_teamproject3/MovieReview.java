package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.z01_teamproject3.vo.MovieReviewVo;
import javaexp.z01_teamproject3.vo.MovieVo;

public class MovieReview {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;


//------------------------------------------- 관리자 리뷰조회 기능메서드() ---------------------------------------------------
	public void reviewMgrView(String seldiv) {
		
		String sql = "SELECT u.id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n";
				
		try {
			switch(seldiv) {
				case "전체" :
					break;
					
				case "good" :
					sql += "AND r.div= 'good'";
					break;
					
				case "bad" : 
					sql += "AND r.div= 'bad'";
					break;
					
				default :
					break;
			}
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼ 등록되어있는 리뷰▼");
			while (rs.next()) {
				System.out.println("▶ 영화: " + rs.getString("title"));
				System.out.println("▶ 관람객: " + rs.getString("id"));
				System.out.println("▶ 리뷰내용: " + rs.getString("content"));
				System.out.println("▶ 별점: " + rs.getString("starrating"));
				System.out.println("▶ good/bad구분: " + rs.getString("div")+"\n");
			}

		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//------------------------------------------- 사용자 리뷰조회 기능메서드() ---------------------------------------------------
	public void reviewUserView(String seldiv) {
		
		String sql = "SELECT substr(u.id,1,4)||'****' id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n";
		try {
			switch(seldiv) {
			case "전체" :
				break;
				
			case "good" :
				sql += "AND r.div= 'good'";
				break;
				
			case "bad" : 
				sql += "AND r.div= 'bad'";
				break;
				
			default :
				break;
			}
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼ 등록되어있는 리뷰▼");
			while (rs.next()) {
				System.out.println("▶ 영화: " + rs.getString("title"));
				System.out.println("▶ 관람객: " + rs.getString("id"));
				System.out.println("▶ 리뷰내용: " + rs.getString("content"));
				System.out.println("▶ 별점: " + rs.getString("starrating"));
				System.out.println("▶ good/bad구분: " + rs.getString("div")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
//------------------------------------------- 영화별 관리자 리뷰조회 기능메서드() ---------------------------------------------------
	public void mgrReviewMovieView(String moviename) {
		
		String sql = "SELECT u.id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n"
				+ "AND m.title LIKE '%'|| ? ||'%'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, moviename);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼ 등록되어있는 리뷰▼");
			while (rs.next()) {
				if(rs.getRow()>0) {
					System.out.println("▶ 영화: " + rs.getString("title"));
					System.out.println("▶ 관람객: " + rs.getString("id"));
					System.out.println("▶ 리뷰내용: " + rs.getString("content"));
					System.out.println("▶ 별점: " + rs.getString("starrating"));
					System.out.println("▶ good/bad구분: " + rs.getString("div")+"\n");
				}else {
					System.out.println("[안내메시지] 입력하신 영화 리뷰가 존재하지 않습니다.");
				}
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//------------------------------------------- 영화별 사용자 리뷰조회 기능메서드() ---------------------------------------------------
	public void userReviewMovieView(String moviename) {
		String sql = "SELECT substr(u.id,1,4)||'****' id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n"
				+ "AND m.title LIKE '%'|| ? ||'%'";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, moviename);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼ 등록되어있는 리뷰▼");
			while (rs.next()) {
				if(rs.getRow()>0) {
					System.out.println("▶ 영화: " + rs.getString("title"));
					System.out.println("▶ 관람객: " + rs.getString("id"));
					System.out.println("▶ 리뷰내용: " + rs.getString("content"));
					System.out.println("▶ 별점: " + rs.getString("starrating"));
					System.out.println("▶ good/bad구분: " + rs.getString("div")+"\n");
				}else {
					System.out.println("[안내메시지] 입력하신 영화 리뷰가 존재하지 않습니다.");
				}
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//------------------------------------------- 영화별 사용자 리뷰조회 기능메서드() ---------------------------------------------------
	public boolean IsreviewMovie(String moviename) {
		
		String sql = "SELECT substr(u.id,1,4)||'****' id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n"
				+ "AND m.title LIKE '%'|| ? ||'%'";
		
		boolean movieReturn = false;
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, moviename);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int nRowCnt = rs.getRow();
				if(nRowCnt == 0) {
					movieReturn = false;
				} else {
					movieReturn = true;
				}
			}
			con.commit();
			
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return movieReturn;
	}
//--------------------------------------------영화제목조회 기능메서드------------------------------------------------------
	public void movieNameSelView() {
		String sql = "SELECT * FROM movie";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			con.commit();

			while (rs.next()) {
				System.out.println("No "+rs.getRow()+". "+rs.getString("Title"));
			}

		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//------------------------------------------- 회원별 리뷰조회 기능메서드() ---------------------------------------------------
	public void reviewIDView(String userid) {
		String sql = "SELECT u.id, m.title, r.content, r.starrating, r.div\r\n"
				+ "FROM movie m,review r, cgvuser u\r\n"
				+ "WHERE m.moviecode = r.moviecode\r\n"
				+ "AND r.usercode= u.usercode\r\n"
				+ "AND id = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼ 등록되어있는 리뷰▼");
			while (rs.next()) {
				System.out.println("▶ 영화: " + rs.getString("title"));
				System.out.println("▶ 관람객: " + rs.getString("id"));
				System.out.println("▶ 리뷰내용: " + rs.getString("content"));
				System.out.println("▶ 별점: " + rs.getString("starrating"));
				System.out.println("▶ good/bad구분: " + rs.getString("div")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//------------------------------------------- 회원별 리뷰삭제 기능메서드() ---------------------------------------------------
	public void reviewRemove(String usercode) {
		String sql = "DELETE FROM review\r\n"
					+ "WHERE usercode= ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usercode);
			rs = pstmt.executeQuery();
			con.commit();
			System.out.println("[안내메시지] 사용자님의 리뷰가 삭제되었습니다.");
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
//-------------------------------------------- 리뷰메뉴 main() ---------------------------------------------------
	//public static void main(String[] args) {
		// TODO Auto-generated method stub
	public void movieReview(String sAuthMenu, String id) {
		boolean managerAnduserWhile = true;
		
		while(managerAnduserWhile) {
//			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			Scanner sc = new Scanner(System.in);
//			String sAuthMenu = sc.nextLine();
			MovieReview movieReviewdao = new MovieReview();
			Movie moviedao = new Movie();
			
			
			if(sAuthMenu.equals("관리자")) {
				boolean managerMenuWhile = true;
				while(managerMenuWhile) {
					System.out.println("☞ 리뷰 메뉴를 선택해주세요.");
					System.out.println("1: 전체리뷰조회");
					System.out.println("2: good 리뷰 조회");
					System.out.println("3: bad 리뷰 조회");
					System.out.println("4: 영화별 리뷰 조회");
					System.out.println("5: 뒤로가기");
					int iReviewMgrMenuChoice = sc.nextInt();
					sc.nextLine();
					switch(iReviewMgrMenuChoice) {
						case 1:
							movieReviewdao.reviewMgrView("전체");
							break;
							
						case 2:
							movieReviewdao.reviewMgrView("good");
							break;
							
						case 3:
							movieReviewdao.reviewMgrView("bad");
							break;
							
						case 4:
							movieReviewdao.movieNameSelView();
							System.out.println("\n☞ 리뷰를 보실 영화명은 입력해주세요.");
							String reviewIndexMovie = sc.nextLine();
							movieReviewdao.mgrReviewMovieView(reviewIndexMovie);
							if(movieReviewdao.IsreviewMovie(reviewIndexMovie)==false) {
								System.out.println("[안내메시지] 입력하신 영화는 리뷰는 존재하지 않습니다.\n");
							}
							break;
							
						case 5:
							managerMenuWhile = false;
							break;
							
						default:
							System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
							break;
					}
				}
			managerAnduserWhile = false;
				
			} else if(sAuthMenu.equals("사용자")){
				boolean userMenuWhile = true;
				while(userMenuWhile) {
					System.out.println("☞ 리뷰 메뉴를 선택해주세요.");
					System.out.println("1: 전체리뷰조회");
					System.out.println("2: good 리뷰 조회");
					System.out.println("3: bad 리뷰 조회");
					System.out.println("4: 영화별 리뷰 조회");
					System.out.println("5: 내가쓴 리뷰 조회");
					System.out.println("6: 리뷰 작성하기");
					System.out.println("7: 내가쓴 리뷰 수정"); // 머리아파..
					System.out.println("8: 내가쓴 리뷰 삭제");
					System.out.println("9: 뒤로가기");
					int iReviewUserMenuChoice = sc.nextInt();
					sc.nextLine();
					switch(iReviewUserMenuChoice) {
						case 1:
							movieReviewdao.reviewUserView("전체");
							break;
							
						case 2:
							movieReviewdao.reviewUserView("good");
							break;
							
						case 3:
							movieReviewdao.reviewUserView("bad");
							break;
							
						case 4:
							movieReviewdao.movieNameSelView();
							System.out.println("\n☞ 리뷰를 보실 영화명은 입력해주세요.");
							String reviewIndexMovie = sc.nextLine();
							movieReviewdao.reviewUserView(reviewIndexMovie);
							if(movieReviewdao.IsreviewMovie(reviewIndexMovie)==false) {
								System.out.println("[안내메시지] 입력하신 영화는 리뷰는 존재하지 않습니다.\n");
							}
							break;
							
						case 5:
							movieReviewdao.reviewIDView(id);
							break;
							
						case 6:
							
							break;

						case 7:
							
							break;
							
						case 8:
							
							break;
							
						case 9:
							userMenuWhile = false;
							break;
							
						default:
							System.out.println("[안내메시지]보기에 있는 숫자를 선택해주세요.");
							break;
					}
				}
				managerAnduserWhile = false;
			} else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
			}
		}
	}

}
