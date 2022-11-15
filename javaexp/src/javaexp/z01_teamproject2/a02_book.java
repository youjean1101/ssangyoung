package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Emp;

public class a02_book {
	static a02_book dao = new a02_book();
	static Scanner sc = new Scanner(System.in);
	static LocalDate now = LocalDate.now();
	static DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
// --------------------------------------------- 대여 배달 테이블 데이터 넣기-----------------------------------------
	public void rentalDelieveryInsert(Delivery add) {
		String sql = "INSERT INTO ship values('ABC'||shipno_seq.nextval, sysdate+2, null, ?, ?)"; 
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, add.getsRentalno());
			pstmt.setString(2, add.getsUserno());
			
//				System.out.println("[안내메시지] 회원님의 대여배달등록이 완료되었습니다.\n");
			
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
	
//----------------------------------------------- 배달 테이블에 넣을 대여번호------------------------------------------------------
	public List<Rental> delieveryAddInfo(String ship,String userno) {
	 	List<Rental> list = new ArrayList<Rental>();
					
				String sql ="SELECT * FROM rental \r\n"
						+ "WHERE userno ='"+userno+"'\r\n";
						
				switch(ship) {
				case "대여배달" :
					sql += "AND rentalshipwhether = 'O'";
					break;
					
				case "반납배달" :
					sql += "AND returnshipwhether = 'O'";
					break;
				
				default :
					System.out.println("[안내메시지] 대여배달/반납배달 중 맞게 입력해주세요.");
				}
				
				try {
					con=DB.con();
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						Rental r = new Rental(rs.getString("rentalno"),
												rs.getString("userno"),
												rs.getLong("isbn"),
												rs.getString("rentaldate"),
												rs.getString("rentalshipwhether"),
												rs.getString("returndate"),
												rs.getString("returnwhether"),
												rs.getString("returnshipwhether")
												);
						list.add(r);
					}					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println("DB에러:"+e.getMessage());
					try {
						con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						System.out.println("rollback에러:"+e1.getMessage());
					}
				}catch(Exception e) {
					System.out.println("일반에러:"+e.getMessage());
				}finally {
					DB.close(rs, stmt, con);
				}
				return list;
			}
