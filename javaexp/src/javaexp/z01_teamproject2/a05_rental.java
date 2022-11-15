package javaexp.z01_teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;

public class a05_rental {
	static  a05_rental dao = new  a05_rental();
	static Scanner sc = new Scanner(System.in);
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
// ---------------------------------------------대여/연체 갯수 업데이트-----------------------------------------	
	public void rentalAndOverdueCntUpdate(String userno,SignUp update) {
		String sql = "UPDATE BOOKUSER \r\n"
					+ "SET rentalcnt = ?,\r\n"
					+ "overduecnt = ?\r\n"
					+ "WHERE USERNO = ?\r\n"
					+ "AND div = 'user'"; 
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setInt(1, update.getRentalcnt());
				pstmt.setInt(2, update.getOverduecnt());
				pstmt.setString(3, userno);
				
				rs = pstmt.executeQuery();
				con.commit();
				
		} catch (SQLException e) {
			System.out.println("DB 처리:"+e.getMessage());
			System.out.println("[안내메시지] 대여/연체 갯수 반영이 안되었습니다. 관리자에게 문의하세요.");
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

// ---------------------------------------------대여갯수 조회-----------------------------------------
	public int rentalcnt(String userno) {
		String sql = "SELECT count(*) rentalcnt FROM rental\r\n"
				+ "WHERE userno = '"+userno+"'";
		
		int rentalcnt = 0; 
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rentalcnt = rs.getInt("rentalcnt");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
		return rentalcnt;
	}	
	
// ---------------------------------------------연체갯수 조회-----------------------------------------
	public int overduecnt(String userno) {
		String sql = "SELECT count(*) overduecnt FROM rental \r\n"
				+ "WHERE userno = '"+ userno +"'\r\n"
				+ "AND (((sysdate-rentaldate) >= 14\r\n"
				+ "AND (rentaldate-returndate) IS NULL)\r\n"
				+ "OR (returndate-rentaldate) >= 14)";
		
		int overduecnt = 0; 
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				overduecnt = rs.getInt("overduecnt");
			}
			
		} catch (SQLException e) {
			System.out.println("기타 sql 처리 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}finally {
			if(rs==null) System.out.println("[안내메시지] 등록된 도서가 없습니다.");
			DB.close(rs, stmt, con);
		}
		return overduecnt;
	}	
	
// --------------------------------------------- 반납 배달 날짜 데이터 넣기-----------------------------------------
	public void returnDelieveryUpdate(Delivery add,String userno) {
		String sql = "INSERT INTO ship values('ABC'||shipno_seq.nextval,NULL,sysdate+2, ?, ?)"; 
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, add.getsRentalno());
				pstmt.setString(2, userno);
				
				System.out.println("[안내메시지] 회원님의 반납배달등록이 완료되었습니다.\n");
				
