package javaexp.z01_teamproject3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
				System.out.println("[안내메시지] 회원가입이 완료되었습니다. 저희 CGV를 이용해주셔서 감사합니다♡");
				
			rs = pstmt.executeQuery();
			con.commit();
			
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
//--------------------------------------------아이디중복확인 기능메서드---------------------------------------------------
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
				System.out.println("[안내메시지] 회원가입이 완료되었습니다. 저희 CGV를 이용해주셔서 감사합니다♡");
				
			rs = pstmt.executeQuery();
			con.commit();
			
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
	
//-------------------------------------------CGVHomeMenu main() 기능메서드---------------------------------------------------	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("☆★☆★☆★저희 CGV에 오신걸 환영합니다.★☆★☆★☆");
		System.out.println("");
		
		boolean homeMenuWhile = true;
		
		while(homeMenuWhile) {
			System.out.println("☞ 실행하실 메뉴를 골라주세요.");
			System.out.println("1:회원가입");
			System.out.println("2:로그인");
			System.out.println("3:비회원예매하기");
			int iHomeMenuChoice = sc.nextInt();
			sc.nextLine();
			switch(iHomeMenuChoice) {
				case 1 :
					
					homeMenuWhile = false;
					break;
					
				case 2 :
					
					homeMenuWhile = false;
					break;
					
				case 3 :
					
					homeMenuWhile = false;
					break;
					
				default :
					System.out.println("[안내메시지] 메뉴에 있는 번호를 입력해주세요.");
					homeMenuWhile = true;
					break;
					
				}
		}
		
	}

}
