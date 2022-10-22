package javaexp.teamproject2;

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
	private PreparedStatement pstmt;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
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
			System.out.println("도서번호\t도서명\t출판사\t저자\t장르\t가격\t등록일자\t대여여부\t분류번호");
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
			DB.close(rs, stmt, con);
		}
		
	}
// ----------------------------------------------도서수정 기능메서드--------------------------------------------------------------------

	public void bookUpdate(long updateisbn, int i,Book upbook) {
		
		String sql =  " UPDATE books\r\n ";

		switch(i) {
		case 1 : 		
			sql +=  " SET ISBN ="+upbook.getIsbn()+"\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 2 : 
			sql +=  " SET BNAME  = '"+upbook.getBname()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 3 : 
			sql +=  " SET PUBLISHER = '"+upbook.getPublisher()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 4 : 
			sql +=  " SET WRITER = '"+upbook.getWriter()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 5 : 
			sql +=  " SET GENRE = '"+upbook.getGenre()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 6 : 
			sql +=  " SET PRICE = "+upbook.getPrice()+"\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 7 :
			sql +=  " SET REGISTDATE = '"+upbook.getsRegistdate()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 8 :
			sql +=  " SET RENTALWHETHER = '"+upbook.getRentalwhether()+"'\r\n "
					+ "	WHERE isbn = "+updateisbn;
			break;
			
		case 9 :
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
	public void bookDelete(int delisbn) {
		String sql = "DELETE FROM books WHERE isbn = " + delisbn;
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.commit();
			
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
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	public void BookMenu() {
		while(true) {
			System.out.println("☞ 도서메뉴를 고르세요.");
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
							int sIsbn = sc.nextInt();
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
								DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
								sRegistdate = now.format(dateTimeFormatter); //현재시각
							}else { // 입력받으면,
								sRegistdate = sInputRegistdate; //입력받은 값
							}
							String sRentalWhether = null;
							
							dao.classficationListAllPrint();
							System.out.print("☞ 분류번호(※위에 보기중에 선택) : "); // 도서분류 조건중에 입력하게끔 조건걸기
							int iclassno = sc.nextInt();
							
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
					
					System.out.println("☞ 다음 중 수정할 도서번호를 입력하세요.");
					long iUpdateBook = sc.nextLong();
					sc.nextLine();
					
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
							dao.bookUpdate(iUpdateBook,1,upb);
							System.out.println("[안내메시지] 도서번호 변경이 완료되었습니다.");
							break;
							
						case 2 : 
							System.out.print("☞ 변경할 도서명: ");
							String sUpdateBname = sc.nextLine();
							upb.setBname(sUpdateBname);
							dao.bookUpdate(iUpdateBook,2,upb);
							System.out.println("[안내메시지] 도서명 변경이 완료되었습니다.");
							break;
							
						case 3 : 
							System.out.print("☞ 변경할 출판사: ");
							String sUpdatePublisher = sc.nextLine();
							upb.setPublisher(sUpdatePublisher);
							dao.bookUpdate(iUpdateBook,3,upb);
							System.out.println("[안내메시지] 출판사 변경이 완료되었습니다.");
							break;
							
						case 4 : 
							System.out.print("☞ 변경할 저자: ");
							String sUpdateWriter = sc.nextLine();
							upb.setWriter(sUpdateWriter);
							dao.bookUpdate(iUpdateBook,4,upb);
							System.out.println("[안내메시지] 저자 변경이 완료되었습니다.");
							break;
						
						case 5 :
							System.out.print("☞ 변경할 장르: ");
							String sUpdateGenre = sc.nextLine();
							upb.setGenre(sUpdateGenre);
							dao.bookUpdate(iUpdateBook,5,upb);
							System.out.println("[안내메시지] 장르 변경이 완료되었습니다.");
							break;
							
						case 6 :
							System.out.print("☞ 변경할 가격: ");
							int iUpdatePrice = sc.nextInt();
							upb.setPrice(iUpdatePrice);
							dao.bookUpdate(iUpdateBook,6,upb);
							System.out.println("[안내메시지] 가격 변경이 완료되었습니다.");
							break;
							
						case 7 :
							System.out.print("☞ 변경할 등록일자: ");
							String sUpdateRegistdate = sc.nextLine();
							upb.setsRegistdate(sUpdateRegistdate);
							dao.bookUpdate(iUpdateBook,7,upb);
							System.out.println("[안내메시지] 등록일자 변경이 완료되었습니다.");
							break;
							
						case 8 :	
							System.out.print("☞ 변경할 대여여부: ");
							String sUpdaterentalwhether = sc.nextLine();
							upb.setRentalwhether(sUpdaterentalwhether);
							dao.bookUpdate(iUpdateBook,8,upb);
							System.out.println("[안내메시지] 대여여부 변경이 완료되었습니다.");
							break;
							
						case 9 :
							System.out.print("☞ 변경할 분류번호: ");
							int sUpdateclassno = sc.nextInt();
							upb.setClassno(sUpdateclassno);
							dao.bookUpdate(iUpdateBook,9,upb);
							System.out.println("[안내메시지] 분류번호 변경이 완료되었습니다.");
							break;
							
						default :
							System.out.println("[안내메시지] 보기에 있는 메뉴를 선택해주세요.");
							break;	
					}
				
					break;
					
				case 4 :
					dao.bookListAllPrint();
					System.out.println("☞ 다음 중 삭제할 도서번호를 입력하세요.");
					int iDeleteBookIsbn = sc.nextInt();
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

	public Book(int isbn) {
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