				rs = pstmt.executeQuery();
				
		} catch (SQLException e) {
			System.out.println("DB 처리:"+e.getMessage());
			System.out.println("[안내메시지] 반납 배달처리가 안되었습니다. 관리자에게 문의하세요.");
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
// --------------------------------------------- 대여 배달 테이블 데이터 넣기-----------------------------------------
	public void rentalDelieveryInsert(Delivery add) {
		String sql = "INSERT INTO ship values('ABC'||shipno_seq.nextval, sysdate+2, null, ?, ?)"; 
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, add.getsRentalno());
			pstmt.setString(2, add.getsUserno());
			
			System.out.println("[안내메시지] 회원님의 대여배달등록이 완료되었습니다.\n");
			
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
// --------------------------------------------- 배달 테이블 데이터 조회-----------------------------------------
	public void deliveryPrint(String shipUserMgr, String userno) {
		String sql = "select s.*,r.*\r\n"
				+ "FROM ship s,rental r\r\n"
				+ "WHERE s.RENTALNO = r.RENTALNO\r\n";
				
		switch(shipUserMgr) {
			case "전체" :
				break;
				
			case "사용자" :
				sql += "AND s.userno = '"+userno+"'";
				break;
				
			default :
				System.out.println("[안내메시지] 조회할 사용자/전체 중 고르세요.");
		}
				
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println("배달번호: "+rs.getString("shipno"));
				System.out.println("대여배달날짜: "+rs.getString("rentalshipdate"));
				System.out.println("반납배달날짜: "+rs.getString("returnshipdate"));
				System.out.println("대여번호: "+rs.getString("rentalno"));
				System.out.println("회원번호: "+rs.getString("userno"));
				System.out.println("도서번호(isbn): "+rs.getLong("isbn"));
				System.out.println("대여날짜: "+rs.getString("rentaldate"));
				System.out.println("대여배달신청여부: "+rs.getString("rentalshipwhether"));
				System.out.println("반납날짜: "+rs.getString("returndate"));
				System.out.println("반납여부: "+rs.getString("returnwhether"));
				System.out.println("반납배달신청여부:"+rs.getString("returnshipwhether")+"\n");
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
	
// ---------------------------------------------- 도서대여가능여부 기능메서드--------------------------------------------------------------------
	public boolean IsBookSelect(Long isbn) { 
			
			boolean bReturn = false;
			String sql = "SELECT * \r\n"
						+ "FROM books\r\n"
						+ "WHERE isbn = '" + isbn + "'\r\n"
						+ "AND rentalwhether = 'X'";
			
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
// ---------------------------------------------- 도서테이블 출력 기능메서드	--------------------------------------------------------------------
		public void bookListAllPrint() {
			String sql = "select * FROM books";
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
// ---------------------------------------------- 연체자 정보 조회 기능메서드 --------------------------------------------------------------------			
	public List<SignUp> delayUserPush(int userno) {
	 	List<SignUp> list = new ArrayList<SignUp>();
					
				String sql ="SELECT * FROM bookUser\r\n"
						+ "WHERE userno = '"+userno+"'";
				
				try {
					con=DB.con();
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						SignUp s = new SignUp(rs.getString("userno"),
												rs.getString("div"),
												rs.getString("uname"),
												rs.getString("rrn"),
												rs.getString("address"),
												rs.getString("phone_number"),
												rs.getString("id"),
												rs.getString("password"),
												rs.getInt("rentalcnt")
												);
						list.add(s);
					}
					
					while(rs.next()) {
						System.out.println("회원번호: "+rs.getString("userno"));
						System.out.println("회원이름: "+rs.getString("uname"));
						System.out.println("회원전화번호: "+rs.getString("phone_number"));
						System.out.println("회원아이디: "+rs.getString("id"));
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
//---------------------------------------------- 대여날짜 조회 기능메서드	--------------------------------------------------------------------
	public void delayreturn(){
		String sql = "SELECT * FROM rental \r\n"
				+ "WHERE (sysdate-rentaldate) >= 14\r\n" // 현재날짜가 14일이상이고, 반납일자가 입력되지 않을 때,
				+ "AND (rentaldate-returndate) IS NULL\r\n"
				+ "OR (returndate-rentaldate) >= 14";	// 또는, 대여기간이 14일 넘었을때,
		
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("대여번호: "+rs.getString("rentalno"));
					System.out.println("회원번호: "+rs.getString("userno"));
					System.out.println("도서번호: "+rs.getLong("isbn"));
					System.out.println("대여날짜: "+rs.getString("rentaldate"));
					System.out.println("배송여부: "+rs.getString("rentalshipwhether"));
					System.out.println("반납일자: "+rs.getString("returndate"));
					System.out.println("반납여부: "+rs.getString("returnwhether"));
					System.out.println("반납배송여부: "+rs.getString("returnshipwhether")+"\n");
				}
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
		}
//-----------------------------------------------------------대여번호로 isbn추출(반납)---------------------------------------------------------------------------
	public List<Rental> returnisbnPrint(Rental rentalno) {
		List<Rental> retlist = new ArrayList<Rental>();
		
		String sql = "SELECT isbn FROM rental\r\n"
				+ "WHERE rentalno = '"+rentalno.getsRentalno()+"'";	
		
			try {
				con = DB.con();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					Rental r = new Rental(
								rs.getLong("isbn")
							);
					retlist.add(r);
				};
				
			} catch (SQLException e) {
				System.out.println("기타 sql 처리 예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			}finally {
				DB.close(rs, stmt, con);
			}
			return retlist;
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

//-------------------------------------------------------- 회원대여정보 조회 기능메서드 ------------------------------------------------------
	public List<Rental> rentalUserSelect(String userno){
		List<Rental> list = new ArrayList<Rental>();
		
		String sql = "SELECT rentalno,userno,r.isbn,b.bname,shipwhether,returndate,returnwhether\r\n"
				+ "FROM rental r, books b\r\n"
				+ "where r.isbn=b.isbn\r\n"
				+ "AND userno = "+userno+"'";
		
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
			
				System.out.println("# 나의 대여정보 #");
				while(rs.next()) {
						System.out.println("대여번호: "+rs.getString("rentalno"));
						System.out.println("회원번호: "+rs.getString("userno"));
						System.out.println("도서번호: "+rs.getLong("isbn"));
						System.out.println("도서명: "+ rs.getString("bname"));
						System.out.println("배송여부: "+rs.getString("shipwhether")); // 배송여부 물어보고 데이터 넣기
						System.out.println("반납일자: "+rs.getString("returndate"));  // 반납일자 입력받은 date 등록 ( 대
						System.out.println("반납여부: "+rs.getString("returnwhether")); //반납입력받기 (관리자)
				};
				
			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
			return list;
	}
//------------------------------------------------------- 회원 반납/미반납 정보 출력(배송 반납 처리 신청) ------------------------------------------------
		public void notReturnAllPrint(String returnUpDown, String userno) { 
			String sql = "SELECT * FROM rental\r\n";
					
			switch(returnUpDown) {
			case "미반납" :
				sql += "WHERE userno = '"+userno+"'\r\n"
						+ "AND returnwhether  = 'X'";
				break;
				
			case "전체" :
				sql += "WHERE userno ='"+userno+"'";
				break;
				
			default : 
				System.out.println("[안내메시지] 전체/미반납 조회중에 골라주세요.");
			}			
						
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					System.out.println("대여번호: "+rs.getString("rentalno"));
					System.out.println("회원번호: "+rs.getString("userno"));
					System.out.println("도서번호: "+rs.getLong("isbn"));
					System.out.println("대여날짜: "+rs.getString("rentaldate"));
					System.out.println("배송여부: "+rs.getString("rentalshipwhether"));
					System.out.println("반납일자: "+rs.getString("returndate"));
					System.out.println("반납여부: "+rs.getString("returnwhether"));
					System.out.println("반납배송여부: "+rs.getString("returnshipwhether")+"\n");
				};
				
				int cnt = stmt.executeUpdate(sql);
				if (cnt < 1) { // 테이블에 데이터가 없을 경우
					System.out.println("[안내메시지] 대여정보가 없습니다.");
				}

			} catch (SQLException e) {
				System.out.println("DB처리예외:"+e.getMessage());
			} catch (Exception e) {
				System.out.println("기타예외:"+e.getMessage());
			} finally {
				DB.close(rs, stmt, con);
			}
		}
	
//------------------------------------------------------- 회원대여정보 전체조회(반납/미반납 구분) 기능메서드(관리자) ------------------------------------------------
	public void rentalAllPrint(String sReturnUpDown) { 
		String sql = "SELECT * FROM rental\r\n";
		
		switch(sReturnUpDown) {
			case "반납":
				sql += "WHERE RETURNWHETHER = 'O'\r\n"
						+ "AND returndate IS not null";
				break;
				
			case "미반납":
				sql +=  "WHERE RETURNWHETHER = 'X'\r\n"
						+ "AND returndate IS null";
				break;
				
			case "전체":
				break;
			
			default :
				System.out.println("[안내메시지]반납/미반납 여부를 입력해주세요.\n");
		}	
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("대여번호: "+rs.getString("rentalno"));
				System.out.println("회원번호: "+rs.getString("userno"));
				System.out.println("도서번호: "+rs.getLong("isbn"));
				System.out.println("대여날짜: "+rs.getString("rentaldate"));
				System.out.println("배송여부: "+rs.getString("rentalshipwhether"));
				System.out.println("반납일자: "+rs.getString("returndate"));
				System.out.println("반납여부: "+rs.getString("returnwhether"));
				System.out.println("반납배송여부: "+rs.getString("returnshipwhether")+"\n");
			};
			
			int cnt = stmt.executeUpdate(sql);
			if (cnt < 1) { // 테이블에 데이터가 없을 경우
				System.out.println("[안내메시지] 대여정보가 없습니다.");
			}

			
			
		} catch (SQLException e) {
			System.out.println("DB처리예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
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
	
// ----------------------------------------------------- 대여테이블 수정(반납등록) 기능메서드 -------------------------------------------------------------------
		public void returnupUpdate(Rental turn) {
			String sql = "UPDATE rental\r\n"
						+ "SET returnwhether = ?,\r\n"
						+ " 	returndate = sysdate,\r\n"
						+ " 	returnshipwhether = ?\r\n"
						+ "WHERE rentalno= ?\r\n"
						+ "AND returndate is NULL\r\n"
						+ "AND returnwhether='X'";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, turn.getsReturnwhether());
				pstmt.setString(2, turn.getsReturnShipwhether());
				pstmt.setString(3, turn.getsRentalno());
				
				rs = pstmt.executeQuery();
				
				System.out.println("[안내메시지]"+ turn.getsRentalno()+"이 반납처리가 완료되었습니다.\n");
				
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
		
//----------------------------------------------------- 대여테이블 수동삭제(관리자) 기능메서드 ---------------------------------------------------	
		public void rentalMgrDelete(String rentalno) {
			
			String sql = "DELETE FROM rental WHERE rentalno = '"+rentalno+"'";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				System.out.println("[안내메시지] 선택하신 대여정보가 삭제 완료되었습니다.\n");
				
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
		
//---------------------------------------------------- 대여테이블 반납완료 시, 자동삭제 기능메서드 ------------------------------------------------	
	public void rentalAutoDelete(String removedate) {
		String sql = "DELETE FROM rental \r\n"
				+ " WHERE returndate='"+removedate+"'\r\n"
				+ "	AND returnwhether ='O'"; //반납여부가 O이면서, 반납일자가 2일지나서 자동삭제
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
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
			DB.close(rs, stmt, con);
		}	
	}
	
//-------------------------------------------------출력 기능메서드 main()문----------------------------------------
//	public static void main(String[] args) {
		// TODO Auto-generated method stub
	public void RentalMenu(String auth, String userno) {
		
		while(true) {
//			System.out.println("☞ 관리자/사용자 중 무엇입니까?");
//			String auth = sc.nextLine();
			if(auth.equals("관리자")) {
				while(true) {
					System.out.println("☞ 다음 대여 메뉴 중 선택해주세요.");
					System.out.println("1: 대여조회");
					System.out.println("2: 대여정보 삭제하기");
					System.out.println("3: 사용자 반납등록하기(관리자)"); // 가서 책반납
					System.out.println("4: 연체자 조회"); // 연체시, 문자전송(대여못하게하기) // 대여날짜 +14일 이면 대여자에게 문자전송 [web발신전송] 
														// -> 시간남으면 대여못하게하기 (회원번호로 설정)
					System.out.println("5: 배달서비스 신청 조회");
					
					int iRentalMenuChoice = sc.nextInt();
					sc.nextLine();
					
				
					switch(iRentalMenuChoice) {
						case 1:
							while(true) {
								System.out.println("☞ 대여 조회 메뉴를 고르세요.");
								System.out.println("1: 대여전체조회(반납/미반납)");
								System.out.println("2: 대여반납조회");
								System.out.println("3: 대여미반납조회");
								int iRentalSelectChoice = sc.nextInt();
								sc.nextLine();
								switch(iRentalSelectChoice) {
									
									case 1:
										dao.rentalAllPrint("전체");
										break;
										
									case 2:
										dao.rentalAllPrint("반납");
										break;
										
									case 3:
										dao.rentalAllPrint("미반납");
										break;
										
									default :
										System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
								}
							
							break;
					}
						break;
							
						case 2:
							while(true) {
								System.out.println("☞ 대여 정보를 삭제하시겠습니까?(Y/N)");
								String rantalremovequestion = sc.nextLine();
								
								if(rantalremovequestion.toUpperCase().equals("Y")) {
									dao.rentalAllPrint("전체");
									while(true) {
										System.out.println("☞ 삭제하실 대여번호를 입력해주세요.");
										String sRemoveRentalno = sc.nextLine();
										if(dao.IsRentalSelect("rentalno", new Rental(sRemoveRentalno)) == true){
											dao.rentalMgrDelete(sRemoveRentalno);
											break;
										} else {
											System.out.println("[안내메시지] 없는 대여번호입니다. 대여번호를 정확히 다시 입력해주세요.");
										}
									}
							
									break;
								} else if(rantalremovequestion.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
				break; // 대여메뉴로 돌아가기
							}
							
							break;
							
						case 3: // 반납시, 책테이블에 대여여부 X 삽입
							while(true) {
								System.out.println("☞ 회원이 책을 반납하였습니까?(Y/N)");
								String returnup = sc.nextLine();
								
								if(returnup.toUpperCase().equals("Y")) {
									dao.rentalAllPrint("미반납"); //미반납 대여정보 조회
									String returnrentalno;
									while(true) {
										System.out.println("☞ 반납하실 대여번호를 입력해주세요.");
										returnrentalno =sc.nextLine();
										
										if(dao.IsRentalSelect("rentalno", new Rental(returnrentalno)) == true){
											dao.returnupUpdate(new Rental(returnrentalno,"O","X"));
											break;
										} else {
											System.out.println("[안내메시지] 없는 대여번호입니다. 대여번호를 정확히 다시 입력해주세요.");
										}
									}
									// 대여번호로 isbn추출하기
									List<Rental> rentalisbnlist = dao.returnisbnPrint(new Rental(returnrentalno));
									for(Rental r:rentalisbnlist) {
										dao.bookWhetherAdd("X",r.getlIsbn());
									}
									break; // 책반납여부 break;
									
								} else if(returnup.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}

							break; //case break
							
						case 4:
							dao.delayreturn();
							while(true) {
								System.out.println("☞ 연체자에게 반납을 독촉하겠습니까?(Y/N)");
								String sDelayUserPush = sc.nextLine();
								if(sDelayUserPush.toUpperCase().equals("Y")) {
									
									int pushUserno;
									while(true) {
										System.out.println("☞ 어떤 회원에게 독촉하시겠습니까?(회원번호 입력)");
										pushUserno = sc.nextInt();
										sc.nextLine();
										
										if(dao.IsRentalSelect("returnwhether",new Rental(pushUserno))==true) { // 입력값의 테이블에 데이터가 있으면, 답변입력란으로 넘어감
											break;
										} else {
											System.out.println("[안내메시지] 요청하신 회원은 반납하였습니다. \n");
											;
										}
									}
									List<SignUp> relayRentalList = dao.delayUserPush(pushUserno);
									for(SignUp userinfo1:relayRentalList) {
										System.out.println("회원번호: "+userinfo1.getUserno());
										System.out.println("회원이름: "+userinfo1.getUname());
										System.out.println("회원전화번호: "+userinfo1.getPhone_Number());
										System.out.println("회원아이디: "+userinfo1.getId());
									}
									while(true) {
										System.out.println("☞ 문자를 전송하시겠습니까?(Y/N)");
										String sMessagePush = sc.nextLine();
										
										if(sMessagePush.toUpperCase().equals("Y")) {
											
											List<SignUp> relaySmsList = dao.delayUserPush(pushUserno);
											for(SignUp userinfo2:relaySmsList) {
												System.out.println("[Web 발신] \""+userinfo2.getUname()+"("+userinfo2.getPhone_Number()+")\"에게 반납 독촉 문자가 전송되었습니다.");
											}
											break;
		
										} else if(sMessagePush.toUpperCase().equals("N")) {
											System.out.println("[안내메시지] 미반납자에게 반납독촉 우편을 전송하시기 바랍니다.");
											
											List<SignUp> relaypostList = dao.delayUserPush(pushUserno);
											for(SignUp userinfo3:relaypostList) {
												System.out.println("미반납자 이름:"+userinfo3.getUname());
												System.out.println("미반납자 주소:"+userinfo3.getAddress());
												System.out.println("미반납자 전화번호:"+userinfo3.getPhone_Number());
											}
											System.out.println("[뒤로가기]");
											break;
											
										} else {
											System.out.println("[안내메시지] Y/N으로 입력해주세요.");
										}
									}
								
									break;
									
								} else if (sDelayUserPush.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}
							break;
						case 5: 
							dao.deliveryPrint("전체", userno);
							// 배달서비스 신청 조회 ==> 대여테이블과 배달테이블 조인해서 조회  
							break;
							
						default:
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
					}
				}
				
			} else if (auth.equals("사용자")) {
				while(true) {
					System.out.println("☞ 다음 대여 메뉴 중 선택해주세요.");
					System.out.println("1: 도서전체조회");
					System.out.println("2: 도서검색하기");
					System.out.println("3: 대여하기");
					System.out.println("4: 반납 배송 신청하기(회원)");
					System.out.println("5: 대여조회하기");
					System.out.println("6: 배달서비스 신청조회");
					int rentalUserMenu = sc.nextInt();
					sc.nextLine();
					
					Book index = new Book();
					
					switch(rentalUserMenu) {
						case 1 :
							dao.bookListAllPrint();
							break;
							
						case 2 : 
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
							
						case 3 : //대여하기시, 책테이블에 해당 책 대여여부 O삽입
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
							
						case 4 : // 반납시, 책테이블에 대여여부 X 삽입
							
							while(true) {
								System.out.println("☞ 책을 반납하시겠습니까?(Y/N)"); //사용자반납시, 배달 반납신청
								String returnUserup = sc.nextLine();
								
								if(returnUserup.toUpperCase().equals("Y")) {
									dao.notReturnAllPrint("미반납",userno);
									String returnUserRentalno;
									while(true) {
										System.out.println("☞ 반납하실 대여번호를 입력해주세요.");
										returnUserRentalno =sc.nextLine();
										
										if(dao.IsRentalSelect("rentalno", new Rental(returnUserRentalno)) == true){
											dao.returnupUpdate(new Rental(returnUserRentalno,"O","O"));
											break;
										} else {
											System.out.println("[안내메시지] 없는 대여번호입니다. 대여번호를 정확히 다시 입력해주세요.");
										}
									}
									List<Rental> returnisbnlist = dao.returnisbnPrint(new Rental(returnUserRentalno));
									for(Rental r:returnisbnlist ) {
										dao.bookWhetherAdd("X",r.getlIsbn());
									}
									
									List<Rental> returnshiplist = dao.delieveryAddInfo("반납배달",userno);
									for(Rental r : returnshiplist ) {
									dao.returnDelieveryUpdate(new Delivery(r.getsRentalno()),userno); // 대여테이블 번호 입력
									}
					
									break; // 책반납여부 break;
									
								} else if(returnUserup.toUpperCase().equals("N")) {
									System.out.println("[뒤로가기]");
									break;
									
								} else {
									System.out.println("[안내메시지] Y/N으로 입력해주세요.");
								}
							}
							break;
							
						case 5 : 
							// 반납 조회
							dao.notReturnAllPrint("전체",userno);
							break;
							
						case 6:
							// 배달서비스 신청조회
							dao.deliveryPrint("사용자",userno);
							break;
							
						default :
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
					}
				}
				
			} else {
				System.out.println("[안내메시지]관리자/사용자 중에 선택해주세요.");
			}
			break; // 관리자/사용자 선택
		}
		dao.rentalAndOverdueCntUpdate(userno, new SignUp(dao.rentalcnt(userno),dao.overduecnt(userno)));
	}

}
//------------------------------------------대여 멤버 변수------------------------------------
class Rental {
	private String sRentalno; // 대여번호
	private String sUserno; //회원번호
	private long lIsbn; // 책번호
	private String sRentaldate; // 대여날짜
	private String sShipwhether; // 배송여부
	private String sRenturndate; // 반납날짜
	private String sReturnwhether; // 반납여부
	private String sReturnShipwhether;
	private String sBname;
	
	
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Rental(String sRentalno) {
		super();
		this.sRentalno = sRentalno;
	}

	public Rental(long lIsbn) {
		super();
		this.lIsbn = lIsbn;
	}
	
	public Rental(String sRentalno, long lIsbn) {
		super();
		this.sRentalno = sRentalno;
		this.lIsbn = lIsbn;
	}
	
	public Rental(String sRentalno, String sUserno) {
		super();
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
	}

	public Rental(String sRentalno, String sReturnwhether, String sReturnShipwhether) {
		super();
		this.sRentalno = sRentalno;
		this.sReturnwhether = sReturnwhether;
		this.sReturnShipwhether = sReturnShipwhether;
	}

	public Rental(String sUserno, long lIsbn, String sShipwhether, String sReturnwhether, String sReturnShipwhether) {
		super();
		this.sUserno = sUserno;
		this.lIsbn = lIsbn;
		this.sShipwhether = sShipwhether;
		this.sReturnwhether = sReturnwhether;
		this.sReturnShipwhether = sReturnShipwhether;
	}

	public Rental(String sRentalno, String sUserno, long lIsbn, String sShipwhether, String sReturnwhether,
			String sReturnShipwhether, String sBname) {
		super();
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
		this.lIsbn = lIsbn;
		this.sShipwhether = sShipwhether;
		this.sReturnwhether = sReturnwhether;
		this.sReturnShipwhether = sReturnShipwhether;
		this.sBname = sBname;
	}

	public Rental(String sRentalno, String sUserno, long lIsbn, String sRentaldate, String sShipwhether,
			String sRenturndate, String sReturnwhether, String sBname) {
		super();
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
		this.lIsbn = lIsbn;
		this.sRentaldate = sRentaldate;
		this.sShipwhether = sShipwhether;
		this.sRenturndate = sRenturndate;
		this.sReturnwhether = sReturnwhether;
		this.sBname = sBname;
	}

	public Rental(String sUserno, long lIsbn, String sRentaldate, String sShipwhether, String sRenturndate,
			String sReturnwhether, String sReturnShipwhether) {
		super();
		this.sUserno = sUserno;
		this.lIsbn = lIsbn;
		this.sRentaldate = sRentaldate;
		this.sShipwhether = sShipwhether;
		this.sRenturndate = sRenturndate;
		this.sReturnwhether = sReturnwhether;
		this.sReturnShipwhether = sReturnShipwhether;
	}

	public String getsRentalno() {
		return sRentalno;
	}

	public void setsRentalno(String sRentalno) {
		this.sRentalno = sRentalno;
	}

	public String getsUserno() {
		return sUserno;
	}

	public void setsUserno(String sUserno) {
		this.sUserno = sUserno;
	}

	public long getlIsbn() {
		return lIsbn;
	}

	public void setlIsbn(long lIsbn) {
		this.lIsbn = lIsbn;
	}

	public String getsRentaldate() {
		return sRentaldate;
	}

	public void setsRentaldate(String sRentaldate) {
		this.sRentaldate = sRentaldate;
	}

	public String getsShipwhether() {
		return sShipwhether;
	}

	public void setsShipwhether(String sShipwhether) {
		this.sShipwhether = sShipwhether;
	}

	public String getsRenturndate() {
		return sRenturndate;
	}

	public void setsRenturndate(String sRenturndate) {
		this.sRenturndate = sRenturndate;
	}

	public String getsReturnwhether() {
		return sReturnwhether;
	}

	public void setsReturnwhether(String sReturnwhether) {
		this.sReturnwhether = sReturnwhether;
	}
	
	public String getsReturnShipwhether() {
		return sReturnShipwhether;
	}

	public void setsReturnShipwhether(String sReturnShipwhether) {
		this.sReturnShipwhether = sReturnShipwhether;
	}

	public String getsBname() {
		return sBname;
	}

	public void setsBname(String sBname) {
		this.sBname = sBname;
	}
}
//------------------------------------------배달 멤버변수------------------------------
class Delivery{
	private String sShipno;
	private String sRentalshipdate;
	private String sReturnshipdate;
	private String sRentalno;
	private String sUserno;
	public Delivery() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Delivery(String sRentalno) {
		super();
		this.sRentalno = sRentalno;
	}
	
	public Delivery(String sRentalno, String sUserno) {
		super();
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
	}

	public Delivery(String sRentalshipdate, String sRentalno, String sUserno) {
		super();
		this.sRentalshipdate = sRentalshipdate;
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
	}

	public Delivery(String sShipno, String sRentalshipdate, String sReturnshipdate, String sRentalno, String sUserno) {
		super();
		this.sShipno = sShipno;
		this.sRentalshipdate = sRentalshipdate;
		this.sReturnshipdate = sReturnshipdate;
		this.sRentalno = sRentalno;
		this.sUserno = sUserno;
	}

	public String getsShipno() {
		return sShipno;
	}

	public void setsShipno(String sShipno) {
		this.sShipno = sShipno;
	}

	public String getsRentalshipdate() {
		return sRentalshipdate;
	}

	public void setsRentalshipdate(String sRentalshipdate) {
		this.sRentalshipdate = sRentalshipdate;
	}

	public String getsReturnshipdate() {
		return sReturnshipdate;
	}

	public void setsReturnshipdate(String sReturnshipdate) {
		this.sReturnshipdate = sReturnshipdate;
	}

	public String getsRentalno() {
		return sRentalno;
	}

	public void setsRentalno(String sRentalno) {
		this.sRentalno = sRentalno;
	}

	public String getsUserno() {
		return sUserno;
	}

	public void setsUserno(String sUserno) {
		this.sUserno = sUserno;
	}
	
	
}
