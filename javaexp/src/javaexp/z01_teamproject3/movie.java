package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.z01_teamproject3.vo.MovieVo;

public class movie {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
//--------------------------------------------영화정보등록 기능메서드------------------------------------------------------
	public void movieInfoInsert(MovieVo movIs){
		String sql = "INSERT INTO movie VALUES('movie'||movieCode_seq.nextval, ?, ?, ?, ?, ?, ?, null, 0)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
		
			pstmt.setString(1, movIs.getsTitle()); 
			pstmt.setString(2, movIs.getsDirector());
			pstmt.setString(3, movIs.getsActor());
			pstmt.setString(4, movIs.getsGenre());
			pstmt.setString(5, movIs.getsStartdate());
			pstmt.setString(6, movIs.getsEnddate());
			
			rs = pstmt.executeQuery(); 
			con.commit();
			
			while(rs.next()) {
				System.out.println("[안내메시지] 영화정보가 정상적으로 등록되었습니다.");
				System.out.println();
				System.out.println("▼등록하신 영화정보▼");
				System.out.println("▶ 영화코드 :"+rs.getString("moviecode"));
				System.out.println("▶ 영화제목 :"+rs.getString("title"));
				System.out.println("▶ 감독 :"+rs.getString("director"));
				System.out.println("▶ 베우 :"+rs.getString("actor"));
				System.out.println("▶ 장르 :"+rs.getString("genre"));			
				System.out.println("▶ 상영시작날짜 :"+rs.getString("startdate"));			
				System.out.println("▶ 상영종료날짜 :"+rs.getString("enddate"));			
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화정보삭제 기능메서드------------------------------------------------------
	public void movieInfoDelete(MovieVo movIs){
		String sql = "delete from movie where moviecode = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
		
			pstmt.setString(1, movIs.getsMovieCode()); 
			
			rs = pstmt.executeQuery(); 
			con.commit();
			
			while(rs.next()) {
				System.out.println("[안내메시지] 영화정보가 정상적으로 삭제되었습니다.");
				System.out.println();
				System.out.println("▼삭제하신 영화정보▼");
				System.out.println("▶ 영화코드 :"+rs.getString("moviecode"));
				System.out.println("▶ 영화제목 :"+rs.getString("title"));
				System.out.println("▶ 감독 :"+rs.getString("director"));
				System.out.println("▶ 베우 :"+rs.getString("actor"));
				System.out.println("▶ 장르 :"+rs.getString("genre"));			
				System.out.println("▶ 상영시작날짜 :"+rs.getString("startdate"));			
				System.out.println("▶ 상영종료날짜 :"+rs.getString("enddate"));	
				System.out.println("▶ 상영상태 :"+rs.getString("status"));
				System.out.println("▶ 예매수 :"+rs.getString("resercnt")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화정보전체조회 기능메서드------------------------------------------------------
	public void movieInfoAll(){
		String sql = "SELECT * FROM movie";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			con.commit();
				System.out.println("▼ 등록 되어있는 영화정보▼");
			while(rs.next()) {
				System.out.println("▶ 영화코드 :"+rs.getString("moviecode"));
				System.out.println("▶ 영화제목 :"+rs.getString("title"));
				System.out.println("▶ 감독 :"+rs.getString("director"));
				System.out.println("▶ 베우 :"+rs.getString("actor"));
				System.out.println("▶ 장르 :"+rs.getString("genre"));			
				System.out.println("▶ 상영시작날짜 :"+rs.getString("startdate"));			
				System.out.println("▶ 상영종료날짜 :"+rs.getString("enddate"));
				System.out.println("▶ 상영상태 :"+rs.getString("status"));
				System.out.println("▶ 예매수 :"+rs.getString("resercnt")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화정보조회 기능메서드------------------------------------------------------
	public void movieInfoView(MovieVo movIs){
		String sql = "SELECT * FROM movie\r\n"
				+ "WHERE moviecode=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, movIs.getsMovieCode()); 
			
			rs = pstmt.executeQuery(); 
			con.commit();
			
			while(rs.next()) {
				System.out.println();
				System.out.println("▼입력하신 영화정보▼");
				System.out.println("▶ 영화코드 :"+rs.getString("MovieCode"));
				System.out.println("▶ 영화제목 :"+rs.getString("Title"));
				System.out.println("▶ 감독 :"+rs.getString("Director"));
				System.out.println("▶ 베우 :"+rs.getString("Actor"));
				System.out.println("▶ 장르 :"+rs.getString("Genre"));			
				System.out.println("▶ 상영시작날짜 :"+rs.getString("Startdate"));			
				System.out.println("▶ 상영종료날짜 :"+rs.getString("Enddate"));
				System.out.println("▶ 상영상태 :"+rs.getString("status"));
				System.out.println("▶ 예매수 :"+rs.getString("resercnt")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}
	
//---------------------------------------------영화정보 Main()-----------------------------------------------------
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("☞ 관리자/사용자 중 무엇입니까?");
		Scanner sc = new Scanner(System.in);
		String auth = sc.nextLine();
		boolean bManagerWhile=true;
		boolean bUserWhile=true;
		movie dao = new movie();
		
		if(auth.equals("관리자")) {
			
		while(bManagerWhile){
				System.out.println("☞ 메뉴를 선택해주세요.");
				System.out.println("1: 영화정보등록");
				System.out.println("2: 영화정보수정");
				System.out.println("3: 영화정보삭제");
				System.out.println("4: 영화정보조회");
				System.out.println("5: 뒤로가기");
				int iMovieManagerMenu = sc.nextInt();
				sc.nextLine();
				
				switch(iMovieManagerMenu) {
					case 1:
						while(true){
							System.out.println("☞영화를 등록하시겠습니까?(Y/N)");
							String sMovieInsertConfirm = sc.nextLine();
							if(sMovieInsertConfirm.toUpperCase().equals("Y")) {
								System.out.print("☞ 영화제목: ");
								String sMovieName = sc.nextLine();
								System.out.print("☞ 감독: ");
								String sDirector = sc.nextLine();
								System.out.print("☞ 배우: ");
								String sActors = sc.nextLine();
								System.out.print("☞ 장르: ");
								String sGenre = sc.nextLine();
								System.out.print("☞ 상영시작날짜(YYYYMMDD): ");
								String sStartDate = sc.nextLine();
								System.out.print("☞ 상영종료날짜(YYYYMMDD): ");
								String sEndDate = sc.nextLine();
								dao.movieInfoInsert(new MovieVo(sMovieName, sDirector, sActors, sGenre, sStartDate, sEndDate));
								
								break;
								
							} else if(sMovieInsertConfirm.toUpperCase().equals("N")) {
								break;
								
							} else {
								System.out.println("[안내메시지]Y/N으로 입력해주세요");
							}
						}
						break;
						
					case 2:
						System.out.println("영화정보수정");
						break;
						
					case 3:
						dao.movieInfoAll();
						System.out.println("☞ 삭제하실 영화코드를 입력해주세요.");
						String sRemoveMovieCode = sc.nextLine();
						dao.movieInfoView(new MovieVo(sRemoveMovieCode));
						
						while(true) {
							System.out.println("☞ 해당 영화를 정말 삭제하시겠습니까?(Y/N)");
							String sMovieRemoveConfirm = sc.nextLine();
							
							if(sMovieRemoveConfirm.toUpperCase().equals("Y")) {
								dao.movieInfoDelete(new MovieVo(sRemoveMovieCode));
								break;
							} else if(sMovieRemoveConfirm.toUpperCase().equals("N")) {
								break;
							} else {
								System.out.println("[안내메시지]Y/N으로 입력해주세요");
							}
						}
						
						break;
						
					case 4:
						System.out.println("영화정보조회");
						break;
						
					case 5:
						bManagerWhile=false;
						break;
						
					default:
						System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
						break;
				}
			}
			
		}else if(auth.equals("사용자")) {
			while(bUserWhile) {
				System.out.println("☞ 메뉴를 선택해주세요.");
				System.out.println("1: 영화예매율순위조회");
				System.out.println("2: 영화정보조회");
				System.out.println("3: 상영중영화조회");
				System.out.println("4: 개봉예정영화조회");
				System.out.println("5: 상영종료영화조회");
				System.out.println("6: 영화리뷰조회");
				System.out.println("7: 뒤로가기");
				int iMovieUserMenu = sc.nextInt();
				sc.nextLine();
				
				switch(iMovieUserMenu) {
					case 1:
						System.out.println("영화예매율순위 조회");
						break;
						
					case 2:
						System.out.println("영화정보 조회");
						break;
						
					case 3:
						System.out.println("상영중 영화조회");
						break;
						
					case 4:
						System.out.println("개봉예정 영화조회");
						break;
						
					case 5:
						System.out.println("상영종료 영화조회");
						break;
						
					case 6:
						System.out.println("영화리뷰조회");
						break;
						
					case 7:
						bUserWhile=false;
						break;
						
					default:
						System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
						break;
			}
		}
			
		}else {
			System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
		}	
	}
}