//----------------------------------------------------------- 대여테이블에 대여 책번호가 있으면 O넣는 기능메서드 ------------------------------------------------------------------------------------
	public void bookWhetherAdd(String bookwhether,long isbn) { 
			String sql = "UPDATE BOOKS \r\n"
					+ " SET rentalwhether = '"+bookwhether+"'\r\n"
					+ " WHERE isbn = '"+isbn+"'"; // 대여테이블에 데이터가 있으면 책테이블 대여여부에 O/X 넣기
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
	
//----------------------------------------------------------- 도서번호 및 대여번호 조회(true/false) 기능메서드 (조건걸어서 insert할예정)------------------------------------------------------------------------------------
	public boolean IsRentalSelect (String whatselect, Rental sel) { 
		
		boolean bReturn = false;
		
		String sql = "SELECT * FROM rental \r\n";
		
		switch(whatselect) {
			case "isbn" :
				sql	+= "WHERE isbn = "+sel.getlIsbn(); // 책 대여등록된 데이터 검색(있으면 true, 없으면 false)
				break;
				
			case "rentalno" :
				sql	+= "WHERE rentalno = '"+sel.getsRentalno()+"'"; //대여번호 (있으면 true,없으면 false) 
				break;
			
			case "returnwhether" :
				sql	+= "WHERE RETURNWHETHER ='O' AND RETURNDATE IS not null AND USERNO = '"+sel.getsUserno()+"'";
				break;
				
			default :
				System.out.println("[안내메시지]검색할 조건을 정확히 입력해주세요.\n");
		}
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next())
			{
				int nRowCnt = rs.getRow(); // 테이블의 행 갯수 변수선언
				if(nRowCnt == 0) { // 행갯수가 1개라도 있으면 true
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

//-----------------------------------------------------------대여번호로 isbn추출(대여)-------------------------------------------------------------------------
	public List<Rental> rentalIsbnPrint() {
		List<Rental> renlist = new ArrayList<Rental>();
		
		
		String sql = "SELECT isbn,rentalno FROM rental\r\n"
					+ "where returnwhether = 'X'";	
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Rental r = new Rental(
						rs.getString("rentalno"),
						rs.getLong("isbn")
						);
				renlist.add(r);
			};
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
		return renlist;
	}
//--------------------------------------------------------- 대여테이블 데이터 생성 기능메서드 ----------------------------------------------------
	public void rentalInsert(Rental add) {
		String sql = "INSERT INTO rental VALUES('AA'||rentalno_seq.nextval,?,?,sysdate,?,null,?,?)"; 
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsUserno());
				pstmt.setLong(2, add.getlIsbn());
				pstmt.setString(3, add.getsShipwhether());
				pstmt.setString(4, add.getsReturnwhether());
				pstmt.setString(5, add.getsReturnShipwhether());
				
				
				System.out.println("[안내메시지] 회원님의 대여등록이 완료되었습니다.\n");
				
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
// ---------------------------------------------- 도서대여가능여부 기능메서드--------------------------------------------------------------------
	public boolean IsBookSelect(Long isbn) { 
		
		boolean bReturn = false;
		String sql = "SELECT * \r\n"
					+ "FROM books\r\n"
					+ "WHERE isbn = '" + isbn + "'";
		
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
// ---------------------------------------------- 대여가능한 도서 출력 기능메서드--------------------------------------------------------------------
	public void rentalpossibleBook() {
		String sql = "SELECT * FROM books WHERE rentalwhether ='X'";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("도서번호\t\t도서명\t출판사\t저자\t장르\t가격\t등록일자\t대여여부\t분류번호");
			while(rs.next()) {
				System.out.print(rs.getLong("isbn")+"\t");
				System.out.print(rs.getString("bname")+"\t");
				System.out.print(rs.getString("publisher")+"\t");
				System.out.print(rs.getString("writer")+"\t");
				System.out.print(rs.getString("genre")+"\t");
				System.out.print(rs.getInt("price")+"\t");
				System.out.print(rs.getString("registdate")+"\t");
				System.out.print(rs.getString("rentalwhether")+"\t");
				System.out.print(rs.getInt("classno")+"\n");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}
// ---------------------------------------------- 도서조회 기능메서드	--------------------------------------------------------------------
	public void bookIndexSelect(String Indexmenu,Book index) {
		
		String sql = "SELECT * FROM books \r\n";
				
		switch(Indexmenu) {
		case "도서명" : 
			sql += "WHERE bname LIKE '%'||'"+index.getBname()+"'||'%'";
			break;
			
		case "도서번호" : 
			sql += "WHERE isbn = '"+index.getIsbn()+"'";
			break;
			
		case "출판사" : 
			sql += "WHERE publisher = '"+index.getPublisher()+"'";
			break;
			
		case "저자" : 
			sql += "WHERE writer = '"+index.getWriter()+"'";
			break;
			
		case "분류번호" : 
			sql += "WHERE classno ='"+index.getClassno()+"'";
			break;
			
		case "등록일자(년/월)" : 
			sql += "WHERE registdate LIKE '"+index.getsRegistdate()+"%'";
			break;
			
		default :
			System.out.println("[안내메시지] 보기에 있는 검색메뉴를 고르세요.");
		
		}
				
			try {
					con = DB.con();
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);

					while(rs.next()) {
						System.out.println("도서번호: "+rs.getLong("isbn"));
						System.out.println("도서명: "+rs.getString("bname"));
						System.out.println("출판사: "+rs.getString("publisher"));
						System.out.println("저자: "+rs.getString("writer"));
						System.out.println("장르: "+rs.getString("genre"));
						System.out.println("가격: "+rs.getInt("price"));
						System.out.println("등록일자: "+rs.getString("registdate"));
						System.out.println("대여여부: "+rs.getString("rentalwhether"));
						System.out.println("분류번호: "+rs.getInt("classno")+"\n");
					}
					int cnt = stmt.executeUpdate(sql);
					if(cnt==0) System.out.println("[안내메시지] 검색하신 도서가 없습니다.");
					
				} catch (SQLException e) {
					System.out.println("DB처리예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
	}
// ---------------------------------------- 도서분류 내용 조회 ----------------------------------------------
	public boolean IsclassficationSelect (int classno) { 
		
		boolean cReturn = false;
		
		String sql = "select * FROM classification WHERE classno = '"+classno+"'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next())
			{
				int nRowCnt = rs.getRow(); // 테이블의 행 갯수 변수선언
				if(nRowCnt < 1) { // 행갯수가 1개라도 있으면 true
					cReturn = false;
				} else {
					cReturn = true;
				}
			}
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return cReturn; // 행갯수가 있으면 true를 리턴
	}
// ---------------------------------------------- 도서분류 추가 기능메서드 ------------------------------------------------------------
	public void classficationInsert(String classficationname) {
		String sql = "INSERT INTO classification VALUES(classno_seq.nextval,'"+classficationname+"')";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs != null) System.out.println("[안내메시지] 도서분류 등록이 완료되었습니다.");
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 분류번호가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}
// ---------------------------------------------- 도서분류 삭제 기능메서드 ------------------------------------------------------------
	public void classficationDelete(int classficationNo) {
		String sql = "DELETE FROM classification WHERE CLASSNO = "+classficationNo;
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs != null) System.out.println("[안내메시지] 도서분류 삭제가 완료되었습니다.");
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 분류번호가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}
// ---------------------------------------------- 도서분류테이블 출력 기능메서드 --------------------------------------------------------------------
	public void classficationListAllPrint() {
		String sql = "select * FROM classification";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
					
			while(rs.next()) {
				System.out.print(rs.getInt("classno")+":\t");
				System.out.print(rs.getString("cname")+"\n");
			}

		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 분류번호가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}
// ---------------------------------------------- 도서테이블 출력 기능메서드	--------------------------------------------------------------------
	public void bookListAllPrint() {
		String sql = "select * FROM books";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
//			System.out.println("도서번호\t\t\t도서명\t\t\t\t\t출판사\t\t저자\t장르\t가격\t등록일자\t대여여부\t분류번호");
			System.out.println("도서번호\t\t\t도서명");
			while(rs.next()) {
				System.out.print(rs.getLong("isbn")+"\t\t");
				System.out.print(rs.getString("bname")+"\n");
				/*
				 * System.out.print(rs.getString("publisher")+"\t\t\t");
				 * System.out.print(rs.getString("writer")+"\t");
				 * System.out.print(rs.getString("genre")+"\t");
				 * System.out.print(rs.getInt("price")+"\t");
				 * System.out.print(rs.getString("registdate")+"\t");
				 * System.out.print(rs.getString("rentalwhether")+"\t");
				 * System.out.print(rs.getInt("classno")+"\n");
				 */
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}

// ---------------------------------------------- 도서조회 기능메서드	--------------------------------------------------------------------
	public void bookSelect(String name) {
		String sql = "SELECT * FROM books \r\n"
				+ "WHERE bname LIKE '%'||'"+name+"'||'%'";
				
			try {
					con = DB.con();
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);

					while(rs.next()) {
						System.out.println("도서번호: "+rs.getLong("isbn"));
						System.out.println("도서명: "+rs.getString("bname"));
						System.out.println("출판사: "+rs.getString("publisher"));
						System.out.println("저자: "+rs.getString("writer"));
						System.out.println("장르: "+rs.getString("genre"));
						System.out.println("가격: "+rs.getInt("price"));
						System.out.println("등록일자: "+rs.getString("registdate"));
						System.out.println("대여여부: "+rs.getString("rentalwhether"));
						System.out.println("분류번호: "+rs.getInt("classno")+"\n");
					}
					int cnt = stmt.executeUpdate(sql);
					if(cnt==0) System.out.println("[안내메시지] 검색하신 도서가 없습니다.");
					
				} catch (SQLException e) {
					System.out.println("DB처리예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
	}
// ----------------------------------------------도서등록 기능메서드--------------------------------------------------------------------
	public void bookInsert(Book add) {
		String sql = "INSERT INTO books values(?,?,?,?,?,?,?,?,?)";
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
				
				pstmt.setLong(1, add.getIsbn());
				pstmt.setString(2, add.getBname());
				pstmt.setString(3, add.getPublisher());
				pstmt.setString(4, add.getWriter());
				pstmt.setString(5, add.getGenre());
				pstmt.setInt(6, add.getPrice());
				pstmt.setString(7, add.getsRegistdate());
				pstmt.setString(8, add.getRentalwhether());
				pstmt.setInt(9, add.getClassno());
				System.out.println("[안내메시지] 도서추가가 완료되었습니다.");
				
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
// ----------------------------------------------도서수정 기능메서드--------------------------------------------------------------------

	public void bookUpdate(long updateisbn, String updatechoice,Book upbook) {
		
		String sql =  " UPDATE books\r\n ";

		switch(updatechoice) {
		case "도서번호" : 		
			sql +=  " SET ISBN ="+upbook.getIsbn()+"\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "도서명" : 
			sql +=  " SET BNAME  = '"+upbook.getBname()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "출판사" : 
			sql +=  " SET PUBLISHER = '"+upbook.getPublisher()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "저자" : 
			sql +=  " SET WRITER = '"+upbook.getWriter()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "장르" : 
			sql +=  " SET GENRE = '"+upbook.getGenre()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "가격" : 
			sql +=  " SET PRICE = "+upbook.getPrice()+"\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "등록일자" :
			sql +=  " SET REGISTDATE = '"+upbook.getsRegistdate()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "대여여부" :
			sql +=  " SET RENTALWHETHER = '"+upbook.getRentalwhether()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case "분류번호" :
			sql +=  " SET CLASSNO = "+upbook.getClassno()+"\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		default : 
			System.out.println("[안내메시지] 수정할 데이터가 없습니다.");
			break;
		}

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
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}
// ----------------------------------------------도서삭제 기능메서드--------------------------------------------------------------------
	public void bookDelete(long delisbn) {
		String sql = "DELETE FROM books WHERE isbn = " + delisbn;
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.commit();
			System.out.println("[안내메시지] 도서삭제가 완료되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 처리:"+e.getMessage());
			try { // 
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		} finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
	}

// ----------------------------------------------도서출력 main--------------------------------------------------------------------
//	public static void main(String[] args) {
		// TODO Auto-generated method stub
	public void BookMenu(String auth, String userno) {
//		System.out.println("☞ 관리자/사용자 중 무엇인가요?");
//		String auth = sc.nextLine();
		if(auth.equals("관리자")) {
			while(true) {
				System.out.println("☞ 도서메뉴를 고르세요."); //관리자/사용자 구분
				System.out.println("1:도서조회");
				System.out.println("2:도서추가");
				System.out.println("3:도서수정");
				System.out.println("4:도서삭제");
				System.out.println("5:도서분류추가");
				System.out.println("6:도서분류삭제");
				int iBookMenu = sc.nextInt();
				sc.nextLine(); //int 입력 초기화 처리
				switch(iBookMenu) {
					case 1 :
						System.out.println("☞ 어떤 도서를 조회하겠습니까?");
						System.out.println("[안내메시지] 도서명으로 검색해주세요!");
						String sBookChoice = sc.nextLine();
						dao.bookSelect(sBookChoice);
		
						break;
						
					case 2 :
						while(true) {
							System.out.println("☞ 도서를 추가하시겠습니까?(Y/N)");
							String sAddBook = sc.nextLine();
							if(sAddBook.toUpperCase().equals("Y")) {
								System.out.print("☞ 도서번호: ");
								long sIsbn = sc.nextLong();
								sc.nextLine();
								System.out.print("☞ 도서명: ");
								String sBookName = sc.nextLine();
								System.out.print("☞ 출판사: ");
								String sPublisher = sc.nextLine();
								System.out.print("☞ 저자: ");
								String sWriter = sc.nextLine();
								System.out.print("☞ 장르: ");
								String sGenre = sc.nextLine();
								System.out.print("☞ 가격(※입력 안할 시,0이라도 입력): ");
								int iPrice = sc.nextInt();
								sc.nextLine();
								System.out.print("☞ 등록일자(※기재 안할 시, 현재날짜 등록): ");
								String sInputRegistdate = sc.nextLine();
								String sRegistdate;
								if (sInputRegistdate=="") { //입력을 안받으면,
									
									sRegistdate = now.format(dateTimeFormatter); //현재시각
								}else { // 입력받으면,
									sRegistdate = sInputRegistdate; //입력받은 값
								}
								String sRentalWhether = null;
								
								dao.classficationListAllPrint();
								
								int iclassno;
								while(true) {
									System.out.print("☞ 분류번호(※위에 보기중에 선택) : "); 
									iclassno = sc.nextInt();
									
									if(dao.IsclassficationSelect(iclassno)==true) { 
										break;
									} else {
										System.out.println("[안내메시지] 선택하신 분류번호가 없습니다. 다시 입력해주세요. \n");
									}
								}
								
								dao.bookInsert(new Book(sIsbn, sBookName, sPublisher, sWriter, sGenre, iPrice, sRegistdate, sRentalWhether, iclassno));
								break;
								
							} else if(sAddBook.toUpperCase().equals("N")) {
								System.out.println("[뒤로가기]\n");
				break;
							} else {
								System.out.println("[안내메시지] Y/N으로 입력해주세요.");
						continue;
							}
						}
						break;
						
					case 3 :
						dao.bookListAllPrint();
						
						long iUpdateBook;
						while(true) {
							System.out.println("☞ 다음 중 수정할 도서번호를 입력하세요.");
							iUpdateBook = sc.nextLong();
							sc.nextLine();
							
							if(dao.IsBookSelect(iUpdateBook)==true) {
								break;
							} else {
								System.out.println("[안내메시지] 도서관에 없는 도서번호입니다. 도서번호를 정확히 입력해주세요.");
							}
						}
						
						
						Book upb = new Book();
					
						System.out.println("☞ 해당 도서의 무슨 메뉴를 수정하시겠습니까?");
						System.out.println("1:도서번호");
						System.out.println("2:도서명");
						System.out.println("3:출판사");
						System.out.println("4:저자");
						System.out.println("5:장르");
						System.out.println("6:가격");
						System.out.println("7:등록일자");
						System.out.println("8:대여여부");
						System.out.println("9:분류번호");
						
						int iBookUpdateMenu = sc.nextInt();
						sc.nextLine();
						
						switch(iBookUpdateMenu) {
							case 1 : 
								System.out.print("☞ 변경할 도서번호: ");
								Long iUpdateBookIsbn = sc.nextLong();
								upb.setIsbn(iUpdateBookIsbn);
								dao.bookUpdate(iUpdateBook,"도서번호",upb);
								System.out.println("[안내메시지] 도서번호 변경이 완료되었습니다.");
								break;
								
							case 2 : 
								System.out.print("☞ 변경할 도서명: ");
								String sUpdateBname = sc.nextLine();
								upb.setBname(sUpdateBname);
								dao.bookUpdate(iUpdateBook,"도서명",upb);
								System.out.println("[안내메시지] 도서명 변경이 완료되었습니다.");
								break;
								
							case 3 : 
								System.out.print("☞ 변경할 출판사: ");
								String sUpdatePublisher = sc.nextLine();
								upb.setPublisher(sUpdatePublisher);
								dao.bookUpdate(iUpdateBook,"출판사",upb);
								System.out.println("[안내메시지] 출판사 변경이 완료되었습니다.");
								break;
								
							case 4 : 
								System.out.print("☞ 변경할 저자: ");
								String sUpdateWriter = sc.nextLine();
								upb.setWriter(sUpdateWriter);
								dao.bookUpdate(iUpdateBook,"저자",upb);
								System.out.println("[안내메시지] 저자 변경이 완료되었습니다.");
								break;
							
							case 5 :
								System.out.print("☞ 변경할 장르: ");
								String sUpdateGenre = sc.nextLine();
								upb.setGenre(sUpdateGenre);
								dao.bookUpdate(iUpdateBook,"장르",upb);
								System.out.println("[안내메시지] 장르 변경이 완료되었습니다.");
								break;
								
							case 6 :
								System.out.print("☞ 변경할 가격: ");
								int iUpdatePrice = sc.nextInt();
								upb.setPrice(iUpdatePrice);
								dao.bookUpdate(iUpdateBook,"가격",upb);
								System.out.println("[안내메시지] 가격 변경이 완료되었습니다.");
								break;
								
							case 7 :
								System.out.print("☞ 변경할 등록일자: ");
								String sUpdateRegistdate = sc.nextLine();
								upb.setsRegistdate(sUpdateRegistdate);
								dao.bookUpdate(iUpdateBook,"등록일자",upb);
								System.out.println("[안내메시지] 등록일자 변경이 완료되었습니다.");
								break;
								
							case 8 :	
								System.out.print("☞ 변경할 대여여부: ");
								String sUpdaterentalwhether = sc.nextLine();
								upb.setRentalwhether(sUpdaterentalwhether);
								dao.bookUpdate(iUpdateBook,"대여여부",upb);
								System.out.println("[안내메시지] 대여여부 변경이 완료되었습니다.");
								break;
								
							case 9 :
								System.out.print("☞ 변경할 분류번호: ");
								int sUpdateclassno = sc.nextInt();
								upb.setClassno(sUpdateclassno);
								dao.bookUpdate(iUpdateBook,"분류번호",upb);
								System.out.println("[안내메시지] 분류번호 변경이 완료되었습니다.");
								break;
								
							default :
								System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
								break;	
						}
					
						break;
						
					case 4 :
						dao.bookListAllPrint();
						long iDeleteBookIsbn;
						
						while(true) {
							System.out.println("☞ 다음 중 삭제할 도서번호를 입력하세요.");
							iDeleteBookIsbn = sc.nextLong();
							if(dao.IsBookSelect(iDeleteBookIsbn)==true) {
								break;
							} else {
								System.out.println("[안내메시지] 도서관에 없는 도서번호입니다. 도서번호를 정확히 입력해주세요.");
							}
						}
						
						dao.bookDelete(iDeleteBookIsbn);
						break;
						
					case 5 :
						System.out.println("☞ 추가하실 도서분류명을 입력해주세요.");
						String sClassificationName = sc.nextLine();
						dao.classficationInsert(sClassificationName);
						break;
						
					case 6 :
						dao.classficationListAllPrint();
						System.out.println("☞ 삭제하실 도서분류번호를 입력해주세요.");
						int delclassificationNo = sc.nextInt();
						sc.nextLine();
						dao.classficationDelete(delclassificationNo);
						break;
						
					default : 
						System.out.println("[안내메시지] 보기에 있는 숫자만 입력해주세요.");
						break;
					}
				}
			
			} else if(auth.equals("사용자")) {
				while(true) {
					System.out.println("☞ 도서 메뉴를 고르세요.");
					System.out.println("1:도서전체조회");
					System.out.println("2:도서검색하기");
					System.out.println("3:대여하기");
					int iUserBookMenu = sc.nextInt();
					sc.nextLine();
					
					switch(iUserBookMenu) {
					case 1 : 
						dao.bookListAllPrint();
						break;
						
					case 2 :
						
						Book index = new Book();
						
						System.out.println("☞ 도서의 무엇을 검색하시겠습니까?");
						System.out.println("1: 도서명 ");
						System.out.println("2: ISBN(도서번호)");
						System.out.println("3: 출판사");
						System.out.println("4: 저자");
						System.out.println("5: 분류번호");
						System.out.println("6: 등록일자(년/월)");
						int iIndexChoice = sc.nextInt();
						sc.nextLine();
						switch(iIndexChoice) {
							case 1:
								System.out.println("☞ 검색하실 도서명을 입력해주세요.");
								String sIndexBname = sc.nextLine();
								index.setBname(sIndexBname);
								System.out.println("[안내메시지] 도서명 검색 결과");
								dao.bookIndexSelect("도서명", index);
								break;
								
							case 2:
								System.out.println("☞ 검색하실 도서번호를 입력해주세요.");
								long lIndexISBN = sc.nextLong();
								index.setIsbn(lIndexISBN);
								System.out.println("[안내메시지] 도서번호 검색 결과");
								dao.bookIndexSelect("도서번호", index);
								break;
								
							case 3:
								System.out.println("☞ 검색하실 출판사를 입력해주세요.");
								String sIndexPublisher = sc.nextLine();
								index.setPublisher(sIndexPublisher);
								System.out.println("[안내메시지] 출판사 검색 결과");
								dao.bookIndexSelect("출판사", index);
								break;
								
							case 4:
								System.out.println("☞ 검색하실 저자를 입력해주세요.");
								String sIndexWriter = sc.nextLine();
								index.setWriter(sIndexWriter);
								System.out.println("[안내메시지] 저자 검색 결과");
								dao.bookIndexSelect("저자", index);
								break;
								
							case 5:
								System.out.println("☞ 검색하실 분류번호를 입력해주세요.");
								int iIndexClassno = sc.nextInt();
								sc.nextLine();
								index.setClassno(iIndexClassno);
								System.out.println("[안내메시지] 분류번호 검색 결과");
								dao.bookIndexSelect("분류번호", index);
								break;
								
							case 6:
								System.out.println("☞ 검색하실 등록일자을 입력해주세요.(년(yy)/월(mm))");
								String sIndexRegistdate = sc.nextLine();
								index.setsRegistdate(sIndexRegistdate);
								System.out.println("[안내메시지] 등록일자 검색 결과");
								dao.bookIndexSelect("등록일자(년/월)", index);
								break;
								
							default :
								System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
						}
						break;
						
					case 3 :			
						dao.rentalpossibleBook(); // 대여가능한 책 출력
						long lRentalIsbn;
						while(true) {
							System.out.println("☞ 대여하실 도서의 도서번호를 입력 해주세요.");
							lRentalIsbn = sc.nextLong();
							sc.nextLine();
							if(dao.IsBookSelect(lRentalIsbn)==true) {
								break;
							} else {
								System.out.println("[안내메시지] 도서관에 없는 책입니다. 도서번호를 정확히 입력해주세요.");
							}
						}
						
						String shipwhether;
						while(true) {
							System.out.println("☞ 배달신청을 하시겠습니까?(Y/N)");
							String shipwhetherchoice = sc.nextLine();
							if(shipwhetherchoice.toUpperCase().equals("Y")) {
								shipwhether = "O";
								break;
							} else if (shipwhetherchoice.toUpperCase().equals("N")) {
								shipwhether = "X";
								break;
							} else {
								System.out.println("[안내메시지] Y/N으로 입력해주세요.");
							}
						}
						dao.rentalInsert(new Rental(userno,lRentalIsbn,shipwhether,"X","X"));
						
						List<Rental> rentalisbnlist = dao.rentalIsbnPrint();
						for(Rental r:rentalisbnlist) {
						// 대여테이블에 isbn이 있으면, 대여여부에 O넣기
							if(dao.IsRentalSelect("isbn", new Rental(r.getlIsbn())) == true) { //대여테이블에 해당 isbn이 있으면
									dao.bookWhetherAdd("O",r.getlIsbn());
								}
						} 
						
						if (shipwhether.equals("O")) {
							List<Rental> rentaldeliverylist = dao.delieveryAddInfo("대여배달",userno);
							
							for(Rental r2:rentaldeliverylist) {
							dao.rentalDelieveryInsert(new Delivery(r2.getsRentalno(),userno)); // 대여테이블 번호 입력
							}
						}
						break;
						
						
					default :
						System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
					}
				}
			} else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택하세요.");
			}
	}
}

class Book{
	private long isbn; //도서번호
	private String bname; //도서명
	private String publisher; //출판사
	private String writer; //저자
	private String genre; //장르
	private int price; //가격
	private String sRegistdate; // 등록일자
	private String rentalwhether; //대여여부
	private int classno; //분류번호
	public Book() {
		super();
	}
	public Book(long isbn, String bname, String publisher, String writer, String genre, int price, String sRegistdate,
			String rentalwhether, int classno) {
		super();
		this.isbn = isbn;
		this.bname = bname;
		this.publisher = publisher;
		this.writer = writer;
		this.genre = genre;
		this.price = price;
		this.sRegistdate = sRegistdate;
		this.rentalwhether = rentalwhether;
		this.classno = classno;
	}
	
	public Book(String bname) {
		super();
		this.bname = bname;
	}

	public Book(long isbn) {
		super();
		this.isbn = isbn;
	}
	public long getIsbn() {
		return isbn;
	}
	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getsRegistdate() {
		return sRegistdate;
	}
	public void setsRegistdate(String sRegistdate) {
		this.sRegistdate = sRegistdate;
	}
	public String getRentalwhether() {
		return rentalwhether;
	}
	public void setRentalwhether(String rentalwhether) {
		this.rentalwhether = rentalwhether;
	}
	public int getClassno() {
		return classno;
	}
	public void setClassno(int classno) {
		this.classno = classno;
	}	
}
