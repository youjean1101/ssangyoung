package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class movieReview {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

//------------------------------------------- 리뷰조회 기능메서드() ---------------------------------------------------
	public void reviewInfoView(String , ) {
		String sql = "SELECT * FROM review\r\n"
						+ "WHERE div='good'";
		
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
	
//-------------------------------------------- 리뷰메뉴 main() ---------------------------------------------------
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("☞ 관리자/사용자 중 무엇입니까?");
		Scanner sc = new Scanner(System.in);
		String sAuthMenu = sc.nextLine();
		
		if(sAuthMenu.equals("관리자")) {
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
					
					break;
					
				case 2:
					
					break;
					
				case 3:
					
					break;
					
				case 4:
					
					break;
					
				case 5:
					
					break;
					
				default:
					
					break;
			}
			
		} else if(sAuthMenu.equals("사용자")){
			System.out.println("☞ 리뷰 메뉴를 선택해주세요.");
			System.out.println("1: 전체리뷰조회");
			System.out.println("2: good 리뷰 조회");
			System.out.println("3: bad 리뷰 조회");
			System.out.println("4: 영화별 리뷰 조회");
			System.out.println("5: 내가쓴 리뷰 조회");
			System.out.println("6: 뒤로가기");
			int iReviewUserMenuChoice = sc.nextInt();
			sc.nextLine();
			switch(iReviewUserMenuChoice) {
				case 1:
					
					break;
					
				case 2:
					
					break;
					
				case 3:
					
					break;
					
				case 4:
					
					break;
					
				case 5:
					
					break;
					
				case 6:
					
					break;
					
				default:
					
					break;
			}
			
		} else {
			System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
		}
	}

}
