package javaexp.a12_io;

import java.io.File;
import java.io.IOException;

public class A09_File {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 파일 입출력
		 1. File 클래스
		 	1) 파일 시스템의 파일을 표현하는 클래스
		 		- 파일의 크기, 파일 속성, 파일 이름 등의 정보 제공
		 		- 파일 생성 및 삭제 기능 제공
		 		- 디렉토리 생성, 디렉토리 존재하는 파일 리스트 얻어내는 기능 제공
		 	2) 파일 객체 생성
		 		File file = new File("c:\\aa\aa.txt");
		 		File fil2 = new File("c:/aa/aa.txt");
		 	3) 파일 또는 디렉토리 존재 유무 확인 메서드
		 		boolean isExist = file.exists()
		 	4) 파일 및 디렉토리 생성 및 삭제 메소드
		 		boolean createNewFile() 새로운 파일을 생성
		 		boolean mkdir() 새로운 파일을 생성
		 		boolean madirs() 경로상에 없는 모든 디렉토리를 생성
		 		boolean delete() 파일 또는 디렉토리 삭제
		 */
		 String file01 = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\A01_Basic.java";
		 String file02 = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\Z01_Test.txt";
		 String path = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\a12_io\\a01_path";
		 File f01 = new File(file01);
		 File f02 = new File(file02);
		 File f03 = new File(path);
		 System.out.println(f01.exists());
		 System.out.println(f02.exists());
			 try {
				 if(!f01.exists()) f01.createNewFile();
				 if(!f02.exists()) f02.createNewFile();
				 if(!f03.exists()) f03.mkdir();	// 디렉토리 경로 설정
				 File f04 = new File("Z02_test.txt");
				 if(f04.exists()) f04.createNewFile();
				 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // a12_io>Z01_Test.txt 파일/a01_path경로 생성
			 //ex) a12_io 하위에 z01_path 경로를 만들고, 
			 //		그 하위에 a01_show.txt, a02_show.txt 파일을 생성하세요.
			 String pathex = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\z01_path";
			 String file1 = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\a01_show.txt";
			 String file2 = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_ioa02_show.txt";
			 File f1 = new File(pathex);
			 if(!f1.exists()) f1.mkdir();
			 File f2 = new File(file1);
			 File f3 = new File(file2);
				try {
					 if(!f2.exists()) f2.createNewFile();
					 if(!f3.exists()) f3.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	 
			 /*
			  # 파일 및 디렉토리 정보 리턴 메소드
			  boolean canExecute() : 실행 파일 여부
			  boolean canRead() : 읽을 수 있는지 여부
			  boolean canWrite() : 쓸수 있는지 여부
			  String getName() : 파일의 이름 리턴
			  String getParent() : 부모 디렉토리 리턴
			  File getParentFile() : 부모 디렉토리를 File 객체로 생성 후 리턴
			  String getPath() : 전체 경로 리턴
			  boolean isDirectory() : 디렉토리인지 여부
			  boolean isFile() : 파일인지 여부
			  long length() : 파일의 크기 리턴
			  String[] list() : 디렉토리에 포함되 파일 및 서브디렉토리 목록 배열로 리턴
			  File[] listFiles() : 디렉토리에 포함된 파일 및 서브 디렉토리 목록 전부를 File배열로 리턴
			  */
		 }
	}


