package javaexp.teamproject2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
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

// ---------------------------------------------- 도서조회 기능메서드	--------------------------------------------------------------------
//		public List<Book> bookSelect(Book name) {
//			List <Book> list = new ArrayList<Book>();
	public void bookSelect(String name) {
			
				try {
					con = DB.con();
					String sql = "SELECT * FROM books \r\n"
							+ "WHERE bname LIKE '%'||'"+name+"'||'%'";
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
//				System.out.println("도서번호\t도서명\t출판사\t저자\t장르\t가격\t등록일자\t대여여부\t분류번호");
					while(rs.next()) {
						System.out.println("도서번호: "+rs.getLong("isbn"));
						System.out.println("도서명: "+rs.getString("bname"));
						System.out.println("출판사: "+rs.getString("publisher"));
						System.out.println("저자: "+rs.getString("writer"));
						System.out.println("장르: "+rs.getString("genre"));
						System.out.println("가격: "+rs.getInt("price"));
						System.out.println("등록일자: "+rs.getString("registdate"));
						System.out.println("대여여부: "+rs.getString("rentalwhether"));
						System.out.println("분류번호: "+rs.getInt("classno"));
					}
				} catch (SQLException e) {
					System.out.println("DB처리예외:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타예외:"+e.getMessage());
				} finally {
					DB.close(rs, stmt, con);
				}
//				return list;
	}
// ----------------------------------------------도서등록 기능메서드--------------------------------------------------------------------
	public void bookInsert(Book add) {
		String sql = "INSERT INTO books values(?,?,?,?,?,?,?,?,?)";
	
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, add.getIsbn());
				pstmt.setString(2, add.getBname());
				pstmt.setString(3, add.getPublisher());
				pstmt.setString(4, add.getWriter());
				pstmt.setString(5, add.getGenre());
				pstmt.setInt(6, add.getPrice());
				pstmt.setString(7, add.getRegistdate());
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
	public void bookUpdate(Emp upt) {
		String sql =  "";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			
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
			
			int iBookInsertMenu = sc.nextInt();
			sc.nextLine();
			
			switch(iBookInsertMenu) {
			case 1 : 
				System.out.println("[안내메시지] 도서번호 변경이 완료되었습니다.");
			case 2 : 
				System.out.println("[안내메시지] 도서명 변경이 완료되었습니다.");
			case 3 : 
				System.out.println("[안내메시지] 출판사 변경이 완료되었습니다.");
			case 4 : 
				System.out.println("[안내메시지] 저자 변경이 완료되었습니다.");
			case 5 : 
				System.out.println("[안내메시지] 장르 변경이 완료되었습니다.");
			case 6 : 
				System.out.println("[안내메시지] 가격 변경이 완료되었습니다.");
			case 7 : 
				System.out.println("[안내메시지] 등록일자 변경이 완료되었습니다.");
			case 8 : 
				System.out.println("[안내메시지] 대여여부 변경이 완료되었습니다.");
			case 9 : 
				System.out.println("[안내메시지] 분류번호 변경이 완료되었습니다.");
			}
			
			int cnt = stmt.executeUpdate(sql);
			System.out.println("수정 데이터:"+cnt);
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
			DB.close(rs, stmt, con);
		}
		
	}
// ----------------------------------------------도서삭제 기능메서드--------------------------------------------------------------------
	public void bookDelete(int empno) {
		String sql = "";
	
		try {
			con = DB.con();
			// autocommit : false
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			int cnt = stmt.executeUpdate(sql);
			System.out.println("삭제 데이터:"+cnt);
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
			DB.close(rs, stmt, con);
		}
		
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println("☞ 도서메뉴를 고르세요.");
			System.out.println("1:도서조회");
			System.out.println("2:도서추가");
			System.out.println("3:도서수정");
			System.out.println("4:도서삭제");
			int iBookMenu = sc.nextInt();
			sc.nextLine(); //int 입력 초기화 처리
			switch(iBookMenu) {
				case 1:
					System.out.println("☞ 어떤 도서를 조회하겠습니까?");
					System.out.println("[안내메시지] 도서명으로 검색해주세요!");
					String sBookChoice = sc.nextLine();
					dao.bookSelect(sBookChoice);
					break;
				case 2:
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
							System.out.print("☞ 가격: ");
							int iPrice = sc.nextInt();
							sc.nextLine();
							System.out.print("☞ 등록일자(※ 기재 안할시, 현재날짜 등록): ");
							String sInputRegistdate = sc.nextLine();
							if (sInputRegistdate) {
							String sRegistdate = sc.nextLine();
							}
							String sRentalWhether = null;
							
//							System.out.print("☞ 대여여부(O/X): "); // 책정보에 쓸필요없는듯...
//							String sRentalWhether = sc.nextLine();
//							if(sRentalWhether.toUpperCase().equals("O")) {
//								
//							} else if(sRentalWhether.toUpperCase().equals("X")){
//								
//							} else {
//								System.out.println("O/X로 입력해주세요.");
//							}
							System.out.print("☞ 분류번호: ");
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
				case 3:
					break;
				case 4:
					break;
			}
		}
		
		

	}
}

class Book{
	private int isbn; //도서번호
	private String bname; //도서명
	private String publisher; //출판사
	private String writer; //저자
	private String genre; //장르
	private int price; //가격
	private String registdate; // 등록일자
	private String rentalwhether; //대여여부
	private int classno; //분류번호
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(int isbn, String bname, String publisher, String writer, String genre, int price, String registdate,
			String rentalwhether, int classno) {
		super();
		this.isbn = isbn;
		this.bname = bname;
		this.publisher = publisher;
		this.writer = writer;
		this.genre = genre;
		this.price = price;
		this.registdate = registdate;
		this.rentalwhether = rentalwhether;
		this.classno = classno;
	}
	public Book(String bname) {
		super();
		this.bname = bname;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
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
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
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
