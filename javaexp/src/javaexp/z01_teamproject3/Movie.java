package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.EmpQua;
import javaexp.z01_teamproject3.vo.MovieVo;

public class Movie {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

//--------------------------------------------영화정보등록 기능메서드------------------------------------------------------
	public void movieInfoInsert(MovieVo movIs) {
		String sql = "INSERT INTO movie "
				+ "VALUES('movie'||movieCode_seq.nextval,"
				+ " ?, ?, ?, ?, ?, ?,null,0)";
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
			System.out.println("[안내메시지] 영화정보가 정상적으로 등록되었습니다.\n");
			
		String sql2 = "UPDATE movie \r\n"
					+ "SET state = '상영중'\r\n"
					+ "WHERE startdate<=sysdate AND \r\n"
					+ "enddate>sysdate";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql2);
			
			rs = pstmt.executeQuery();
			con.commit();
			
		String sql3 = "UPDATE movie \r\n"
					+ "SET state = '개봉예정'\r\n"
					+ "WHERE startdate>sysdate AND \r\n"
					+ "enddate>sysdate";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql3);
			
			rs = pstmt.executeQuery();
			con.commit();	
			
		String sql4 = "UPDATE movie \r\n"
					+ "SET state = '상영종료'\r\n"
					+ "WHERE startdate<sysdate AND \r\n"
					+ "enddate<sysdate";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql4);
				
			rs = pstmt.executeQuery();
			con.commit();	
			
		
		String sql5 = "SELECT * FROM movie WHERE title= ?";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql5);
			
			pstmt.setString(1, movIs.getsTitle());
			
			rs = pstmt.executeQuery();
			con.commit();
			
			while (rs.next()) {
				System.out.println("▼ 등록하신 영화정보▼");
				System.out.println("▶ 영화코드: " + rs.getString("moviecode"));
				System.out.println("▶ 영화제목: " + rs.getString("title"));
				System.out.println("▶ 감독: " + rs.getString("director"));
				System.out.println("▶ 배우: " + rs.getString("actor"));
				System.out.println("▶ 장르: " + rs.getString("genre"));
				System.out.println("▶ 상영시작날짜: " + rs.getString("startdate"));
				System.out.println("▶ 상영종료날짜: " + rs.getString("enddate"));
				System.out.println("▶ 상영상태: " + rs.getString("state")+"\n");
			}

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
//--------------------------------------------영화정보수정 기능메서드------------------------------------------------------	
	public boolean IsmovieSelect(String code) {
		boolean mReturn = false;
		
		String sql = "SELECT * FROM movie\r\n"
				+ "WHERE moviecode=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int nRowCnt = rs.getRow();
				if(nRowCnt == 0) {
					mReturn = false;
				} else {
					mReturn = true;
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
		return mReturn;
	}
//--------------------------------------------영화정보수정 기능메서드------------------------------------------------------
public void movieInfoUpdate(String moviecode,String column,MovieVo movIs) {
	
	String sql = "UPDATE movie \r\n";
	
	try {
		switch(column) {
			case "제목":
				sql += "SET title = ?\r\n"
						+ "WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsTitle());
				pstmt.setString(2, moviecode);
				
				break;
				
			case "감독":
				sql += "SET director = ?\r\n"
						+ "WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsDirector());
				pstmt.setString(2, moviecode);
				break;
				
			case "배우":
				sql += "SET actor = ?\r\n"
						+ "WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsActor());
				pstmt.setString(2, moviecode);
				break;
				
			case "장르":
				sql += "SET genre = ?\r\n"
						+ "WHERE moviecode = ?";
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsGenre());
				pstmt.setString(2, moviecode);
				break;
				
			case "상영시작날짜":
				sql += "SET startdate = ?\r\n"
						+ "WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsStartdate());
				pstmt.setString(2, moviecode);
				break;
				
			case "상영종료날짜":
				sql += "SET enddate = ?\r\n"
						+ "WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, movIs.getsEnddate());
				pstmt.setString(2, moviecode);
				break;
					
			default: 
				System.out.println("[안내메시지] 테이블에서 수정할수 없는 속성값입니다.");
				break;
		}
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("[안내메시지] 입력하신 영화 정보가 정상적으로 수정되었습니다.\n");
			
			
			String sql2 = "SELECT * FROM movie WHERE moviecode = ?";
				
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql2);
				
				pstmt.setString(1, moviecode);
				
				rs = pstmt.executeQuery();
				con.commit();
				
				while (rs.next()) {
					System.out.println("▼ 수정하신 영화정보▼");
					System.out.println("▶ 영화코드: " + rs.getString("moviecode"));
					System.out.println("▶ 영화제목: " + rs.getString("title"));
					System.out.println("▶ 감독: " + rs.getString("director"));
					System.out.println("▶ 배우: " + rs.getString("actor"));
					System.out.println("▶ 장르: " + rs.getString("genre"));
					System.out.println("▶ 상영시작날짜: " + rs.getString("startdate"));
					System.out.println("▶ 상영종료날짜: " + rs.getString("enddate")+"\n");
				}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화상영상태 자동등록 기능메서드------------------------------------------------------
	public void movieStateUpdate() {
		String sql = "UPDATE movie \r\n"
				+ "SET state = '상영중'\r\n"
				+ "WHERE startdate<=sysdate AND \r\n"
				+ "enddate>sysdate";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			con.commit();

		String sql1 = "UPDATE movie \r\n"
					+ "SET state = '개봉예정'\r\n"
					+ "WHERE startdate>sysdate AND \r\n"
					+ "enddate>sysdate";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql1);
			
			rs = pstmt.executeQuery();
			con.commit();	
			
		String sql2 = "UPDATE movie \r\n"
					+ "SET state = '상영종료'\r\n"
					+ "WHERE startdate<sysdate AND \r\n"
					+ "enddate<sysdate";
			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql2);
				
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
//--------------------------------------------영화정보삭제 기능메서드------------------------------------------------------
	public void movieInfoDelete(MovieVo movIs) {
		String sql = "delete from movie where moviecode = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, movIs.getsMovieCode());

			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("[안내메시지] 입력하신 영화 정보가 정상적으로 삭제되었습니다.\n");
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

//--------------------------------------------영화정보전체조회 기능메서드------------------------------------------------------
	public void movieInfoAll() {
		String sql = "SELECT * FROM movie ORDER BY moviecode";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			con.commit();
			System.out.println("▼전체영화정보▼");
			while (rs.next()) {
				System.out.println("▶ 영화코드: " + rs.getString("moviecode"));
				System.out.println("▶ 영화제목: " + rs.getString("title"));
				System.out.println("▶ 감독: " + rs.getString("director"));
				System.out.println("▶ 배우: " + rs.getString("actor"));
				System.out.println("▶ 장르: " + rs.getString("genre"));
				System.out.println("▶ 상영시작날짜: " + rs.getString("startdate"));
				System.out.println("▶ 상영종료날짜: " + rs.getString("enddate"));
				System.out.println("▶ 상영상태: " + rs.getString("state"));
				System.out.println("▶ 예매수: " + rs.getString("resercnt") + "\n");
			}

		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

//--------------------------------------------영화코드정보조회 기능메서드------------------------------------------------------
	public void movieInfoView(MovieVo movIs) {
		String sql = "SELECT * FROM movie WHERE moviecode=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, movIs.getsMovieCode());

			rs = pstmt.executeQuery();
			con.commit();

			while (rs.next()) {
				System.out.println();
				System.out.println("▼입력하신 영화정보▼");
				System.out.println("▶ 영화코드: " + rs.getString("MovieCode"));
				System.out.println("▶ 영화제목: " + rs.getString("Title"));
				System.out.println("▶ 감독: " + rs.getString("Director"));
				System.out.println("▶ 배우: " + rs.getString("Actor"));
				System.out.println("▶ 장르: " + rs.getString("Genre"));
				System.out.println("▶ 상영시작날짜: " + rs.getString("Startdate"));
				System.out.println("▶ 상영종료날짜: " + rs.getString("Enddate"));
				System.out.println("▶ 상영상태: " + rs.getString("state"));
				System.out.println("▶ 예매수: " + rs.getString("resercnt") + "\n");
			}

		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화검색조회 기능메서드------------------------------------------------------
	public List<MovieVo> movieInfoIndexView(String indexColumn,String indexWord){
		List<MovieVo> mlist = new ArrayList<MovieVo>();
	
	//public void movieInfoIndexView(String indexColumn,String indexWord) {
		
		String sql = "SELECT * FROM movie\r\n";
		switch(indexColumn) {
			case "제목" :
				sql += "WHERE title LIKE '%'||?||'%'";
				break;
				
			case "감독" :
				sql += "WHERE director LIKE '%'||?||'%'";
				break;
				
			case "배우" :
				sql += "WHERE actor LIKE '%'||?||'%'";
				break;
				
			case "장르" :
				sql += "WHERE genre LIKE '%'||?||'%'";
				break;
				
			default : 
				System.out.println("[안내메시지] 검색하신 속성이 없습니다."); //의미없음
				break;
		}
		
		try {			
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, indexWord);
			rs = pstmt.executeQuery();
			con.commit();
						
			while (rs.next()) {
				mlist.add(new MovieVo(
							rs.getString("MovieCode"),
							rs.getString("Title"),
							rs.getString("Director"),
							rs.getString("Actor"),
							rs.getString("Genre"),
							rs.getString("Startdate"),
							rs.getString("Enddate"),
							rs.getString("state"),
							rs.getString("resercnt")
							)
				);
				System.out.println();
				System.out.println("▼입력하신 영화정보▼");
				System.out.println("▶ 영화코드: " + rs.getString("MovieCode"));
				System.out.println("▶ 영화제목: " + rs.getString("Title"));
				System.out.println("▶ 감독: " + rs.getString("Director"));
				System.out.println("▶ 배우: " + rs.getString("Actor"));
				System.out.println("▶ 장르: " + rs.getString("Genre"));
				System.out.println("▶ 상영시작날짜: " + rs.getString("Startdate"));
				System.out.println("▶ 상영종료날짜: " + rs.getString("Enddate"));
				System.out.println("▶ 상영상태: " + rs.getString("state"));
				System.out.println("▶ 예매수: " + rs.getString("resercnt") + "\n");
			}
			if(mlist.size()==0) {
				System.out.println("[안내메시지] 입력하신 영화가 존재하지 않습니다.");
			}
				
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mlist;
	}
//--------------------------------------------영화상태조회 기능메서드------------------------------------------------------
	public void movieInfoStateView(String movieState) {
		
		String sql = "SELECT * FROM movie\r\n";
		try {			
			switch(movieState) {
				case "상영중" :
					sql += "WHERE state='상영중'";
					con = DB.con();
					con.setAutoCommit(false);
					pstmt = con.prepareStatement(sql);	
					break;
					
				case "상영종료" :
					sql += "WHERE state='상영종료'";
					con = DB.con();
					con.setAutoCommit(false);
					pstmt = con.prepareStatement(sql);
					break;
					
				case "개봉예정" :
					sql += "WHERE state='개봉예정'";
					con = DB.con();
					con.setAutoCommit(false);
					pstmt = con.prepareStatement(sql);
					break;
					
				default : 
					System.out.println("[안내메시지] 요청하신 상영상태가 없습니다."); //의미없음
					break;
			}
			
			rs = pstmt.executeQuery();
			con.commit();
			
			while (rs.next()) {
				System.out.println();
				System.out.println("▼입력하신 영화정보▼");
				System.out.println("▶ 영화코드: " + rs.getString("MovieCode"));
				System.out.println("▶ 영화제목: " + rs.getString("Title"));
				System.out.println("▶ 감독: " + rs.getString("Director"));
				System.out.println("▶ 배우: " + rs.getString("Actor"));
				System.out.println("▶ 장르: " + rs.getString("Genre"));
				System.out.println("▶ 상영시작날짜: " + rs.getString("Startdate"));
				System.out.println("▶ 상영종료날짜: " + rs.getString("Enddate"));
				System.out.println("▶ 상영상태: " + rs.getString("state"));
				System.out.println("▶ 예매수: " + rs.getString("resercnt") + "\n");
			}
			
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//--------------------------------------------영화순위조회 기능메서드------------------------------------------------------
	public void movieInfoTopView() {
		String sql = "SELECT * FROM (\r\n"
					+ "SELECT * FROM movie\r\n"
					+ "ORDER BY resercnt DESC)\r\n"
					+ "WHERE rownum<=5";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			con.commit();
			
			System.out.println("▼Top5 무비차트(예매율순위)▼");
			while (rs.next()) {
				System.out.println(rs.getRow()+"위");
				System.out.println("▶ 영화제목: " + rs.getString("Title"));
				System.out.println("▶ 예매수: " + rs.getString("resercnt") + "\n");
			}

		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
//---------------------------------------------영화정보 Main()-----------------------------------------------------
	//public static void main(String[] args) {
		// TODO Auto-generated method stub
	public void movieInfo(String sAuthMenu) {
		boolean managerAndUserWhile = true;
		while(managerAndUserWhile) {
			//System.out.println("☞ 관리자/사용자 중 무엇입니까?");
			Scanner sc = new Scanner(System.in);
			//String auth = sc.nextLine();
			boolean bManagerWhile = true;
			boolean bUserWhile = true;
			Movie dao = new Movie();
			dao.movieStateUpdate(); //영화 상영상태 자동등록
	
			if (sAuthMenu.equals("관리자")) {
	
				while (bManagerWhile) {
					System.out.println("☞ 메뉴를 선택해주세요.");
					System.out.println("1: 영화정보 등록");
					System.out.println("2: 영화정보 수정");
					System.out.println("3: 영화정보 삭제");
					System.out.println("4: 영화정보 조회");
					System.out.println("5: 뒤로가기");
					int iMovieManagerMenu = sc.nextInt();
					sc.nextLine();
	
					switch (iMovieManagerMenu) {
					case 1:
						while (true) {
							System.out.println("☞영화를 등록하시겠습니까?(Y/N)"); 
							String sMovieInsertConfirm = sc.nextLine();
							if (sMovieInsertConfirm.toUpperCase().equals("Y")) {
								System.out.print("☞ 영화제목: ");
								String sMovieName = sc.nextLine();
								System.out.print("☞ 감독: ");
								String sDirector = sc.nextLine();
								System.out.print("☞ 배우: ");
								String sActors = sc.nextLine();
								System.out.print("☞ 장르: ");
								String sGenre = sc.nextLine();
								System.out.print("☞ 상영시작날짜(YYYYMMDD): "); //상영날짜에 따른 상영상태 자동등록
								String sStartDate = sc.nextLine();
								System.out.print("☞ 상영종료날짜(YYYYMMDD): ");
								String sEndDate = sc.nextLine();
								dao.movieInfoInsert(
								new MovieVo(sMovieName, sDirector, sActors, sGenre, sStartDate, sEndDate));
							
								break;
	
							} else if (sMovieInsertConfirm.toUpperCase().equals("N")) {
								break;
	
							} else {
								System.out.println("[안내메시지]Y/N으로 입력해주세요");
							}
						}
						break;
	
					case 2:
						dao.movieInfoAll();
						System.out.println("☞ 영화정보를 수정할 영화코드를 입력해주세요");
						String sUpdateMovieChoice = sc.nextLine();
						
						if(dao.IsmovieSelect(sUpdateMovieChoice)== true){
							System.out.println("☞ 해당영화의 무슨속성을 수정하시겠습니까?");
							System.out.println("1:영화제목");
							System.out.println("2:감독");
							System.out.println("3:배우");
							System.out.println("4:장르");
							System.out.println("5:상영시작날짜");
							System.out.println("6:상영종료날짜");
							int iMovieColumnChoice=sc.nextInt();
							sc.nextLine();
							
							MovieVo updateMovie = new MovieVo();
							
							switch(iMovieColumnChoice) {
								case 1:
									System.out.print("☞ 수정하실 제목명: ");
									String updateTitle= sc.nextLine();
									updateMovie.setsTitle(updateTitle);
									dao.movieInfoUpdate(sUpdateMovieChoice,"제목", updateMovie);
									break;
									
								case 2:
									System.out.print("☞ 수정하실 감독: ");
									String updateDirector= sc.nextLine();
									updateMovie.setsDirector(updateDirector);
									dao.movieInfoUpdate(sUpdateMovieChoice,"감독", updateMovie);
									break;
									
								case 3:
									System.out.print("☞ 수정하실 배우: ");
									String updateActor= sc.nextLine();
									updateMovie.setsActor(updateActor);
									dao.movieInfoUpdate(sUpdateMovieChoice,"배우", updateMovie);
									break;
									
								case 4:
									System.out.print("☞ 수정하실 장르: ");
									String updateGenre= sc.nextLine();
									updateMovie.setsGenre(updateGenre);
									dao.movieInfoUpdate(sUpdateMovieChoice,"장르", updateMovie);
									break;
									
								case 5:
									System.out.print("☞ 수정하실 상영시작날짜(YYYYMMDD): ");
									String updateStartdate= sc.nextLine();
									updateMovie.setsStartdate(updateStartdate);
									dao.movieInfoUpdate(sUpdateMovieChoice,"상영시작날짜", updateMovie);
									break;
									
								case 6:
									System.out.print("☞ 수정하실 상영종료날짜(YYYYMMDD) ");
									String updateEnddate= sc.nextLine();
									updateMovie.setsEnddate(updateEnddate);
									dao.movieInfoUpdate(sUpdateMovieChoice,"상영종료날짜", updateMovie);
									break;
									
								default:
									System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
									break;
							}
							dao.movieStateUpdate(); //영화 상영상태 자동등록
							
						}else {
							System.out.println("[안내메시지]입력한 영화코드가 없습니다. 정확한 영화코드를 입력해주시기 바랍니다.");
						}
					
						break;
	
					case 3:
						dao.movieInfoAll();
						System.out.println("☞ 삭제하실 영화코드를 입력해주세요.");
						String sRemoveMovieCode = sc.nextLine();
						if(dao.IsmovieSelect(sRemoveMovieCode)== true){
							dao.movieInfoView(new MovieVo(sRemoveMovieCode));
		
							while (true) {
								System.out.println("☞ 해당 영화를 정말 삭제하시겠습니까?(Y/N)");
								String sMovieRemoveConfirm = sc.nextLine();
		
								if (sMovieRemoveConfirm.toUpperCase().equals("Y")) {
									dao.movieInfoDelete(new MovieVo(sRemoveMovieCode));
									break;
								} else if (sMovieRemoveConfirm.toUpperCase().equals("N")) {
									break;
								} else {
									System.out.println("[안내메시지]Y/N으로 입력해주세요");
								}
							}
							
						}else {
							System.out.println("[안내메시지]입력하신 영화코드가 없습니다. 정확한 영화코드를 입력해주시기 바랍니다.");
						}
		
						break;
	
					case 4:
						boolean allAndIndexWhile = true;
						while(allAndIndexWhile) {
							System.out.println("☞ 다음 중 무슨 조회를 하시겠습니까?");
							System.out.println("1:전체조회");
							System.out.println("2:검색조회");
							int sAllandIndexChoice = sc.nextInt();
							sc.nextLine();
							switch(sAllandIndexChoice) {
								case 1 :
									dao.movieInfoAll();
									allAndIndexWhile = false;
									break;
										
								case 2 : 
									boolean indexColumnWhile = true;
									while(indexColumnWhile) {
										System.out.println("☞ 보기 중 무엇을 검색하시겠습니까?");
										System.out.println("1:영화제목");
										System.out.println("2:영화감독");
										System.out.println("3:영화배우");
										System.out.println("4:영화장르");
										System.out.println("5:상영중인 영화");
										System.out.println("6:상영종료인 영화");
										System.out.println("7:개봉예정인 영화");
										int iIndexMovieColumn = sc.nextInt();
										sc.nextLine();
										switch(iIndexMovieColumn) {
											case 1:
												System.out.print("☞ 검색할 영화명:");
												String sIndexMoviename = sc.nextLine();
												dao.movieInfoIndexView("제목", sIndexMoviename);
												indexColumnWhile = false;
												break;
																						
											case 2:
												System.out.print("☞ 검색할 감독:");
												String sIndexMovieDirector = sc.nextLine();
												dao.movieInfoIndexView("감독", sIndexMovieDirector);
												indexColumnWhile = false;
												break;
												
											case 3:
												System.out.print("☞ 검색할 배우:");
												String sIndexMovieActor = sc.nextLine();
												dao.movieInfoIndexView("배우", sIndexMovieActor);
												indexColumnWhile = false;
												break;
												
											case 4:
												System.out.print("☞ 검색할 장르:");
												String sIndexMovieGerne = sc.nextLine();
												dao.movieInfoIndexView("장르", sIndexMovieGerne);
												indexColumnWhile = false;
												break;
												
											case 5:
												dao.movieInfoStateView("상영중");
												indexColumnWhile = false;
												break;
												
											case 6:
												dao.movieInfoStateView("상영종료");
												indexColumnWhile = false;
												break;
												
											case 7:
												dao.movieInfoStateView("개봉예정");
												indexColumnWhile = false;
												break;
												
											default :
												System.out.println("[안내메시지]보기에 있는 숫자를 입력해주세요.");
												indexColumnWhile = true;
												break;
										}
									}
									allAndIndexWhile = false;
									break;
										
								default : 
									System.out.println("[안내메시지]보기에 있는 숫자를 입력해주세요.");
									allAndIndexWhile = true;
									break;
							}
						}
						break;
	
					case 5:
						bManagerWhile = false;
						break;
	
					default:
						System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
						break;
					}
				}
				managerAndUserWhile = false;
			} else if (sAuthMenu.equals("사용자")) {
				while (bUserWhile) {
					System.out.println("☞ 메뉴를 선택해주세요.");
					System.out.println("1: 영화예매율순위 조회");
					System.out.println("2: 영화정보 조회");
					System.out.println("3: 상영중 영화조회");
					System.out.println("4: 개봉예정 영화조회");
					System.out.println("5: 상영종료 영화조회");
					System.out.println("6: 영화리뷰 조회");
					System.out.println("7: 뒤로가기");
					int iMovieUserMenu = sc.nextInt();
					sc.nextLine();
	
					switch (iMovieUserMenu) {
						case 1:
							dao.movieInfoTopView();
							break;
		
						case 2:
							boolean movieIndexColumnChoice = true;
							while(movieIndexColumnChoice) {
								System.out.println("☞ 보기 중 무엇을 검색하시겠습니까?");
								System.out.println("1:영화제목");
								System.out.println("2:영화감독");
								System.out.println("3:영화배우");
								System.out.println("4:영화장르");
								System.out.println("5:전체");
								System.out.println("6:뒤로가기");
								int iUserIndexMovieColumn = sc.nextInt();
								sc.nextLine();
								
								switch(iUserIndexMovieColumn) {
									case 1:
										System.out.print("☞ 검색할 영화명:");
										String sIndexMoviename = sc.nextLine();
										dao.movieInfoIndexView("제목", sIndexMoviename);
										movieIndexColumnChoice = false;
										break;
																				
									case 2:
										System.out.print("☞ 검색할 감독:");
										String sIndexMovieDirector = sc.nextLine();
										dao.movieInfoIndexView("감독", sIndexMovieDirector);
										movieIndexColumnChoice = false;
										break;
										
									case 3:
										System.out.print("☞ 검색할 배우:");
										String sIndexMovieActor = sc.nextLine();
										dao.movieInfoIndexView("배우", sIndexMovieActor);
										movieIndexColumnChoice = false;
										break;
										
									case 4:
										System.out.print("☞ 검색할 장르:");
										String sIndexMovieGerne = sc.nextLine();
										dao.movieInfoIndexView("장르", sIndexMovieGerne);
										movieIndexColumnChoice = false;
										break;
									
									case 5: 
										dao.movieInfoAll();
										movieIndexColumnChoice = false;
										break;
										
									case 6: 
										movieIndexColumnChoice = false;
										break;
									
									default : 
										System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
										movieIndexColumnChoice = true;
								}
							}
							break;		
						case 3:
							dao.movieInfoStateView("상영중");
							break;
		
						case 4:
							dao.movieInfoStateView("개봉예정");
							break;
		
						case 5:
							dao.movieInfoStateView("상영종료");
							break;
		
						case 6:
							System.out.println("영화리뷰조회");
							break;
		
						case 7:
							bUserWhile = false;
							break;
		
						default:
							System.out.println("[안내메시지]보기에 있는 메뉴를 선택해주세요.");
							break;
					}
				}
				managerAndUserWhile = false;
			} else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
				managerAndUserWhile = true;
			}
		}
	}
}
